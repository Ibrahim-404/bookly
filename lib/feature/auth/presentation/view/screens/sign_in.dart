import 'package:bookly/core/utils/Function/signInUsingFacebook.dart';
import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomOutlinedButtonForDifferenceWayToLogin.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomTextFormFiald.dart';
import 'package:bookly/feature/auth/presentation/view/componets/QuestionAndNavigation.dart';
import 'package:bookly/feature/auth/presentation/view/componets/buildElevatedButtonForAuthFunction.dart';
import 'package:bookly/feature/auth/presentation/view/componets/customDivider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/Function/save_userId.dart';
import '../../../../../core/utils/Function/signInUsingGoogle.dart'
    show signInWithGoogle;

class SignIn extends StatelessWidget {
  SignIn({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
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
                  style: AppStyle.rgular14.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
                CustomTextFormFiald(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  textHint: "Email",
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormFiald(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  textHint: "password",
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: 25,
                ),
                buildElevatedButtonForAuthFunction(
                  hintText: "Sign in",
                  GetformKey: formKey,
                  function: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        String userId = FirebaseAuth.instance.currentUser!.uid;
                        User? user = FirebaseAuth.instance.currentUser;
                        FirebaseFirestore.instance.collection("users").doc(user!.uid).set({"userId": userId});
                        if (user != null) {
                          String userId = user.uid;
                          await SaveUserId().saveUserId(userId);
                        } else {
                          print("User is null, sign-in failed!");
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                            content: Text(
                              "Sign In Successfully",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        );

                        await Navigator.pushReplacementNamed(
                            context, RoutesName.home);
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                            content: Text(
                              "Error: ${e.message}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 21,
                ),
                customDivider(),
                SizedBox(
                  height: 21,
                ),
                CustomOutlinedButtonForDifferenceWayToLogin(
                  ontap: () async {
                    try {
                      await signInWithGoogle();
                    } on Exception catch (e) {
                      print(e);
                    }
                  },
                  hintText: "Sign in with Google",
                  imagePath: "assets/picture_file/AuthIcon/google.png",
                ),
                SizedBox(
                  height: 8,
                ),
                CustomOutlinedButtonForDifferenceWayToLogin(
                  ontap: () async {
                    await signInWithFacebook();

                    //
                  },
                  hintText: "Sign in with Facebook",
                  imagePath: "assets/picture_file/AuthIcon/facebook.png",
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.forgetPassword);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFFEF8262),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                QuestionAndNavigation(
                    Question: "Don't have an account?",
                    wheretoNavigate: "Sign up",
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signUp);
                    }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
