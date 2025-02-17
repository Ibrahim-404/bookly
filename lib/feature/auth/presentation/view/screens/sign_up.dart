import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomTextFormFiald.dart';
import 'package:bookly/feature/auth/presentation/view/componets/QuestionAndNavigation.dart';
import 'package:bookly/feature/auth/presentation/view/componets/buildElevatedButtonForAuthFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController FullNameController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordAginController = TextEditingController();
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
                    "Let’s Get Started",
                    style: AppStyle.rgular16,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Create an new account",
                    style: AppStyle.rgular14.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  CustomTextFormFiald(
                    controller: FullNameController,
                    textHint: "Full Name",
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormFiald(
                    controller: EmailController,
                    type: TextInputType.emailAddress,
                    textHint: "Your email",
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormFiald(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    textHint: "Password",
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormFiald(
                    controller: passwordAginController,
                    type: TextInputType.visiblePassword,
                    textHint: "Password again",
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildElevatedButtonForAuthFunction(
                    hintText: "Sign Up",
                    GetformKey: formKey,
                    function: () async {
                      if (formKey.currentState!.validate()) {
                        if (passwordController.text ==
                            passwordAginController.text) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: EmailController.text,
                                    password: passwordController.text);
                            await Navigator.pushReplacementNamed(
                                context, RoutesName.signIn);
                          } on Exception catch (e) {
                            // TODO
                            print(e);
                            print("3ak 😵😵😵");
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("should be two password same"),
                          ));
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuestionAndNavigation(
                      Question: "Already have an account?",
                      wheretoNavigate: "SignIn",
                      context: context,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signIn);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
