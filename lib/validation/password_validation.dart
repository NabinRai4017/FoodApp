mixin PasswordValidation {
  /*
  
  r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
  $
  
  */

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password Field can not be empty.';
    }
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
    if (passwordValid) {
      return null;
    } else {
      return 'Enter valid password.';
    }
  }
}
