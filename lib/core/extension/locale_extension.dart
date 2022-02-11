
import 'package:zam/core/constant/enum/locale_enum.dart';

extension LocaleExtension on Locale {
  String get value {
    switch (this) {
      case Locale.TEST:
        return 'TEST';

    }
  }
}