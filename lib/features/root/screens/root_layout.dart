import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/root/screens/widgets/bottom_nav_bar.dart';
import 'package:wrestle_lab/routes/route_utils.dart';

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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
