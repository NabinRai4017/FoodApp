mixin EmailValidation {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email Field can not be empty.';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      return null;
    } else {
      return 'Enter valid email.';
    }
  }
}
