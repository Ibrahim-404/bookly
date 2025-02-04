import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomOutlinedButtonForDifferenceWayToLogin.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomTextFormFiald.dart';
import 'package:bookly/feature/auth/presentation/view/componets/QuestionAndNavigation.dart';
import 'package:bookly/feature/auth/presentation/view/componets/buildElevatedButtonForAuthFunction.dart';
import 'package:bookly/feature/auth/presentation/view/componets/customDivider.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
dispose(){
  emailController.dispose();
  passwordController.dispose();
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formKey,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image(
                    image: AssetImage("assets/picture_file/BOOKLY.png"),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Welcome to Bookly",
                  style: AppStyle.rgular16,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign in to continue",
                  style: AppStyle.rgular14
                      .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
                ),
                CustomTextFormFiald(
                  type: TextInputType.emailAddress,
                  textHint: "Email",
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormFiald(
                  type: TextInputType.visiblePassword,
                  textHint: "password",
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: 25,
                ),
                buildElevatedButtonForAuthFunction(hintText: "Sign in",GetformKey: formKey,),
                SizedBox(
                  height: 21,
                ),
                customDivider(),
                SizedBox(
                  height: 21,
                ),
                CustomOutlinedButtonForDifferenceWayToLogin(
                  hintText: "Sign in with Google",
                  imagePath:"assets/picture_file/AuthIcon/google.png" ,
                ),
                SizedBox(
                  height: 8,),
                CustomOutlinedButtonForDifferenceWayToLogin(
                  hintText: "Sign in with Facebook",
                  imagePath:"assets/picture_file/AuthIcon/facebook.png" ,
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                    onTap: (){
                    },
                    child: Text("Forgot Password?",style: TextStyle(
                  color: Color(0xFFEF8262),
                ),),),
                SizedBox(
                  height: 8,
                ),
                QuestionAndNavigation(Question: "Don't have an account?",wheretoNavigate: "Sign up",context: context),
              ],
            ),
          ),
        )),
      ),
    );
  }





}



