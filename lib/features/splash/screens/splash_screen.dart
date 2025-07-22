import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000), // 1.0秒のアニメーション
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      _animationController.forward().then((_) {
        context.go(RoutePathName.home);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1633C),
      // body: _buildBody()
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(scale: _scaleAnimation, child: _buildBody()),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Image.asset('assets/images/logo.png', width: 200, height: 200),
    );
  }
}
