import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/events/screens/events_screen.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/screens/history_create_screen.dart';
import 'package:wrestle_lab/features/my_history/screens/history_detail_screen.dart';
import 'package:wrestle_lab/features/my_history/screens/history_edit_screen.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/features/news/screens/news_webview_screen.dart';
import 'package:wrestle_lab/features/root/root_layout.dart';
import 'package:wrestle_lab/features/home/screens/home_tab_screen.dart';
import 'package:wrestle_lab/features/my_history/screens/history_screen.dart';
import 'package:wrestle_lab/features/news/screens/news_screen.dart';
import 'package:wrestle_lab/features/organizations/screens/organization_webview_screen.dart';
import 'package:wrestle_lab/features/organizations/screens/organizations_screen.dart';
import 'package:wrestle_lab/features/splash/screens/splash_screen.dart';
import 'package:wrestle_lab/features/youtube/screens/favorite_videos_screen.dart';
import 'package:wrestle_lab/features/youtube/screens/youtube_screen.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

final appRouter = GoRouter(
  initialLocation: RoutePathName.splash,
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

    // splash
    GoRoute(
      path: RoutePathName.splash,
      name: RoutePathName.splashName,
      builder: (context, state) => const SplashScreen(),
    ),

    // 団体WebView
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

    // ニュースWebView
    GoRoute(
      path: RoutePathName.newsWeb,
      name: RoutePathName.newsWebName,
      builder: (context, state) {
        final newsItem = state.extra as NewsItem;
        return NewsWebviewScreen(newsItem: newsItem);
      },
    ),

    // お気に入り動画
    GoRoute(
      path: RoutePathName.youtubeFavoriteVideos,
      name: RoutePathName.youtubeFavoriteVideosName,
      builder: (context, state) => const FavoriteVideosScreen(),
    ),

    // 観戦記録作成
    GoRoute(
      path: RoutePathName.myHistoryCreate,
      name: RoutePathName.myHistoryCreateName,
      builder: (context, state) => const HistoryCreateScreen(),
    ),

    // 観戦記録詳細
    GoRoute(
      path: RoutePathName.myHistoryDetail,
      name: RoutePathName.myHistoryDetailName,
      builder: (context, state) {
        final history = state.extra as History;
        return HistoryDetailScreen(history: history);
      },
    ),

    // 観戦記録編集
    GoRoute(
      path: RoutePathName.myHistoryEdit,
      name: RoutePathName.myHistoryEditName,
      builder: (context, state) {
        final history = state.extra as History;
        return HistoryEditScreen(history: history);
      },
    ),
  ],
);
