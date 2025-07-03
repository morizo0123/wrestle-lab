# wrestle lab

プロレス情報を管理・閲覧するための個人用Flutterアプリ

## アプリ概要

**wrestle lab**は、プロレスファンのための情報管理アプリです。試合スケジュール、団体情報、観戦履歴、最新ニュースを一つのアプリで管理できます。

このプロジェクトは、Flutter開発スキルの習得と実践的なアーキテクチャの理解を目的として開発されています。

## 主な機能

| 機能 | 説明 |
|------|------|
| **ホーム** | 各機能へのナビゲーション |
| **イベントカレンダー** | 新日本・ノアなど各団体の試合スケジュール表示 |
| **団体一覧** | プロレス団体の公式サイトをWebViewで閲覧 |
| **YouTube検索** | 団体名やキーワードでプロレス動画を検索・再生 |
| **観戦履歴** | 自分が観戦した興行の記録・管理 |
| **ニュース** | プロレス関連の最新ニュースを一覧表示 |

## 技術スタック

### フレームワーク・言語
- **Flutter** - クロスプラットフォーム開発
- **Dart** - プログラミング言語

### アーキテクチャ
- **MVVM + Riverpod** - 状態管理とアーキテクチャパターン

### 主要ライブラリ
- **flutter_riverpod** - 状態管理
- **go_router** - ルーティング
- **supabase_flutter** - データベース・認証
- **webview_flutter** - WebView表示
- **freezed** - データモデル生成
- **dio** - HTTP通信

### バックエンド・API
- **Supabase** - データベース（PostgreSQL）・認証
- **YouTube Data API** - 動画検索
- **Google RSS** - ニュース取得

## プロジェクト構成

```
lib/
├── core/                 # 共通定数・テーマ・ユーティリティ
├── features/             # 機能別フォルダ
│   ├── home/            # ホーム画面
│   ├── events/          # イベントカレンダー
│   ├── organizations/   # 団体一覧
│   ├── youtube_search/  # YouTube検索
│   ├── my_history/      # 観戦履歴
│   └── news/           # ニュース一覧
├── shared/              # 共通ウィジェット・Provider
├── routes/              # go_routerルーティング定義
└── main.dart           # アプリエントリーポイント
```

### 各feature内の構成
```
features/example/
├── models/          # データモデル（freezed）
├── repositories/    # データアクセス層
├── services/        # 外部API・Supabaseラッパー
├── viewmodels/      # 状態管理（AsyncNotifier）
├── screens/         # UI画面
│   └── widgets/     # 画面専用ウィジェット
└── constants.dart   # ローカル定数
```

## 開発目的

- Flutterアプリの設計から実装、デプロイまでの一連の流れを習得
- MVVM + Riverpodによる実践的な状態管理の理解
- Supabaseを使用したリアルタイムデータベース連携
- 保守性の高いコード構成とアーキテクチャの体得

---

**注意**: このアプリは個人利用を目的としており、App StoreやGoogle Play Storeへの公開は予定していません。