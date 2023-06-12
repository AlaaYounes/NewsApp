import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/NewsApp/cubit/AppCubit.dart';
import 'package:news_app/layout/NewsApp/cubit/cubit.dart';
import 'package:news_app/layout/NewsApp/news_Layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/Bloc_Observer.dart';
import 'layout/NewsApp/cubit/AppStates.dart';
import 'network/remote/dio_helper.dart';

void main()async {
  // WidgetsFlutterBinding.ensureInitialized() : guarantee that await methods will excute first then run app.
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  
  bool? isDark = CacheHelper.getBoolean(key: 'isDark')??false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;


  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers:[
         BlocProvider(
          create: (context) => AppCubit()..changeAppMode(mode: isDark),
        ),
         BlocProvider(
          create: (context) => NewsCubit()..
          getScience()
          ..getSports()..
          getBusiness(),
        ),
      ]
     ,
      child: BlocConsumer<AppCubit, AppStates>(
        listener: ( context,  state) {  },
        builder: (BuildContext context, AppStates state) => MaterialApp(
            debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
              iconTheme: IconThemeData(
                color: Colors.black,
              )
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              elevation: 40.0,
              backgroundColor: Colors.white,
            ),
            textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
          ),
          darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 40.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
          ),
          themeMode://context.read<AppCubit>().isDark?ThemeMode.dark:ThemeMode.light,
          AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: NewsLayout(),
        ),
      ),
    );
  }
}

// AppTheme it determines the whole theme in the app.
