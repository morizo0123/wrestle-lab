import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/models/organization.dart';
import 'package:wrestle_lab/features/my_history/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final SupabaseClient _client;

  HistoryRepositoryImpl({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  @override
  Future<List<History>> getHistories() async {
    try {
      final response = await _client
          .from('my_history')
          .select()
          .order('id', ascending: true);

      final List<dynamic> data = response;
      return data.map((json) => History.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<History> getHistoryById(int id) async {
    try {
      /**
       * select() -> 全カラム取得
       * eq('id', id) -> WHERE id = 指定されたid
       */
      final response =
          await _client.from('my_history').select().eq('id', id).single();

      return History.fromJson(response);
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> addHistory(History history) async {
    try {
      await _client.from('my_history').insert({
        'event_date': history.eventDate.toIso8601String().split('T')[0],
        'organization': history.organization,
        'event_name': history.eventName,
        'venue': history.venue,
        'review': history.review,
        'photo_url': history.photoUrl,
      });
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<History> updateHistory(int id, History history) async {
    try {
      final response =
          await _client
              .from('my_history')
              .update({
                'event_date': history.eventDate.toIso8601String().split('T')[0],
                'organization': history.organization,
                'event_name': history.eventName,
                'venue': history.venue,
                'review': history.review,
                'photo_url': history.photoUrl,
              })
              .eq('id', id)
              .select()
              .single();

      return History.fromJson(response);
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> deleteHistory(int id) async {
    try {
      await _client.from('my_history').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<List<Organization>> getOrganizations() async {
    try {
      final response = await _client
          .from('organizations')
          .select('name')
          .order('id', ascending: true);

      final List<dynamic> data = response;
      return data.map((json) => Organization.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    try {
      // ユニークなファイル名を生成
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}';
      final String filePath = 'history_photos/$fileName';

      // Supabase Storageにアップロード
      await _client.storage.from('photos').upload(filePath, imageFile);

      // 公開URLを取得
      final String publicUrl = _client.storage
          .from('photos')
          .getPublicUrl(filePath);

      return publicUrl;
    } on StorageException catch (e) {
      throw Exception('画像アップロードエラー: ${e.message}');
    } catch (e) {
      throw Exception('予期しないエラー: $e');
    }
  }
}
