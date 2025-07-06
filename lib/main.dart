import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository_impl.dart';
import 'package:wrestle_lab/features/news/services/news_service_impl.dart';
import 'package:wrestle_lab/routes/app_router.dart';
import 'package:wrestle_lab/core/constants.dart';
import 'features/news/models/news_item.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  );
  // await testNewsService();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
    );
  }
}

Future<void> testNewsRepository() async {
  final repository = NewsRepositoryImpl();
  try {
    final news = await repository.getNewsItem(keyword: '新日本プロレス');
    print('ニュース取得成功: ${news.length}');
  } catch (e) {
    print('エラー: $e');
  }
}

Future<void> testNewsService() async {
  final repository = NewsRepositoryImpl();
  final service = NewsServiceImpl(repository);

  try {
    print('=== Service層テスト開始 ===');
    final news = await service.getAllWrestlingNews();
    print('統合ニュース取得成功: ${news.length}件');

    // 最初の3件を表示
    print('\n--- 最初の3件 ---');
    for (NewsItem item in news.take(3)) {
      print('タイトル: ${item.title}');
      print('URL: ${item.link}');
      print('日付: ${item.pubDate}');
      print('---');
    }

    // 重複チェック（URLが重複していないか）
    final urls = news.map((item) => item.link).toSet();
    print('\n重複チェック: 総記事数${news.length}件、ユニークURL数${urls.length}件');
  } catch (e) {
    print('エラー: $e');
  }
}
