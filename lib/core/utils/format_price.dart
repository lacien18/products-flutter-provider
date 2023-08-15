import 'package:intl/intl.dart';

abstract class CurrencyHelper {


  static const defaultFormat = r'$#,##0.#';
  static const defaultFallback = r'$0.00';
  static const defaultAccountNumber = '***0';

   static String formatNumber(
    num number, {
    String format = defaultFormat,
    String fallback = defaultFallback,
  }) {
    try {
      return _formatValue(number, format);
    } catch (e) {
      return fallback;
    }
  }

  static String _formatValue(dynamic value, String format) {
    final f = NumberFormat(format);
    return f.format(value);
  }

}