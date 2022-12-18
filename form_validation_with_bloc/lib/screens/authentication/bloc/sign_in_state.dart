abstract class SignInState {}

class InitialState extends SignInState {}

class ErrorState extends SignInState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

// class InvalidState extends SignInState {}

class ValidState extends SignInState {}

class LoadingState extends SignInState {}
