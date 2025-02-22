import 'package:bookly/feature/auth/presentation/view/screens/sign_in.dart';
import 'package:bookly/feature/auth/presentation/view/screens/sign_up.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';
import 'package:bookly/feature/home/presentation/manage/details/item_details_categories_cubit.dart';
import 'package:bookly/feature/home/presentation/view/screen/BookDetails.dart';
import 'package:bookly/feature/search/presentaion/view/screen/search%20screen.dart';
import 'package:bookly/feature/splash/presentation/view/screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/home/presentation/view/screen/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../feature/auth/presentation/view/screens/Verify_ForgetPasswordSms.dart';
import '../../../feature/auth/presentation/view/screens/forgetPassword.dart';
import '../../../feature/home/presentation/manage/picker_image_cubit.dart';

class ManagerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => BlocProvider(
  create: (context) => PickerImageCubit(),
  child: Home(),
));
      case '/bookDetails':
          // Item? book ;
        final book = settings.arguments as Item?;
        return MaterialPageRoute(builder: (_) =>BlocProvider(
          create: (context) => ItemDetailsCategoriesCubit(GetIt.instance.get<HomeRepoImple>()),
          child: BookDetails(
                 fetchItems:book,
          ),
        ));
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case "/forgetPassword":
        return MaterialPageRoute(builder: (_) => Forgetpassword());
      //ToDo not complete yat
        // case "/verifyForgetPassword":
      //   return MaterialPageRoute(builder: (_) => VerifyForgetPassword());
      default:
        return MaterialPageRoute(builder: (_) => Splash());
    }
  }
}