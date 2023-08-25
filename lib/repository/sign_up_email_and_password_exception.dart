class SignUpEmailAndPasswordException {
  final String message;
  const SignUpEmailAndPasswordException([this.message = 'An Unknown error occurred']);

  factory SignUpEmailAndPasswordException.code(String code) {
    switch (code) {
      case 'weak_password': return SignUpEmailAndPasswordException('Please enter a stronger password');
      case 'invalid-email': return SignUpEmailAndPasswordException('Email is not valid or badly formatted');
      case 'email_already-in-use': return SignUpEmailAndPasswordException('An account already exists for that email');
      case 'operation-not-allowed': return SignUpEmailAndPasswordException('Operation is not allowed. Please contact support');
      case 'user-disabled': return SignUpEmailAndPasswordException('This user has been disabled. Please contact support for help');
      default: return SignUpEmailAndPasswordException();
    }
  }
}