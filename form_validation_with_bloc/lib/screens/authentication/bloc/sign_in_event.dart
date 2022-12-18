abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInSubmittedChangedEvent(this.emailValue, this.passwordValue);
}
