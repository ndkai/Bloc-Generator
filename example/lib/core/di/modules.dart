import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule{
  @lazySingleton
  Dio get dio => Dio()
    ..transformer = BackgroundTransformer()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      baseUrl: 'https://www.xflutter-cli.com/api',
    );
}