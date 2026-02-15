import 'package:flutter/services.dart';

/// Configuration for bullet point formatting
class BulletConfig {
  static const String bullet = '🐾 ';
}

/// Analyzes text content to extract line information
class LineAnalyzer {
  /// Gets the current line at cursor position
  static String getCurrentLine(String text, int cursorPosition) {
    final String beforeCursor = text.substring(0, cursorPosition);
    final int lastNewlineIndex = beforeCursor.lastIndexOf('\n');
    
    return lastNewlineIndex == -1
        ? beforeCursor
        : beforeCursor.substring(lastNewlineIndex + 1);
  }

  /// Checks if a line contains only a bullet point
  static bool isLineOnlyBullet(String line) {
    return line.trim() == BulletConfig.bullet.trim();
  }

  /// Checks if a line has content beyond the bullet
  static bool hasContentBeyondBullet(String line) {
    return !isLineOnlyBullet(line);
  }
}

/// Handles initial text input (when field is empty)
class InitialTextHandler {
  static TextEditingValue handle(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.isEmpty &&
        newValue.text.isNotEmpty &&
        !newValue.text.startsWith(BulletConfig.bullet)) {
      final String newText = BulletConfig.bullet + newValue.text;
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        ),
      );
    }

    return newValue;
  }
}

/// Handles newline input and bullet point creation
class NewlineHandler {
  static TextEditingValue? handle(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= oldValue.text.length) {
      return null;
    }

    final String added = newValue.text.substring(
      oldValue.text.length,
      newValue.text.length,
    );

    if (added != '\n') {
      return null;
    }

    final String beforeCursor =
        newValue.text.substring(0, newValue.selection.start - 1);
    final String currentLine = LineAnalyzer.getCurrentLine(
      beforeCursor,
      beforeCursor.length,
    );

    // Only add new bullet if current line has content
    if (LineAnalyzer.hasContentBeyondBullet(currentLine)) {
      final String afterCursor =
          newValue.text.substring(newValue.selection.start);
      final String newText =
          beforeCursor + '\n' + BulletConfig.bullet + afterCursor;

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.selection.start + BulletConfig.bullet.length),
        ),
      );
    }

    return null;
  }
}

/// Main formatter that orchestrates text input formatting
class UnorderedListFormatter extends TextInputFormatter {
  static const String bullet = BulletConfig.bullet;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Try initial text handling
    final TextEditingValue initialResult =
        InitialTextHandler.handle(oldValue, newValue);
    if (initialResult != newValue) {
      return initialResult;
    }

    // Try newline handling
    final TextEditingValue? newlineResult =
        NewlineHandler.handle(oldValue, newValue);
    if (newlineResult != null) {
      return newlineResult;
    }

    return newValue;
  }
}
