import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/NewsApp/cubit/states.dart';
import 'package:news_app/modules/bussiness/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import '../../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
      label: 'Science',
    ),
  ];
  List<Widget> screens= [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavBar(int index)
  {
    currentIndex =index;
    emit(NewsBottomNavState());
  }
  List business = [];
  List sports =[];
  List science =[];
  List bb =[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'a643b8950bce47c18dcd164a835d3117',
        },
    ).then((value) {
       // print(value!.data['articles']);
       business = value!.data['articles'];
      print('business: $business');
      print(business.length);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'a643b8950bce47c18dcd164a835d3117',
        },
    ).then((value) {
      // print(value?.data['articles'][0]['title']);
      sports =value?.data['articles'];
      print('sports: $sports');
      print(sports.length);
      emit(NewsGetSportsSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'a643b8950bce47c18dcd164a835d3117',
        }
    ).then((value) {
      // print(value?.data['articles'][0]['title']);
      science =value?.data['articles'];
      // print(science[0]['title']);
      emit(NewsGetScienceSuccessState());

    }).catchError((error)
    {
      print(error.toString);
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

}

