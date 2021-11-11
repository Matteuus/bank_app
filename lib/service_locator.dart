import 'package:bank_app/api/api.dart';
import 'package:bank_app/controllers/titular.controller.dart';
import 'package:bank_app/repositories/titular.repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.I;

void setupServiceLocator() {
  sl.registerLazySingleton(() => Api(Dio()));
  sl.registerLazySingleton(() => TitularController());
  sl.registerLazySingleton(() => TitularRepository());
}
