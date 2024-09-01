import 'package:anima/Elements/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Elements/footer.dart';
import '../Elements/header_text.dart';
import '../ViewModels/sign_in_view_model.dart';
import '../Elements/illustration.dart';
import '../Elements/app_bar.dart';
import '../Elements/button_primary.dart';
import '../Elements/password_field.dart';
import '../Elements/text_field.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Shape/shape.dart';
import '../ViewModels/sign_up_view_model.dart';
import '../generated/l10n.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.primaryGreenLight,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: S.of(context).sign_up,
          backgroundColor: AppColors.primaryGreenLight,
          iconColor: AppColors.neutralWhite,
          onLeadingPressed: () {
            SystemNavigator.pop();
          },
        ),
        body: Consumer<SignUpViewModel>(
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
                            title: S.of(context).welcome_to_us,
                            subtitle: S.of(context).hello_create,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomIllustration(
                            assetPath: 'assets/pick/sign_up.svg',
                            width: size.width * 0.6,
                            height: size.height * 0.2,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomTextField(
                            hintText: S.of(context).name,
                            controller: viewModel.nameController,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomTextField(
                            hintText: S.of(context).phone,
                            controller: viewModel.phoneController,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomPasswordField(
                            controller: viewModel.passwordController,
                            hintText: S.of(context).enter_password,
                          ),
                          SizedBox(height: size.height * 0.025),
                          TermsAndConditions(
                            isChecked: false,
                            onChanged: (bool? value) {},
                            onTermsTap: () {},
                          ),
                          SizedBox(height: size.height * 0.032),
                          CustomButtonPrimary(
                            text: S.of(context).sign_up,
                            onPressed: viewModel.isButtonEnabled ? () async {
                              bool success = await viewModel.registerUser();
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(S.of(context).registration_successful),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pushReplacementNamed(context, '/sign_in');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(viewModel.statusMessage),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            } : null,
                            isEnabled: viewModel.isButtonEnabled,
                          ),

                          SizedBox(height: size.height * 0.01),
                          Footer(
                            messageText: S.of(context).have_an_account,
                            buttonText: S.of(context).sign_in,
                            onButtonPressed: () {
                              Navigator.pushNamed(context, '/sign_in');
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
