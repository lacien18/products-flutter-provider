import 'package:flutter/services.dart';

/// The WhiteSpaceTextInputFormatter is a class in Dart that extends the FilteringTextInputFormatter and
/// disallows the use of whitespace characters.
class WhiteSpaceTextInputFormatter extends FilteringTextInputFormatter {
  WhiteSpaceTextInputFormatter() : super(' ', allow: false);
}
