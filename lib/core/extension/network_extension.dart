import 'package:zam/core/constant/enum/network_enum.dart';

extension NetworkExtension on Network {
  String get value {
    switch (this) {
      case Network.TEST:
        return 'TEST';
    }
  }
}
