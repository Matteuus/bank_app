import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  static const defaultConnectTimeout = 10000;
  static const defaultReciveTimeout = 3000;

  Api(this.dio) {
    dio.options.baseUrl = "https://618a610134b4f400177c45fb.mockapi.io/v1/";

    dio.options.connectTimeout = defaultConnectTimeout;
    dio.options.receiveTimeout = defaultReciveTimeout;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options,
          RequestInterceptorHandler requestInterceptorHandler) async {
        var connectivityResult = await (Connectivity().checkConnectivity());

        if (connectivityResult == ConnectivityResult.none) {
          return requestInterceptorHandler.resolve(Response(
              requestOptions: options,
              data: 'Sem conexão!\nConecte-se e tente novamente!'));
        }

        dio.interceptors.requestLock.lock();

        options.headers['User-Agent'] =
            'Dalvik/1.0.0 (Linux; U; Android 1.0.0)';
        options.headers['Content-Type'] = 'application/json';

        dio.interceptors.requestLock.unlock();

        return requestInterceptorHandler.next(options);
      },
      onResponse: (Response response,
          ResponseInterceptorHandler responseInterceptorHandler) async {
        if (response.statusCode == 401) {}

        return responseInterceptorHandler.next(response);
      },
    ));
  }
}
