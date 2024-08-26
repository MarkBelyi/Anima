/*
import 'package:anima/Elements/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
import '../Theme/Typography/Typography.dart';
import '../generated/l10n.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      appBar: _buildAppBar(context),
      body: _buildBody(context, passwordController),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryGreenLight,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: AppColors.neutralWhite,
        ),
        onPressed: () {
          // TODO: Implement exit functionality
        },
      ),
      title: Text(
        S.of(context).sign_in,
        style: AppTypography.title2.copyWith(color: AppColors.neutralWhite),
      ),
    );
  }

  Widget _buildBody(BuildContext context, TextEditingController passwordController) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: AppShape.topRoundedCorners,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText(context),
            const SizedBox(height: 32),
            _buildIllustration(),
            const SizedBox(height: 32),
            CustomTextField(hintText: S.of(context).text_input),
            const SizedBox(height: 20),
            CustomPasswordField(
              controller: passwordController,
              hintText: S.of(context).enter_password,
            ),
            const SizedBox(height: 8),
            _buildForgotPassword(context),
            const SizedBox(height: 40),
            CustomButtonPrimary(text: S.of(context).sign_in, onPressed: () {}, isEnabled: false),
            const SizedBox(height: 24),
            _buildFooter(context)
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).welcome_back,
          style: AppTypography.title1.copyWith(color: AppColors.primaryGreenLight),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).hello_sign,
          style: AppTypography.caption3.copyWith(color: AppColors.neutralDark),
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Center(
      child: SvgPicture.asset(
        'assets/pick/sign_in.svg',
        width: 213,
        height: 165,
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Implement forgot password functionality
        },
        child: Text(
          S.of(context).forgot_password,
          style: AppTypography.caption3.copyWith(color: AppColors.neutralGrayLight),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/pick/fingerprint.svg',
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).dont_have_account,
              style: AppTypography.caption3.copyWith(color: AppColors.neutralDark),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement sign-up functionality
              },
              child: Text(
                S.of(context).sign_up,
                style: AppTypography.body3.copyWith(color: AppColors.primaryGreenLight),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Elements/button_primary.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
import '../Theme/Typography/Typography.dart';
import '../generated/l10n.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      appBar: _buildAppBar(context),
      body: _buildBody(context, passwordController, size),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryGreenLight,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: AppColors.neutralWhite,
        ),
        onPressed: () {
          // TODO: Implement exit functionality
        },
      ),
      title: Text(
        S.of(context).sign_in,
        style: AppTypography.title2.copyWith(color: AppColors.neutralWhite),
      ),
    );
  }

  Widget _buildBody(BuildContext context, TextEditingController passwordController, Size size) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: AppShape.topRoundedCorners,
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText(context),
            SizedBox(height: size.height * 0.04),
            _buildIllustration(size),
            SizedBox(height: size.height * 0.04),
            CustomTextField(hintText: S.of(context).text_input),
            SizedBox(height: size.height * 0.025),
            CustomPasswordField(
              controller: passwordController,
              hintText: S.of(context).enter_password,
            ),
            SizedBox(height: size.height * 0.01),
            _buildForgotPassword(context),
            SizedBox(height: size.height * 0.05),
            CustomButtonPrimary(
              text: S.of(context).sign_in,
              onPressed: () {},
              isEnabled: false,
            ),
            SizedBox(height: size.height * 0.01),
            _buildFooter(context, size)
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).welcome_back,
          style: AppTypography.title1.copyWith(color: AppColors.primaryGreenLight),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).hello_sign,
          style: AppTypography.caption3.copyWith(color: AppColors.neutralDark),
        ),
      ],
    );
  }

  Widget _buildIllustration(Size size) {
    return Center(
      child: SvgPicture.asset(
        'assets/pick/sign_in.svg',
        width: size.width * 0.6,
        height: size.height * 0.2,
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Implement forgot password functionality
        },
        child: Text(
          S.of(context).forgot_password,
          style: AppTypography.caption3.copyWith(color: AppColors.neutralGrayLight),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).dont_have_account,
              style: AppTypography.caption3.copyWith(color: AppColors.neutralDark),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement sign-up functionality
              },
              child: Text(
                S.of(context).sign_up,
                style: AppTypography.caption1.copyWith(color: AppColors.primaryGreenLight),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

