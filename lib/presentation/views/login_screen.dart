import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pocker_app/core/utils/validators.dart';
import 'package:pocker_app/presentation/viewmodels/login_view_model.dart';
import 'package:pocker_app/presentation/views/register_screen.dart';
import 'package:pocker_app/presentation/widgets/custom_text_field.dart';

import 'reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginViewModel viewModel = GetIt.I<LoginViewModel>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double paddingHorizontal = screenWidth * 0.1;
    final double paddingVertical = screenHeight * 0.05;
    final double buttonHeight = screenHeight * 0.07;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  isPassword: false,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Senha',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: screenHeight * 0.04),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isLoading,
                  builder: (context, isLoading, child) {
                    return isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              final emailError = Validators.validateEmail(_emailController.text);
                              final passwordError = Validators.validatePassword(_passwordController.text);
                              if (emailError == null && passwordError == null) {
                                await viewModel.login(
                                  context,
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              } else {
                                viewModel.errorMessage.value = emailError ?? passwordError;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.4),
                              minimumSize: Size(double.infinity, buttonHeight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Entrar',
                              style: TextStyle(fontSize: screenHeight * 0.025),
                            ),
                          );
                  },
                ),
                SizedBox(height: screenHeight * 0.04),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isLoading,
                  builder: (context, isLoading, child) {
                    return isLoading
                        ? const CircularProgressIndicator()
                        : TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.4),
                              minimumSize: Size(double.infinity, buttonHeight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'Esqueci minha senha',
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isLoading,
                  builder: (context, isLoading, child) {
                    return isLoading
                        ? const CircularProgressIndicator()
                        : TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.4),
                              minimumSize: Size(double.infinity, buttonHeight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'Ainda não tem conta? Cadastre-se',
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                  },
                ),
                SizedBox(height: screenHeight * 0.02), // 2% da altura da tela
                ValueListenableBuilder<String?>(
                  valueListenable: viewModel.errorMessage,
                  builder: (context, errorMessage, child) {
                    return errorMessage != null
                        ? Text(
                            errorMessage,
                            style: TextStyle(color: Colors.red, fontSize: screenHeight * 0.02),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
