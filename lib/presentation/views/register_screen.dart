import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../viewmodels/register_view_model.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterViewModel viewModel = GetIt.I<RegisterViewModel>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterScreen({super.key});

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
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                label: 'Senha',
                isPassword: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  viewModel.register(context, _emailController.text, _passwordController.text);
                },
                child: const Text('Registrar'),
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
