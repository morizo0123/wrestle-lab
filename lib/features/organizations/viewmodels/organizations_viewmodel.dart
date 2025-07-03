import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wrestle_lab/features/organizations/models/organization.dart';
import 'package:wrestle_lab/features/organizations/repositories/organization_repository.dart';
import 'package:wrestle_lab/features/organizations/repositories/organization_repository_impl.dart';
import 'package:wrestle_lab/features/organizations/services/organization_service.dart';
import 'package:wrestle_lab/features/organizations/services/organization_service_impl.dart';

part 'organizations_viewmodel.freezed.dart';
part 'organizations_viewmodel.g.dart';

@riverpod
OrganizationRepository organizationRepository(OrganizationRepositoryRef ref) {
  return OrganizationRepositoryImpl();
}

@riverpod
OrganizationService organizationService(OrganizationServiceRef ref) {
  return OrganizationServiceImpl(ref.read(organizationRepositoryProvider));
}

@freezed
abstract class OrganizationsViewState with _$OrganizationsViewState {
  const factory OrganizationsViewState({
    @Default([]) List<Organization> data,
    @Default(false) bool isLoading,
    String? error,
  }) = _OrganizationsViewState;
}

@riverpod
class OrganizationsViewModel extends _$OrganizationsViewModel {
  @override
  OrganizationsViewState build() {
    return const OrganizationsViewState();
  }

  Future<void> fetchOrganizations() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(organizationServiceProvider);
      final data = await service.getOrganizations();

      state = state.copyWith(data: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
