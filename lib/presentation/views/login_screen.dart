import 'package:flutter/material.dart';
import 'package:pocker_app/core/utils/validators.dart';
import 'package:pocker_app/presentation/viewmodels/login_view_model.dart';
import 'package:pocker_app/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel viewModel;
  LoginScreen({super.key, required this.viewModel});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  isPassword: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: _emailController,
                  label: 'Senha',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isLoading,
                  builder: (context, isLoading, child) {
                    return isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              final emailError = Validators.validateEmail(_emailController.text);
                              final passwordError = Validators.validateEmail(_passwordController.text);
                              if (emailError == null && passwordError == null) {
                                await viewModel.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              } else {
                                viewModel.errorMessage.value = emailError ?? passwordError;
                              }
                            },
                            child: const Text('Entrar'),
                          );
                  },
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: viewModel.errorMessage,
                  builder: (context, errorMessage, child) {
                    return errorMessage != null
                        ? Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.red),
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
