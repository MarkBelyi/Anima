/*
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../Elements/Illustration.dart';
import '../Elements/app_bar.dart';
import '../Elements/button_primary.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Models/Requests/login_request.dart';
import '../Models/Responses/login_response.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
import '../Theme/Typography/typography.dart';
import '../generated/l10n.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _message = '';

  bool isSignInButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormValidity);
    passwordController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFormValidity() {
    setState(() {
      isSignInButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: S.of(context).sign_in,
        backgroundColor: AppColors.primaryGreenLight,
        iconColor: AppColors.neutralWhite,
        onLeadingPressed: () {
          SystemNavigator.pop();
        },
      ),
      body: _buildBody(context, size),
    );
  }

  Widget _buildBody(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        child: IntrinsicHeight(
          child: Container(
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
                  CustomIllustration(
                    assetPath: 'assets/pick/sign_in.svg',
                    width: size.width * 0.6,
                    height: size.height * 0.2,
                  ),
                  SizedBox(height: size.height * 0.04),
                  CustomTextField(
                    hintText: S.of(context).text_input,
                    controller: emailController,
                  ),
                  SizedBox(height: size.height * 0.025),
                  CustomPasswordField(
                    controller: passwordController,
                    hintText: S.of(context).enter_password,
                  ),
                  SizedBox(height: size.height * 0.01),
                  _buildForgotPassword(context),
                  SizedBox(height: size.height * 0.025),
                  const CustomIllustration(
                    assetPath: 'assets/pick/fingerprint.svg',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: size.height * 0.025),
                  CustomButtonPrimary(
                    text: S.of(context).sign_in,
                    onPressed: isSignInButtonEnabled ? _login : null,
                    isEnabled: isSignInButtonEnabled,
                  ),
                  SizedBox(height: size.height * 0.01),
                  _buildFooter(context),
                  SizedBox(height: 20),
                  Text(_message),
                ],
              ),
            ),
          ),
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
    return Row(
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
    );
  }
}


*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../ViewModels/SignInViewModel.dart';
import '../Elements/Illustration.dart';
import '../Elements/app_bar.dart';
import '../Elements/button_primary.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
import '../Theme/Typography/typography.dart';
import '../generated/l10n.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.primaryGreenLight,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: S.of(context).sign_in,
          backgroundColor: AppColors.primaryGreenLight,
          iconColor: AppColors.neutralWhite,
          onLeadingPressed: () {
            SystemNavigator.pop();
          },
        ),
        body: Consumer<SignInViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height,
                ),
                child: IntrinsicHeight(
                  child: Container(
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
                          CustomIllustration(
                            assetPath: 'assets/pick/sign_in.svg',
                            width: size.width * 0.6,
                            height: size.height * 0.2,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomTextField(
                            hintText: S.of(context).text_input,
                            controller: viewModel.emailController,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomPasswordField(
                            controller: viewModel.passwordController,
                            hintText: S.of(context).enter_password,
                          ),
                          SizedBox(height: size.height * 0.01),
                          _buildForgotPassword(context),
                          SizedBox(height: size.height * 0.025),
                          const CustomIllustration(
                            assetPath: 'assets/pick/fingerprint.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomButtonPrimary(
                            text: S.of(context).sign_in,
                            onPressed: viewModel.isSignInButtonEnabled ? viewModel.loginUser : null,
                            isEnabled: viewModel.isSignInButtonEnabled,
                          ),
                          SizedBox(height: size.height * 0.01),
                          _buildFooter(context),
                          SizedBox(height: 20),
                          Text(viewModel.message),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
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
    return Row(
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
    );
  }
}
