
import 'package:anima/Theme/Typography/typography.dart';
import 'package:anima/ViewModels/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Elements/app_bar.dart';
import '../Elements/button_primary.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../generated/l10n.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.neutralWhite,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: S.of(context).forgot_password,
          backgroundColor: AppColors.neutralWhite,
          textColor: AppColors.neutralDark,
          iconColor: AppColors.neutralDark,
          onLeadingPressed: () {
            Navigator.pushNamed(context, '/sign_in');
          },
        ),
        body: Consumer<ForgotPasswordViewModel>(
          builder: (context, viewModel, child) {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.06),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.neutralWhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3629B7).withOpacity(0.07),
                          spreadRadius: 0,
                          blurRadius: 30,
                          offset: const Offset(0, 4), // x: 0, y: 4
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: viewModel.showCodeVerificationCard
                            ? _buildCodeVerificationCard(context, viewModel, size)
                            : _buildInitialCard(context, viewModel, size),
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

  List<Widget> _buildInitialCard(BuildContext context, ForgotPasswordViewModel viewModel, Size size) {
    return [
      Text(
        S.of(context).take_phone_number,
        style: AppTypography.caption1.copyWith(color: AppColors.neutralGray),
      ),
      const SizedBox(height: 10),
      CustomTextField(
        hintText: S.of(context).phone,
        controller: viewModel.phoneController,
      ),
      const SizedBox(height: 20),
      Text(
          S.of(context).verified_code,
          style: AppTypography.body3.copyWith(color: AppColors.neutralDark)
      ),
      const SizedBox(height: 20),
      CustomButtonPrimary(
        text: S.of(context).send,
        onPressed: viewModel.isButtonEnabled ? () async {
          await viewModel.sendCode();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(viewModel.statusMessage),
              backgroundColor: viewModel.statusMessage.contains('SUCCESS') ? Colors.green : Colors.red,
            ),
          );
        } : null,
        isEnabled: viewModel.isButtonEnabled,
      ),
    ];
  }

  List<Widget> _buildCodeVerificationCard(BuildContext context, ForgotPasswordViewModel viewModel, Size size) {
    return [
      Text(
        S.of(context).enter_verification_code,
        style: AppTypography.caption1.copyWith(color: AppColors.neutralGray),
      ),
      const SizedBox(height: 10),
      CustomTextField(
        hintText: S.of(context).code,
        controller: viewModel.codeController,
      ),
      const SizedBox(height: 20),
      Text(
        S.of(context).code_sent_to_phone(viewModel.phoneNumber ?? ''),
        style: AppTypography.body3.copyWith(color: AppColors.neutralDark),
      ),
      const SizedBox(height: 30),
      CustomButtonPrimary(
        text: S.of(context).change_password,
        onPressed: viewModel.isButtonEnabled ? () async {
          await viewModel.verifyCode();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(viewModel.statusMessage),
              backgroundColor: viewModel.statusMessage.contains('SUCCESS') ? Colors.green : Colors.red,
            ),
          );
        } : null,
        isEnabled: viewModel.isButtonEnabled,
      ),
    ];
  }
}

