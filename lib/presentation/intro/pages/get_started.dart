import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoti/common/widgets/button/basic_app_button.dart';
import 'package:spoti/core/configs/assets/app_images.dart';
import 'package:spoti/core/configs/assets/app_vectors.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';
import 'package:spoti/presentation/auth/pages/signup_signin.dart';
import 'package:spoti/presentation/choose_mode/pages/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(AppImages.introBG))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                // Align(
                //     alignment: Alignment.topCenter,
                //     child: SvgPicture.asset(AppImages.logoPNG)),
                const Spacer(),
                const Text(
                  'Save in Dollars',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Manage your money in USD and EUR. Easily transfer to or from your local currency',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignupOrSigninPage()));
                  },
                  title: 'Get Started',
                  textColor: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
