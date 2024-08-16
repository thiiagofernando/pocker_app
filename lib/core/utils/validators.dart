class Validators {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'O email não pode ser vazio.';
    }
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegExp.hasMatch(email)) {
      return 'Por favor, insira um email válido.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'A senha não pode ser vazia.';
    }
    if (password.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }

  static String formatName(String email) {
    String username = email.split('@')[0];
    String formattedUsername = username.replaceAll('.', ' ');
    String capitalizedUsername = formattedUsername.split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
    return capitalizedUsername;
  }
}
