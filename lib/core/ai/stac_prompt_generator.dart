import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prompts.dart';

final stacPromptGeneratorProvider = Provider<StacPromptGenerator>((ref) {
  return StacPromptGenerator();
});

class StacPromptGenerator {
  String generateSystemPrompt() {
    return Prompts.stacSystemPrompt;
  }

  String wrapUserMessage(String message) {
    return Prompts.createUserPrompt(message);
  }
}