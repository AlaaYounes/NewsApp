import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/NewsApp/cubit/AppStates.dart';
import 'package:news_app/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(AppChangeModeState());

  static AppCubit get(context) => BlocProvider.of(context);
   //static AppCubit obj(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppMode({bool? mode}){
    if(mode !=null){
      isDark = mode;
    }
    else {
      isDark = !isDark;}
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
