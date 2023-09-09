import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/authentication/presentation/controllers/login_controller.dart';

import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AppThemeMixin {
  bool showPassword = false;

  String email = "lifeofaprodigy@gmail.com";
  String password = "janedoe";

  late final LoginController loginController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    loginController = getIt<LoginController>();

    emailController = TextEditingController(text: email);
    passwordController = TextEditingController(text: password);

    loginController.listenWhen(
      loading: () {
        showLoader(context);
      },
      success: (v) {
        pop(context);
        // pushToAndClearStack(context, const DashboardPage());
      },
      failure: (e) {
        pop(context);
        context.showError(e);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    loginController.reset();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.lightWhiteDarkBlack,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                'Welcome Back',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(height: 20),
              BaseText(
                'I am happy to see you again. You can continue where you left off by logging in',
                fontSize: 16,
                color: colors.light7C82A1DarkFFFFF,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                isHidden: false,
                label: 'Email Address',
                controller: emailController,
                iconLabel: Icon(
                  Icons.email,
                  color: colors.light7C82A1DarkFFFFF,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                isHidden: showPassword,
                label: 'Password',
                controller: passwordController,
                iconLabel: Icon(
                  Icons.lock,
                  color: colors.light7C82A1DarkFFFFF,
                ),
                iconSuffix: InkWell(
                  onTap: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       showPassword = !showPassword;
              //       setState(() {});
              //     },
              //     child: Text(
              //       "${showPassword ? "Hide" : "Show"} password",
              //       style: const TextStyle(color: black),
              //     ),
              //   ),
              // ),
              const Spacer(),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  loginController.login(email: email, password: password);
                },
                validator: () {
                  return isValidEmailAddress(email) && password.isNotEmpty;
                },
                expanded: true,
              ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       pushTo(context, const RegisterPage());
              //     },
              //     child: const Text(
              //       "Don't have an account? Sign up",
              //       style: TextStyle(color: black),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
