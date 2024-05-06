import 'package:client/src/data/datasources/local/app_database.dart';
import 'package:client/src/data/datasources/remote/news_api_service.dart';
import 'package:client/src/data/repositories/api_repository_impl.dart';
import 'package:client/src/data/repositories/database_repository_impl.dart';
import 'package:client/src/domain/repositories/api_repository.dart';
import 'package:client/src/domain/repositories/database_repositories.dart';
import 'package:client/src/utils/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<NewsApiService>()),
  );

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );
}
