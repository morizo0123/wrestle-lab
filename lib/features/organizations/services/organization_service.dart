import 'package:wrestle_lab/features/organizations/models/organization.dart';

abstract class OrganizationService {
  Future<List<Organization>> getOrganizations();
}