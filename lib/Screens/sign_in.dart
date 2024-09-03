import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Elements/footer.dart';
import '../Elements/forgot_password_button.dart';
import '../Elements/header_text.dart';
import '../ViewModels/sign_in_view_model.dart';
import '../Elements/illustration.dart';
import '../Elements/app_bar.dart';
import '../Elements/button_primary.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
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
                          HeaderText(
                            title: S.of(context).welcome_back,
                            subtitle: S.of(context).hello_sign,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomIllustration(
                            assetPath: 'assets/pick/sign_in.svg',
                            width: size.width * 0.6,
                            height: size.height * 0.2,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomTextField(
                            hintText: S.of(context).name,
                            controller: viewModel.loginController,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomPasswordField(
                            controller: viewModel.passwordController,
                            hintText: S.of(context).enter_password,
                          ),
                          SizedBox(height: size.height * 0.01),
                          ForgotPasswordButton(
                            text: S.of(context).forgot_password,
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                          ),
                          SizedBox(height: size.height * 0.025),
                          const CustomIllustration(
                            assetPath: 'assets/pick/fingerprint.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomButtonPrimary(
                            text: S.of(context).sign_in,
                            onPressed: viewModel.isButtonEnabled ? () async {
                              await viewModel.loginUser();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(viewModel.statusMessage),
                                  backgroundColor: viewModel.statusMessage.contains('SUCCESS') ? Colors.green : Colors.red,
                                ),
                              );
                            } : null,
                            isEnabled: viewModel.isButtonEnabled,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Footer(
                            messageText: S.of(context).dont_have_account,
                            buttonText: S.of(context).sign_up,
                            onButtonPressed: () {
                              Navigator.pushNamed(context, '/sign_up');
                            },
                          ),
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
}
