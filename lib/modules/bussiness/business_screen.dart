import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';

import '../../layout/NewsApp/cubit/AppCubit.dart';
import '../../layout/NewsApp/cubit/AppStates.dart';
import '../../layout/NewsApp/cubit/cubit.dart';
import '../../layout/NewsApp/cubit/states.dart';
import '../../network/remote/dio_helper.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
       return BlocConsumer<AppCubit,AppStates>(
          listener: (BuildContext context, state) {  },
           builder: (BuildContext context, state) {
              var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (BuildContext context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => buildArticleItem(list[index], context,
            AppCubit.get(context).isDark),
            separatorBuilder: (BuildContext context, int index) => dividor(context),
            itemCount: list.length,
          ),

          fallback: (BuildContext context)=> Center(
            child: Center(child: CircularProgressIndicator()),
          ),

        );
           },
       );
      },

    );
  }

}