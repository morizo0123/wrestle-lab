import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/organizations/viewmodels/organizations_viewmodel.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class OrganizationsScreen extends ConsumerStatefulWidget {
  const OrganizationsScreen({super.key});

  @override
  ConsumerState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends ConsumerState<OrganizationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(organizationsViewModelProvider.notifier).fetchOrganizations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(organizationsViewModelProvider);

    return _buildBody(viewState);
  }

  Widget _buildBody(OrganizationsViewState viewState) {
    if (viewState.isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    if (viewState.error != null) {
      return Center(child: Text(viewState.error!));
    }

    if (viewState.data.isEmpty) {
      return Center(child: Text('No data'));
    }

    return ListView.builder(
      itemCount: viewState.data.length,
      itemBuilder: (context, index) {
        final org = viewState.data[index];
        return ListTile(
          title: Text(org.name),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            final encodeUrl = Uri.encodeComponent(org.officialUrl);
            final encodeName = Uri.encodeComponent(org.name);

            context.push(
              '${RoutePathName.organizationWeb}?url=$encodeUrl&name=$encodeName'
            );
          },
        );
      },
    );
  }
}
