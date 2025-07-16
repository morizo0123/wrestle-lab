import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/root/widgets/bottom_nav_bar.dart';
import 'package:wrestle_lab/features/root/app_title_mapper.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class RootLayout extends StatelessWidget {
  final Widget child;

  const RootLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final title = getTitleFromLocation(location);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: child,
      floatingActionButton: _buildFloatingActionButton(location, context),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget? _buildFloatingActionButton(String location, BuildContext context) {
    if (location == '/youtube') {
      return FloatingActionButton(
        onPressed: () => context.push(RoutePathName.youtubeFavoriteVideos),
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.favorite, color: Colors.white),
      );
    }

    return null;
  }
}
