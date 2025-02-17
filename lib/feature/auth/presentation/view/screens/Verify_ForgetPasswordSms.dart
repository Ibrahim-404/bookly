import 'package:flutter/material.dart';
import 'package:smart_auth/smart_auth.dart';

class VerifyForgetPassword extends StatefulWidget {
  const VerifyForgetPassword({super.key});
// ToDO :this feature not complete yet
  @override
  State<VerifyForgetPassword> createState() => _VerifyForgetPasswordState();
}

class _VerifyForgetPasswordState extends State<VerifyForgetPassword> {
  final TextEditingController otpController = TextEditingController();
  final SmartAuth _smartAuth = SmartAuth.instance;

  @override
  void initState() {
    super.initState();
    // listenForOtp();
  }

  // void listenForOtp() async {
  //   try {
  //     final result = await _smartAuth.getSmsWithRetrieverApi();
  //     if (result.data != null) {
  //       setState(() {
  //         otpController.text = result .data;
  //       });
  //     }
  //   } catch (e) {
  //     print("Error fetching OTP: $e");
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forgot Password"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 64),
          const Text("Verify", style: TextStyle(fontSize: 30)),
          const Text("Please enter the code we sent to your phone"),
          const SizedBox(height: 36),
          TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: "Enter OTP",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
