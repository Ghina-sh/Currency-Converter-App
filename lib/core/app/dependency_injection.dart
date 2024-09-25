import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kib_challenge/core/utils/routes/app_router.dart';
import 'package:kib_challenge/features/home/presentation/bloc/home_bloc.dart';

import '../../features/currency_converter/data/data_sources/converter_remote_data_source.dart';
import '../../features/currency_converter/data/repositories/converter_repository_impl.dart';
import '../../features/currency_converter/domain/repositories/converter_repository.dart';
import '../../features/currency_converter/domain/use_cases/convert_currency_from_two_country_usecase.dart';
import '../../features/currency_converter/presentaion/blocs/currency_converter_bloc.dart';
import '../../features/history_currency/data/data_sources/history_currency_remote_data_source.dart';
import '../../features/history_currency/data/repositories/history_currency_repository_impl.dart';
import '../../features/history_currency/domain/repositories/history_currency_repository.dart';
import '../../features/history_currency/domain/use_cases/get_history_currency_usecase.dart';
import '../../features/history_currency/presentaion/blocs/history_currency_bloc.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/use_cases/get_currencies_country_usecase.dart';
import '../../features/splash/presentaion/blocs/splash_bloc.dart';
import '../data_sources/api_helper/app_api_helper.dart';
import '../data_sources/api_helper/app_api_helper_Impl.dart';
import '../data_sources/data_base_config.dart';
import '../data_sources/utils/dio_factory.dart';
import '../data_sources/utils/network/base_network_info.dart';
import '../data_sources/utils/network/network_info.dart';

final instance = GetIt.instance;

///
/// The [inject] function is responsible for adding the instances to the graph
///
Future<void> inject() async {
  //! External
  // To load the .env file contents into dotenv.
  await dotenv.load(fileName: ".env");

  await DataBaseConfig.instance.init();

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // Data sources
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppApiHelper>(() => AppApiHelperImpl(dio));

  instance.registerLazySingleton<AppRouter>(() => AppRouter());

  /// ========================== Splash ========================== ///
  instance.registerLazySingleton<SplashBloc>(() => SplashBloc());
  // instance.registerFactory<SplashBloc>(() => SplashBloc());

  /// ========================== Home ========================== ///
  instance.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<BaseHomeRepository>(
      () => HomeRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<GetCurrenciesCountryUseCase>(
      () => GetCurrenciesCountryUseCase(repository: instance()));
  instance.registerLazySingleton<CurrenciesBloc>(
      () => CurrenciesBloc(getCurrenciesCountryUseCase: instance()));

  /// ========================== Converter ========================== ///
  instance.registerLazySingleton<ConverterRemoteDataSource>(
      () => ConverterRemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<BaseConverterRepository>(
      () => ConverterRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<ConvertCurrencyFromTwoCountryUseCase>(
      () => ConvertCurrencyFromTwoCountryUseCase(repository: instance()));
  instance.registerLazySingleton<ConverterBloc>(
      () => ConverterBloc(convertCurrencyFromTwoCountryUseCase: instance()));

  /// ========================== HistoryCurrency ========================== ///
  instance.registerLazySingleton<HistoryCurrencyRemoteDataSource>(
      () => HistoryCurrencyRemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<BaseHistoryCurrencyRepository>(
      () => HistoryCurrencyRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<GetHistoryCurrencyUseCase>(
      () => GetHistoryCurrencyUseCase(repository: instance()));
  instance.registerLazySingleton<HistoryCurrencyBloc>(
      () => HistoryCurrencyBloc(getHistoryCurrencyUseCase: instance()));
}
