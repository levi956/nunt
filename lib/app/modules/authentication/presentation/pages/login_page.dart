import 'package:flutter/cupertino.dart';
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

  DateTime selectedTime = DateTime.now();

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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                const SizedBox(height: 30),

                // you to get the (onchanged) date
                // assign it to a variable
                // use the (checkValidity) function to compare

                DateDisplayTileComponent(
                  date: formatDateTimeToHours(selectedTime),
                  header: 'Select time',
                  onTap: () {
                    timeSelectorDialog(
                      context: context,
                      child: CupertinoDatePicker(
                        initialDateTime: selectedTime,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        onDateTimeChanged: (selected) {
                          // highlight code here
                          // blah blah blah
                          // selctedhgihteifrhe

                          //NOTE: this is your own feature
                          //NOTE: Make the hour from SELECTED FALL IN RANGE

                          selectedTime = selected;
                          setState(() {});

                          // declare a variable that is (selectedTime)

                          //DateTime selectedTime = DateTime.now()

                          // assign selectedTime = selected

                          //  setState(() {});

                          // so in the button or something you do this

                          // if (checkValidity(selectedTime)) {
                          //   // show the snackbar error here
                          //   return;
                          // }

                          selectedTime = selected;
                          setState(() {});
                        },
                      ),
                    );
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
                    if (fallsInTimeRange(selectedTime)) {
                      context.showError('Invalid Time range');
                      return;
                    }
                    loginController.login(
                      email: email,
                      password: password,
                    );
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
      ),
    );
  }
}

bool fallsInTimeRange(DateTime time) {
  final int selectedHour = time.hour;
  // we have 24 hours in a day
  return (selectedHour > 6) && (selectedHour < 21);
}

void timeSelectorDialog({
  required BuildContext context,
  required Widget child,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 200,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

class DateDisplayTileComponent extends StatelessWidget {
  final String header;
  final VoidCallback onTap;
  final String date;
  const DateDisplayTileComponent({
    super.key,
    required this.date,
    required this.header,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String formatDateTimeToHours(DateTime dateTime) {
  final hour = dateTime.hour;
  final minute = dateTime.minute;
  final period = hour < 12 ? 'AM' : 'PM';

  // Convert 24-hour format to 12-hour format
  final formattedHour = (hour > 12) ? (hour - 12) : hour;

  // Ensure single-digit minutes are formatted with a leading zero
  final formattedMinute = (minute < 10) ? '0$minute' : '$minute';

  return '$formattedHour:$formattedMinute $period';
}
