import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/NewsApp/cubit/AppCubit.dart';
import 'package:news_app/layout/NewsApp/cubit/cubit.dart';
import 'package:news_app/layout/NewsApp/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
          title: Text(
          'News App',
          ),
            actions: [
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                  // context.watch<AppCubit>().changeAppMode();
                },
                  icon: Icon(
                    Icons.brightness_4_rounded,
                  ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
            cubit.changeBottomNavBar(index);
            },

            ),
          );
        },
      );
  }

}