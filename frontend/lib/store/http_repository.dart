import 'package:cep/util/constantes.dart';
import 'package:cep/util/logging.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int statusOk = 200;
const int statusCreated = 201;
const int statusNotContent = 204;

abstract class HttpRepository {
  final Dio _dio = Dio();
  final String tokenKey = 'token';

  HttpRepository() {
    _dio.options.baseUrl = environment['apiUrl'];
    _dio.interceptors.add(CustomInterceptor());
  }

  Future<dynamic> get({String path, bool passToken: true}) async {
    try {
      _dio.options.headers = await getHeaders(passToken);
      final Response response = await _dio.get(path);
        return this.parseResponse(response);
    } on DioError catch (e) {
      throw (e.response.data['message']);
    }
  }

  Future<dynamic> post({
    String path,
    dynamic data,
    bool passToken: true,
    bool passArquivo: false,
  }) async {
    try {
      _dio.options.headers = await getHeaders(
        passToken,
        passArquivo: passArquivo,
      );
      final Response response = await _dio.post(path, data: data);
      return this.parseResponse(response);
    } on DioError catch (e) {
      throw (e.response.data['message']);
    }
  }

  Future<dynamic> patch(
      {String path, Map<String, dynamic> data, bool passToken: true}) async {
    try {
      _dio.options.headers = await getHeaders(passToken);
      final Response response = await _dio.patch(path, data: data);
      return this.parseResponse(response);
    } on DioError catch (e) {
      throw (e.response.data['message']);
    }
  }

  Future<dynamic> put(
      {String path, Map<String, dynamic> data, bool passToken: true}) async {
    try {
      _dio.options.headers = await getHeaders(passToken);
      final Response response = await _dio.put(path, data: data);
      return this.parseResponse(response);
    } on DioError catch (e) {
      throw (e.response.data['message']);
    }
  }

  Future<dynamic> delete({String path, bool passToken: true}) async {
    try {
      _dio.options.headers = await getHeaders(passToken);
      final Response response = await _dio.delete(path);
      return this.parseResponse(response);
    } on DioError catch (e) {
      throw (e.response.data['message']);
    }
  }

  Future<Map<String, String>> getHeaders(bool passToken,
      {passArquivo: false}) async {
    final Map<String, String> headers = {};

    if (passArquivo) {
      headers['Content-type'] = 'multipart/form-data';
    } else {
      headers['Content-type'] = 'application/json';
      headers['Accept'] = 'application/json';
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (passToken && prefs.containsKey(tokenKey)) {
      final String token = prefs.getString(tokenKey);
      headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return headers;
  }

  dynamic parseResponse(Response response) {
    if (response.data == null) {
      return null;
    }
    return response.data;
  }
}

class CustomInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    Logger.request("REQUEST { ${options.method}: ${options.path} }");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    Logger.sucess(
      "RESPONSE { ${response.statusCode}: ${response.request.path} }",
    );
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    Logger.error(
      "ERROR[ ${err.request.path}: ${err.response.data['message']} ]",
    );
    return super.onError(err);
  }
}
