import 'package:wrestle_lab/features/organizations/models/organization.dart';
import 'package:wrestle_lab/features/organizations/repositories/organization_repository.dart';
import 'package:wrestle_lab/features/organizations/services/organization_service.dart';

class OrganizationServiceImpl implements OrganizationService {
  final OrganizationRepository _repository;

  OrganizationServiceImpl(this._repository);

  @override
  Future<List<Organization>> getOrganizations() async {
    return _repository.getOrganizations();
  }
}