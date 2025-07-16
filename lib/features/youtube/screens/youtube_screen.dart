import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/screens/widgets/youtube_item_widget.dart';
import 'package:wrestle_lab/features/youtube/screens/widgets/youtube_player_bottomsheet.dart';
import 'package:wrestle_lab/features/youtube/viewmodels/youtube_viewmodel.dart';

class YoutubeScreen extends ConsumerStatefulWidget {
  const YoutubeScreen({super.key});

  @override
  ConsumerState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends ConsumerState<YoutubeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  String? nextPageToken;
  late TabController _tabController;
  Set<String> favoriteVideoIds = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: YoutubeConstants.categories.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);

    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(youtubeViewModelProvider.notifier)
          .loadVideosByKeyword(
            keyword: YoutubeConstants.defaultCategory,
            nextPageToken: null,
          );
    });

    // 初期化時にお気に入り状態を取得
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final ids =
        await ref.read(youtubeViewModelProvider.notifier).getFavoriteVideoIds();
    setState(() {
      favoriteVideoIds = ids;
    });
  }

  void _onTabChanged() {
    // true: タブ切り替えアニメーション中, false: タブ切り替え完了済み
    if (!_tabController.indexIsChanging) return;

    final selectedCategory = YoutubeConstants.categories[_tabController.index];

    ref
        .read(youtubeViewModelProvider.notifier)
        .loadVideosByKeyword(keyword: selectedCategory, nextPageToken: null);
  }

  void _onScroll() {}

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(youtubeViewModelProvider);
    final viewModel = ref.read(youtubeViewModelProvider.notifier);

    return _buildBody(viewState, viewModel);
  }

  Widget _buildBody(YoutubeViewState viewState, YoutubeViewModel viewModel) {
    return Column(
      children: [
        // タブバー
        Container(
          height: 50,
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
            tabs:
                YoutubeConstants.categories
                    .map((category) => Tab(text: category))
                    .toList(),
          ),
        ),

        // ビデオリスト
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children:
                YoutubeConstants.categories
                    .map((category) => _buildVideoList(viewState, viewModel))
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoList(
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
            Text(viewState.error!),
            ElevatedButton(onPressed: () {}, child: const Text('再試行')),
          ],
        ),
      );
    }

    if (viewState.videos.isEmpty) {
      return const Center(child: Text('動画がありません'));
    }

    return ListView.separated(
      controller: _scrollController,
      itemCount: viewState.videos.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final video = viewState.videos[index];
        return YoutubeItemWidget(
          video: video,
          isFavorite: favoriteVideoIds.contains(video.videoId),
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
          (context) => YoutubePlayerBottomsheet(
            video: video,
            isFavorite: favoriteVideoIds.contains(video.videoId),
          ),
    );
  }

  void _onFavoritePressed(YoutubeVideo video) async {
    ref.read(youtubeViewModelProvider.notifier).toggleFavorite(video);

    // お気に入り削除後、一覧を更新
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(youtubeViewModelProvider.notifier).loadFavoriteVideos();
    });

    // お気に入り状態を更新
    await _loadFavoriteStatus();
  }

  void _onSharePressed(YoutubeVideo video) {
    ref.read(youtubeViewModelProvider.notifier).shareVideo(video);
  }
}
