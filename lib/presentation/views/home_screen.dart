import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pocker_app/core/utils/validators.dart';
import 'package:pocker_app/presentation/viewmodels/auth_login_view_model.dart';

import '../viewmodels/use_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthViewModel viewModelAuth = GetIt.I<AuthViewModel>();
  final UserViewModel viewModel = GetIt.I<UserViewModel>();
  @override
  Widget build(BuildContext context) {
    viewModel.loadCurrentUser();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: ValueListenableBuilder<User?>(
        valueListenable: viewModel.currentUser,
        builder: (context, user, child) {
          if (user != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bem-vindo, ${Validators.formatName(user.email!)} !'),
                  // Adicione outros dados do usuário que desejar exibir
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Nenhum usuário logado.'),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () async {
                await viewModelAuth.signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
