import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'stac_prompt_generator.dart';

final geminiServiceProvider = Provider<GeminiService>((ref) {
  final promptGenerator = ref.read(stacPromptGeneratorProvider);
  return GeminiService(promptGenerator);
});

class GeminiService {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final StacPromptGenerator _promptGenerator;

  GeminiService(this._promptGenerator) {
    final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    if (apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY is not set in .env file');
    }

    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: apiKey,
      systemInstruction: Content.system(_promptGenerator.generateSystemPrompt()),
    );

    _chat = _model.startChat();
  }

  Stream<String> sendMessage(String message) async* {
    try {
      final wrappedMessage = _promptGenerator.wrapUserMessage(message);
      final response = _chat.sendMessageStream(Content.text(wrappedMessage));
      
      await for (final chunk in response) {
        if (chunk.text != null) {
          yield chunk.text!;
        }
      }
    } catch (e) {
      yield 'エラーが発生しました: $e';
    }
  }

}