import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/presentation/data/repos/search_repo_impl.dart';
import '../services/apis/apis_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<ApisServices> (ApisServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl> (HomeRepoImpl(getIt.get<ApisServices> ()));
  getIt.registerSingleton<SearchRepoImpl> (SearchRepoImpl(getIt.get<ApisServices> ()));
}