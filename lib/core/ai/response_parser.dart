import 'dart:convert';

class ParsedResponse {
  final String textContent;
  final Map<String, dynamic>? stacJson;

  ParsedResponse({
    required this.textContent,
    this.stacJson,
  });
}

class ResponseParser {
  static ParsedResponse parse(String response) {
    // <STAC_JSON>タグを探す
    final stacJsonRegex = RegExp(
      r'<STAC_JSON>(.*?)</STAC_JSON>',
      dotAll: true,
    );
    
    final match = stacJsonRegex.firstMatch(response);
    
    if (match != null) {
      final jsonString = match.group(1)?.trim() ?? '';
      final textContent = response.replaceAll(stacJsonRegex, '').trim();
      
      try {
        final stacJson = json.decode(jsonString) as Map<String, dynamic>;
        return ParsedResponse(
          textContent: textContent,
          stacJson: stacJson,
        );
      } catch (e) {
        // JSON解析エラーの場合は、テキストのみ返す
        return ParsedResponse(
          textContent: response,
          stacJson: null,
        );
      }
    }
    
    // Stac JSONが含まれていない場合
    return ParsedResponse(
      textContent: response,
      stacJson: null,
    );
  }
}