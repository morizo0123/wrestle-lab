import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/events/screens/events_screen.dart';
import 'package:wrestle_lab/features/root/root_layout.dart';
import 'package:wrestle_lab/features/home/screens/home_tab_screen.dart';
import 'package:wrestle_lab/features/my_history/screens/history_screen.dart';
import 'package:wrestle_lab/features/news/screens/news_screen.dart';
import 'package:wrestle_lab/features/organizations/screens/organization_webview_screen.dart';
import 'package:wrestle_lab/features/organizations/screens/organizations_screen.dart';
import 'package:wrestle_lab/features/youtube_search/screens/youtube_screen.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

final appRouter = GoRouter(
  initialLocation: RoutePathName.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return RootLayout(child: child);
      },
      routes: [
        GoRoute(
          path: RoutePathName.home,
          name: RoutePathName.homeName,
          builder: (context, state) => const HomeTabScreen(),
        ),
        GoRoute(
          path: RoutePathName.events,
          name: RoutePathName.eventsName,
          builder: (context, state) => const EventsScreen(),
        ),
        GoRoute(
          path: RoutePathName.organizations,
          name: RoutePathName.organizationsName,
          builder: (context, state) => const OrganizationsScreen(),
        ),
        GoRoute(
          path: RoutePathName.youtube,
          name: RoutePathName.youtubeName,
          builder: (context, state) => const YoutubeScreen(),
        ),
        GoRoute(
          path: RoutePathName.myHistory,
          name: RoutePathName.myHistoryName,
          builder: (context, state) => const HistoryScreen(),
        ),
        GoRoute(
          path: RoutePathName.news,
          name: RoutePathName.newsName,
          builder: (context, state) => const NewsScreen(),
        ),
      ],
    ),

    // Shell外のページ（WebViewなど）
    GoRoute(
      path: RoutePathName.organizationWeb,
      name: RoutePathName.organizationWebName,
      builder: (context, state) {
        final url = state.uri.queryParameters['url'];
        final name = state.uri.queryParameters['name'] ?? '公式サイト';

        if (url == null) {
          return const Scaffold(body: Center(child: Text('URLがありません')));
        }

        return OrganizationWebViewScreen(url: url, name: name);
      },
    ),
  ],
);
