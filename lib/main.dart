import 'package:bloc/bloc.dart';
import 'package:bookly_app/app/bookly_app.dart';
import 'package:bookly_app/core/dependencies/service_locator.dart';
import 'package:bookly_app/core/observers/my_bloc_observer.dart';
import 'package:bookly_app/core/service/api/cache/cache_key.dart';
import 'package:bookly_app/core/service/api/cache/hive_consumer.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  setupServiceLocator();
  await Hive.initFlutter();
  HiveConsumer.hiveInit();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(CacheKey.featuredBooks);
  await Hive.openBox(CacheKey.newestBooks);
  runApp(BooklyApp());
}
