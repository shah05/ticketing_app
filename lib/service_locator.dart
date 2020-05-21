import 'package:get_it/get_it.dart';
import 'package:ticketing_app/business_logic/viewmodels/ticket_detail_viewmodel.dart';
import 'package:ticketing_app/business_logic/viewmodels/track_ticket_status_viewmodel.dart';
import 'package:ticketing_app/service/rest_api/rest_api_service.dart';
import 'package:ticketing_app/service/rest_api/rest_api_service_implementation.dart';
import 'package:ticketing_app/service/storage/storage_service.dart';
import 'package:ticketing_app/service/storage/storage_service_implementation.dart';

import 'business_logic/viewmodels/select_contract_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Register Services
  serviceLocator.registerLazySingleton<RestApiService>(
      () => RestApiServiceImplementation());
  serviceLocator.registerLazySingleton<StorageService>(
      () => StorageServiceImplementation());

  // Register ViewModels
  serviceLocator.registerLazySingleton<TicketDetailViewModel>(
      () => TicketDetailViewModel());
  serviceLocator.registerLazySingleton<TrackTicketStatusViewModel>(
      () => TrackTicketStatusViewModel());
  serviceLocator.registerLazySingleton<SelectContractViewModel>(
          () => SelectContractViewModel());
}
