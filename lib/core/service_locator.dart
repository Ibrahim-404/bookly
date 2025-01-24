import 'package:bookly/feature/home/data/repo/api_services.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';
import 'package:bookly/feature/home/presentation/manage/fetch_feature_books_cubit.dart';
import 'package:bookly/feature/home/presentation/manage/fetch_newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;
  void setup_serviceLocator() {
    getIt.registerSingleton<ApiServices>(
    ApiServices(Dio()));
    getIt.registerSingleton<HomeRepoImple>(
      HomeRepoImple(getIt.get<ApiServices>()));
  }
}
