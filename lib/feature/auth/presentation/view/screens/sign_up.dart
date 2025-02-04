import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/feature/auth/presentation/view/componets/CustomTextFormFiald.dart';
import 'package:bookly/feature/auth/presentation/view/componets/QuestionAndNavigation.dart';
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
                  CustomTextFormFiald(
                    textHint: "Full Name",
                    icon: Icons.person,
                  ),
                  CustomTextFormFiald(
                    type: TextInputType.emailAddress,
                    textHint: "Your email",
                    icon: Icons.email,
                  ),
                  CustomTextFormFiald(
                    type: TextInputType.visiblePassword,
                    textHint: "Password",
                    icon: Icons.lock,
                  ),
                  CustomTextFormFiald(
                    type: TextInputType.visiblePassword,
                    textHint: "Password again",
                    icon: Icons.lock,
                  ),
                  QuestionAndNavigation(Question: "Already have an account?",wheretoNavigate: "SignIn",context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
