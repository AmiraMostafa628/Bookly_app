import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_services.dart';

GetIt instance = GetIt.instance;

void initAppModule() {

  instance.registerSingleton<ApiServices>(ApiServices(Dio()));
  instance.registerSingleton<HomeRepoImpl>(HomeRepoImpl(instance.get<ApiServices>()));
  instance.registerSingleton<SearchRepoImpl>(SearchRepoImpl(instance.get<ApiServices>()));

}