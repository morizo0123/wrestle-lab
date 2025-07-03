import 'package:wrestle_lab/features/organizations/models/organization.dart';

abstract class OrganizationRepository {
  Future<List<Organization>> getOrganizations();
}