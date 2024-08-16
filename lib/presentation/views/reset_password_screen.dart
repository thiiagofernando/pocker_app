import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../viewmodels/reset_password_view_model.dart';
import '../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordViewModel viewModel = GetIt.I<ResetPasswordViewModel>();

  final TextEditingController _emailController = TextEditingController();

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _emailController,
                label: 'E-mail',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  viewModel.resetPassword(context, _emailController.text);
                },
                child: const Text('Recuperar Senha'),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<String?>(
                valueListenable: viewModel.errorMessage,
                builder: (context, error, child) {
                  return error != null
                      ? Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        )
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
