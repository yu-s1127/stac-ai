# Stac AI Assistant

StacフレームワークとGemini AIを融合させた動的UIアシスタントアプリケーション

## 概要

このアプリは、Server-Driven UI (SDUI) フレームワークであるStacとGoogle Gemini AIを組み合わせて、ユーザーの質問に応じて動的にUIを生成する革新的なアシスタントアプリです。

## 主な機能

- **AI会話インターフェース**: Gemini AIを使用した自然な対話
- **動的UI生成**: ユーザーの質問内容に応じて最適なUIを自動生成
- **マルチモーダル表示**: テキスト、リスト、フォーム、チャート、カレンダー、地図など多様なUI表現
- **リアルタイムストリーミング**: AI応答をリアルタイムで表示

## セットアップ

### 1. 環境変数の設定

`.env`ファイルを作成し、Gemini APIキーを設定してください：

```bash
cp .env.example .env
```

`.env`ファイルを編集：
```
GEMINI_API_KEY=your_gemini_api_key_here
```

### 2. 依存関係のインストール

```bash
flutter pub get
```

### 3. アプリの実行

```bash
flutter run
```

## 技術スタック

- **Flutter**: クロスプラットフォームアプリ開発
- **Stac**: Server-Driven UI フレームワーク
- **Google Gemini AI**: 自然言語処理
- **Riverpod**: 状態管理
- **flutter_dotenv**: 環境変数管理

## アーキテクチャ

```
lib/
├── main.dart           # エントリーポイント
├── core/              # コアビジネスロジック
│   ├── ai/           # AI関連（Gemini統合、UI解析）
│   └── stac/         # Stac JSON生成
├── screens/          # 画面UI
│   ├── home_screen.dart    # ホーム画面
│   └── chat_screen.dart    # チャット画面
└── widgets/          # 再利用可能ウィジェット
```

## 動的UI生成の仕組み

1. ユーザーがAIに質問を送信
2. Gemini AIが自然言語で応答
3. UIAnalyzerが応答を解析し、適切なUIタイプを判定
4. JsonGeneratorがStac用のJSONを生成
5. Stacフレームワークが動的にUIをレンダリング

## サポートされているUIタイプ

- テキスト表示
- リスト表示
- フォーム入力
- チャート/グラフ
- カレンダー
- 地図
- 計算機
- 画像表示
- テーブル

## 今後の機能拡張予定

- 会話履歴の永続化
- お気に入り機能
- より高度な動的UIコンポーネント
- 音声入力/読み上げ機能
- オフライン対応