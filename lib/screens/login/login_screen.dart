import 'package:flutter/material.dart';
import '../../constants/app_titles.dart';
import '../../constants/images_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(
                  image: kWelcomeScreenImage,
                  title: kLoginTitle,
                  subTitle: kLoginSubtitle,
                ),
                LoginForm(),
                LoginFooter(
                  textTitle: kHaveNotAnAccount,
                  buttonTitle: kSignupButtonTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






