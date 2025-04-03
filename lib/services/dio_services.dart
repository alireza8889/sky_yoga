import 'dart:convert';

import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> patchMethodBearer(
      Map<String, dynamic> map, String url, String token) async {
    Dio dio = Dio(); // Ensure you have a Dio instance, if not, create one.

    dio.options.headers['Content-Type'] = 'application/json';

    try {
      final response = await dio.patch(
        url,
        data: map,
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            responseType: ResponseType.json,
            method: 'PATCH'
        ),
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then(
      (value) {
        return value;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError(
      // ignore: body_might_complete_normally_catch_error
      (e) {
        if (e is DioException) {
          // ignore: invalid_return_type_for_catch_error
          return e.response;
        }
      },
    );
  }
  Future<dynamic> postMethodBearerForBulkCreate(
      List<Map<String, dynamic>> objects, String url, String token) async {

    dio.options.headers['Content-Type'] = 'application/json';
    final formData = FormData();
    formData.fields.add(MapEntry('data', jsonEncode(objects)));

    return await dio
        .post(
      url,
      data:formData,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }, responseType: ResponseType.json, method: 'POST'),
    )
        .then(
          (value) {
        return value;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError(
      // ignore: body_might_complete_normally_catch_error
          (e) {
        if (e is DioException) {
          // ignore: invalid_return_type_for_catch_error
          return e.response;
        }
      },
    );
  }

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then(
      (value) {
        return value;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError(
      // ignore: body_might_complete_normally_catch_error
      (e) {
        if (e is DioException) {
          // ignore: invalid_return_type_for_catch_error
          return e.response;
        }
      },
    );
  }

  Future<dynamic> postMethodBearer(
      Map<String, dynamic> map, String url, String token) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .post(
      url,
      data: dio_service.FormData.fromMap(map),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }, responseType: ResponseType.json, method: 'POST'),
    )
        .then(
      (value) {
        return value;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError(
      // ignore: body_might_complete_normally_catch_error
      (e) {
        if (e is DioException) {
          // ignore: invalid_return_type_for_catch_error
          return e.response;
        }
      },
    );
  }

  Future<dynamic> getMethodBearer(
      Map<String, dynamic> map, String url, String token) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .get(
      url,
      data: dio_service.FormData.fromMap(map),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }, responseType: ResponseType.json, method: 'GET'),
    )
        .then(
      (value) {
        return value;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError(
      // ignore: body_might_complete_normally_catch_error
      (e) {
        if (e is DioException) {
          // ignore: invalid_return_type_for_catch_error
          return e.response;
        }
      },
    );
  }

  Future<Response?> patchMethod({
    required data,
    required String token,
    required String url,
  }) async {
    try {
      final response = await dio.patch(
        url,
        data: data.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
