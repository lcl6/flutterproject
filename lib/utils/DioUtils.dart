import 'package:dio/dio.dart';
class DioUtils{

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static Dio dio;
  static Dio createInstance(){
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: 150000,
          receiveTimeout: 150000,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: "https://api.it120.cc",//
          headers: getHeader());
      dio = new Dio(options);
    }
    return dio;
}

  /// 头部信息
 static  Map<String, dynamic> getHeader() {
    /// 自定义Header
    Map<String, dynamic> httpHeaders = {
      'Accept': 'application/json,*/*',
      'Content-Type': 'application/json',
      'token': ""
    };
    return httpHeaders;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  ///Get请求
  static void getHttp<T>(
      String url, {
        parameters,
        Function(T) onSuccess,
        Function(String error) onError,
      }) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.get(url, queryParameters: parameters);
      var responseData = response.data;
      if (responseData['erroCode'] == 2000) {
        if (onSuccess != null) {
          onSuccess(responseData['result']);
        }
      } else {
        throw Exception('erroMsg:${responseData['erroMsg']}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  ///Post请求
  static void postHttp<T>(
      String url, {
        parameters,
        Function(T) onSuccess,
        Function(String error) onError,
      }) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, queryParameters: parameters);
      var responseData = response.data;
      if (responseData['erroCode'] == 2000) {
        if (onSuccess != null) {
          onSuccess(responseData['result']);
        }
      } else {
        throw Exception('erroMsg:${responseData['erroMsg']}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  /// request Get、Post 请求
  //url 请求链接
  //parameters 请求参数
  //method 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static void requestHttp<T>(String url,
      {parameters,
        method,
        Function(T t) onSuccess,
        Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.GET) {
      getHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    } else if (method == DioUtils.POST) {
      postHttp(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }
}