import 'package:anima/Theme/Shape/shape.dart';
import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/Typography.dart';
import '../generated/l10n.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.primaryGreenLight,

      appBar: AppBar(

        backgroundColor: AppColors.primaryGreenLight,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.neutralWhite
          ),
          onPressed: () {
            //TODO( GIVE FUNCTION TO QUIT FROM APPLICATION )
          },
        ),

        title: Text(
          S.of(context).sign_in,
          style: AppTypography.title2.copyWith(color: AppColors.neutralWhite),
        ),

      ),

      body: Container(

        decoration: const BoxDecoration(
          color: AppColors.neutralWhite,
          borderRadius: AppShape.topRoundedCorners
        ),

      ),

    );

  }

}
