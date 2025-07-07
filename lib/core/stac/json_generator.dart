import 'package:flutter/material.dart';

/// STAC JSON生成ヘルパークラス
/// STAC 1.0.0-dev.5の期待するJSON形式を生成する
class StacJsonGenerator {
  /// テキストウィジェットのJSON生成
  static Map<String, dynamic> text(
    String text, {
    double? fontSize,
    String? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return {
      'type': 'text',
      'data': text,
      if (fontSize != null || color != null || fontWeight != null)
        'style': {
          if (fontSize != null) 'fontSize': fontSize,
          if (color != null) 'color': color,
          if (fontWeight != null) 'fontWeight': fontWeight.index,
        },
      if (textAlign != null) 'textAlign': textAlign.toString().split('.').last,
    };
  }

  /// コンテナウィジェットのJSON生成
  static Map<String, dynamic> container({
    Map<String, dynamic>? child,
    double? padding,
    EdgeInsets? paddingInsets,
    double? margin,
    EdgeInsets? marginInsets,
    String? color,
    double? borderRadius,
    double? width,
    double? height,
  }) {
    return {
      'type': 'container',
      if (child != null) 'child': child,
      if (padding != null) 'padding': padding,
      if (paddingInsets != null)
        'padding': {
          'left': paddingInsets.left,
          'top': paddingInsets.top,
          'right': paddingInsets.right,
          'bottom': paddingInsets.bottom,
        },
      if (margin != null) 'margin': margin,
      if (marginInsets != null)
        'margin': {
          'left': marginInsets.left,
          'top': marginInsets.top,
          'right': marginInsets.right,
          'bottom': marginInsets.bottom,
        },
      if (color != null || borderRadius != null)
        'decoration': {
          if (color != null) 'color': color,
          if (borderRadius != null) 'borderRadius': borderRadius,
        },
      if (width != null) 'width': width,
      if (height != null) 'height': height,
    };
  }

  /// カラムウィジェットのJSON生成
  static Map<String, dynamic> column({
    required List<Map<String, dynamic>> children,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return {
      'type': 'column',
      'children': children,
      if (mainAxisAlignment != null)
        'mainAxisAlignment': mainAxisAlignment.toString().split('.').last,
      if (crossAxisAlignment != null)
        'crossAxisAlignment': crossAxisAlignment.toString().split('.').last,
      if (mainAxisSize != null)
        'mainAxisSize': mainAxisSize.toString().split('.').last,
    };
  }

  /// ロウウィジェットのJSON生成
  static Map<String, dynamic> row({
    required List<Map<String, dynamic>> children,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return {
      'type': 'row',
      'children': children,
      if (mainAxisAlignment != null)
        'mainAxisAlignment': mainAxisAlignment.toString().split('.').last,
      if (crossAxisAlignment != null)
        'crossAxisAlignment': crossAxisAlignment.toString().split('.').last,
      if (mainAxisSize != null)
        'mainAxisSize': mainAxisSize.toString().split('.').last,
    };
  }

  /// アイコンウィジェットのJSON生成
  static Map<String, dynamic> icon(
    String iconName, {
    double? size,
    String? color,
  }) {
    return {
      'type': 'icon',
      'icon': iconName,
      if (size != null) 'size': size,
      if (color != null) 'color': color,
    };
  }

  /// カードウィジェットのJSON生成
  static Map<String, dynamic> card({
    Map<String, dynamic>? child,
    double? elevation,
    double? borderRadius,
  }) {
    return {
      'type': 'card',
      if (child != null) 'child': child,
      if (elevation != null) 'elevation': elevation,
      if (borderRadius != null) 'shape': {
        'borderRadius': borderRadius,
      },
    };
  }

  /// リストタイルウィジェットのJSON生成
  static Map<String, dynamic> listTile({
    Map<String, dynamic>? title,
    Map<String, dynamic>? subtitle,
    Map<String, dynamic>? leading,
    Map<String, dynamic>? trailing,
    bool? dense,
  }) {
    return {
      'type': 'listTile',
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (leading != null) 'leading': leading,
      if (trailing != null) 'trailing': trailing,
      if (dense != null) 'dense': dense,
    };
  }

  /// パディングウィジェットのJSON生成
  static Map<String, dynamic> padding({
    required Map<String, dynamic> child,
    double? all,
    EdgeInsets? insets,
  }) {
    return {
      'type': 'padding',
      'child': child,
      if (all != null) 'padding': all,
      if (insets != null)
        'padding': {
          'left': insets.left,
          'top': insets.top,
          'right': insets.right,
          'bottom': insets.bottom,
        },
    };
  }

  /// SizedBoxウィジェットのJSON生成
  static Map<String, dynamic> sizedBox({
    double? width,
    double? height,
    Map<String, dynamic>? child,
  }) {
    return {
      'type': 'sizedBox',
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (child != null) 'child': child,
    };
  }

  /// 天気情報UI生成
  static Map<String, dynamic> weatherUI({
    required String location,
    required String condition,
    required String temperature,
    required String iconName,
  }) {
    return card(
      child: padding(
        all: 16,
        child: column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(location, fontSize: 20, fontWeight: FontWeight.bold),
            sizedBox(height: 8),
            row(
              children: [
                icon(iconName, size: 48, color: '#FFA500'),
                sizedBox(width: 16),
                column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(condition, fontSize: 18),
                    text(temperature, fontSize: 24, fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      elevation: 4,
      borderRadius: 12,
    );
  }

}