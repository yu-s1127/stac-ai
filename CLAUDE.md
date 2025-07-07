# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリで作業する際のガイダンスを提供します。

## プロジェクト概要

`stac_ai`という名前のFlutterクロスプラットフォームモバイルアプリケーションプロジェクトです。iOS、Android、Web、Linux、macOS、Windowsプラットフォームをサポートしています。

## 開発コマンド

### 基本コマンド
- `flutter pub get` - 依存関係のインストール/更新
- `flutter run` - デバッグモードでアプリを実行
- `flutter test` - すべてのテストを実行
- `flutter analyze` - flutter_lintsによる静的コード解析を実行

### ビルドコマンド
- `flutter build apk` - Android APKをビルド
- `flutter build ios` - iOSアプリをビルド（Xcodeが必要）
- `flutter build web` - Web版をビルド
- `flutter build macos` - macOSデスクトップアプリをビルド
- `flutter build windows` - Windowsデスクトップアプリをビルド
- `flutter build linux` - Linuxデスクトップアプリをビルド

### テストコマンド
- `flutter test test/widget_test.dart` - 特定のテストファイルを実行
- `flutter test --coverage` - カバレッジレポート付きでテストを実行

## 技術的な詳細

- **Dart SDK**: ^3.8.1
- **リンティング**: コード品質のために`flutter_lints` (^5.0.0)で設定
- **テスト**: `/test/`にあるFlutter組み込みのテストフレームワークを使用

## プロジェクトの目標

StacフレームワークとAIを融合させた動的UIアシスタントアプリケーションの開発:
- **Stacフレームワーク**: JSON駆動の動的UI生成
- **AI統合**: 自然言語処理による知的な応答
- **動的UI生成**: ユーザーの質問に応じたリアルタイムUI適応

## アプリケーション設計

### 主要機能
1. **AI会話インターフェース**: チャットベースのAI対話
2. **動的UIコンポーネント**: Stacによるコンテキスト対応UI生成
3. **マルチモーダル応答**: テキスト、フォーム、グラフ、地図、カレンダー等
4. **データ永続化**: 会話履歴とお気に入り保存

### 画面構成
- **ホーム画面**: クイックアクセスと最近の会話
- **チャット画面**: AI対話と動的UIエリア
- **履歴画面**: 過去の会話と保存項目
- **設定画面**: API設定と各種設定

## 開発ルール

### パッケージインストール規則
**重要**: すべてのパッケージはコマンドラインからインストールすること:
1. `flutter pub add <パッケージ名>` でパッケージを追加
2. 手動で`pubspec.yaml`を編集した場合は `flutter pub get` を実行
3. IDEの自動インポート機能は使用禁止

### 必須パッケージ（実装時にコマンドラインで追加）
```bash
flutter pub add stac  # 動的UIフレームワーク（必須）
flutter pub add dio  # API通信
flutter pub add sqflite  # ローカルDB
flutter pub add riverpod  # 状態管理
flutter pub add flutter_tts  # 音声読み上げ
flutter pub add speech_to_text  # 音声入力
```

### プロジェクト構成
```
lib/
├── main.dart           # Stac初期化を含むエントリーポイント
├── core/              # コアビジネスロジック
│   ├── ai/           # AI API統合
│   ├── stac/         # Stac JSONジェネレーター
│   └── models/       # データモデル
├── screens/          # 画面UI
├── widgets/          # 再利用可能ウィジェット
└── services/         # DB、キャッシュ等のサービス
```

### 実装ガイドライン
1. main()でStac.initialize()を必ず呼び出す
2. MaterialAppの代わりにStacAppを使用
3. UI種別ごとにモジュール化されたJSONジェネレーターを作成
4. AI API呼び出しには適切なエラーハンドリングを実装
5. オフライン対応のためStac JSONテンプレートをキャッシュ

### 技術調査

技術に関して、自己のデータを鵜呑みにせずWeb検索を積極的に実施し、正しい情報を見極めてください。
`gemini`はGoogle産のCLIのAIエージェントツールです。Web検索用に利用ができます。


GeminiでWeb検索を実施する際のコマンドは `gemini -p 'WebSearch: ...'`.

```bash
gemini -p "WebSearch: ..."
```