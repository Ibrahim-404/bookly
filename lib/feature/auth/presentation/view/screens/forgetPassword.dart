import 'package:awesome_dialog/awesome_dialog.dart'
    show AnimType, AwesomeDialog, DialogType;
import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:bookly/feature/auth/presentation/view/componets/buildElevatedButtonForAuthFunction.dart'
    show buildElevatedButtonForAuthFunction;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';

import '../componets/CustomTextFormFiald.dart';

class Forgetpassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forgot Password ?",
                      style: AppStyle.rgular30,
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Image(
                      image: AssetImage(
                          "assets/picture_file/forgetPassword_images/Picture (1).png"),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    CustomTextFormFiald(
                      controller: emailController,
                      textHint: "please enter your email address",
                      type: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildElevatedButtonForAuthFunction(
                      function: () async{
                        if (formKey.currentState!.validate()) {
                          print("valid");
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text,
                            );
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'Reset Password',
                              desc: 'Check Your Email Please',
                              btnOkOnPress: () {
                                Navigator.restorablePushReplacementNamed(
                                    context, RoutesName.signIn);
                              },
                            ).show();
                          } on Exception catch (e) {
                            print(e);
                          }
                        } else {
                          return print("not valid!..Enter valid data");
                        }
                      },
                      GetformKey: formKey,
                      hintText: "Reset Password",
                    )
                  ])),
        ),
      ),
    );
  }
}
