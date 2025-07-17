import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
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
        'id': history.id,
        'event_date': history.eventDate,
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
                'event_date': history.eventDate,
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
}
