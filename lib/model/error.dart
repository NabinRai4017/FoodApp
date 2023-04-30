class ErrorState {
  final int code;
  final String title, message;

  ErrorState({required this.title, required this.message, required this.code});

  @override
  String toString() {
    return 'Error{code: $code, title: $title, message: $message';
  }
}
