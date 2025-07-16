import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/screens/widgets/youtube_item_widget.dart';
import 'package:wrestle_lab/features/youtube/screens/widgets/youtube_player_bottomsheet.dart';
import 'package:wrestle_lab/features/youtube/viewmodels/youtube_viewmodel.dart';

class FavoriteVideosScreen extends ConsumerStatefulWidget {
  const FavoriteVideosScreen({super.key});

  @override
  ConsumerState createState() => _FavoriteVideosScreenState();
}

class _FavoriteVideosScreenState extends ConsumerState<FavoriteVideosScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(youtubeViewModelProvider.notifier).loadFavoriteVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(youtubeViewModelProvider);
    final viewModel = ref.read(youtubeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'お気に入りの動画',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
            ref
                .read(youtubeViewModelProvider.notifier)
                .restoreCurrentCategoryVideos();
          },
        ),
      ),

      body: _buildFavoriteVideosList(viewState, viewModel),
    );
  }

  Widget _buildFavoriteVideosList(
    YoutubeViewState viewState,
    YoutubeViewModel viewModel,
  ) {
    if (viewState.isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    if (viewState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'エラーが発生しました\n${viewState.error}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.loadFavoriteVideos(),
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (viewState.favoriteVideos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text('お気に入りの動画がありません', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: viewState.favoriteVideos.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final video = viewState.favoriteVideos[index];
        return YoutubeItemWidget(
          video: video,
          isFavorite: true,
          onTap: () => _onVideoTap(video),
          onFavoritePressed: () => _onFavoritePressed(video),
          onSharePressed: () => _onSharePressed(video),
        );
      },
    );
  }

  void _onVideoTap(YoutubeVideo video) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => YoutubePlayerBottomsheet(video: video, isFavorite: true),
    );
  }

  void _onFavoritePressed(YoutubeVideo video) {
    ref.read(youtubeViewModelProvider.notifier).toggleFavorite(video);

    // お気に入り削除後、一覧を更新
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(youtubeViewModelProvider.notifier).loadFavoriteVideos();
    });
  }

  void _onSharePressed(YoutubeVideo video) {
    ref.read(youtubeViewModelProvider.notifier).shareVideo(video);
  }
}
