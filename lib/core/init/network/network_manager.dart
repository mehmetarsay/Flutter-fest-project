import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/base_response.dart';
import '../../base/base_model.dart';
import '../../constant/app/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance != null) return _instance;
    _instance = NetworkManager.init();
    return _instance;
  }

  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(
        baseUrl: ApplicationConstants.basePlaceUrl,
        contentType: 'application/json'));
  }

  Future get<T extends BaseModel>(String path, T model,
      {Map<String, dynamic>? queryParameters,
      bool isBaseResponse = true}) async {
    try {
      final response =
          await dio.get(path, queryParameters: queryParameters ?? {});
      if (response.statusCode == HttpStatus.ok) {
        if (isBaseResponse) {
          return _baserResponseConverter(response.data, model: model);
        } else {
          if (response.data is List) {
            var list = <T>[];
            (response.data as List)
                .forEach((element) => list.add(model.fromJson(element)));
            return list;
          } else {
            return model.fromJson(response.data);
          }
        }
      } else {
        log('$path GET FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        await Fluttertoast.showToast(
            msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
        return null;
      }
    } on DioError catch (dioError) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path GET ERROR | Error Type: ${dioError.error} | Error Message: ${dioError.message}');
      return null;
    } catch (error) {
      await Fluttertoast.showToast(
          msg: 'Beklenmeyen Bir Hata Oluştu. Lütfen tekrar deneyin');
      log('$path GET ERROR | Error : $error');
      return null;
    }
  }

  dynamic _baserResponseConverter<T extends BaseModel>(dynamic data,
      {T? model}) {
    final baseResponse = BaseResponse.fromJson(data);
    if (baseResponse.status == 'OK') {
      if (baseResponse.results != null) {
        if (baseResponse.results is List) {
          var list = <T>[];
          (baseResponse.results as List)
              .forEach((element) => list.add(model!.fromJson(element)));
          return list;
        } else {
          return model!.fromJson(baseResponse.results as Map<String, dynamic>);
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
