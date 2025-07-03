import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wrestle_lab/features/organizations/models/organization.dart';
import 'package:wrestle_lab/features/organizations/repositories/organization_repository.dart';

class OrganizationRepositoryImpl implements OrganizationRepository {
  final SupabaseClient _client;

  OrganizationRepositoryImpl({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  @override
  Future<List<Organization>> getOrganizations() async {
    try {
      final response = await _client
          .from('organizations')
          .select()
          .order('id', ascending: true);
      final List<dynamic> data = response;
      return data.map((json) => Organization.fromJson(json)).toList();
    } catch (e) {
      throw Exception('団体の取得に失敗しました: $e');
    }
  }
}
