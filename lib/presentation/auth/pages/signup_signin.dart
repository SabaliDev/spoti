import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoti/common/helpers/is_dark_mode.dart';
import 'package:spoti/common/widgets/appbar/app_bar.dart';
import 'package:spoti/common/widgets/button/basic_app_button.dart';
import 'package:spoti/core/configs/assets/app_images.dart';
import 'package:spoti/core/configs/assets/app_vectors.dart';
import 'package:spoti/presentation/auth/pages/signin.dart';
import 'package:spoti/presentation/auth/pages/signup.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppVectors.logo),
                      const SizedBox(
                        height: 55,
                      ),
                      const Text(
                        'Save in Dollars',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      const Text(
                        'Manage your money in USD and EUR. Easily transfer to or from your local currency. ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpPage()));
                            },
                            title: 'Register',
                            textColor: Colors.white,
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignInPage()));
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          )
                        ],
                      ),
                    ]),
              ))
        ],
      ),
    );
  }
}
