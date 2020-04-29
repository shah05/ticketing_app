import 'package:get_it/get_it.dart';
import 'package:ticketing_app/service/rest_api/rest_api.dart';
import 'package:ticketing_app/service/rest_api/rest_api_implementation.dart';
import 'package:ticketing_app/service/storage/storage_service.dart';
import 'package:ticketing_app/service/storage/storage_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<RestApi>(() => RestApiImplementation());
  serviceLocator.registerLazySingleton<StorageService>(
      () => StorageServiceImplementation());
}
