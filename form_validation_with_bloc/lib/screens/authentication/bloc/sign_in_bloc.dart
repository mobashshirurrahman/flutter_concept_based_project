import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_with_bloc/screens/authentication/bloc/sign_in_event.dart';
import 'package:form_validation_with_bloc/screens/authentication/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(InitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      // TODO: implement event handler
      if ((EmailValidator.validate(event.emailValue) == false)) {
        emit(ErrorState("Please Enter Valid Email @"));
      } else if (event.passwordValue.length < 8) {
        emit(ErrorState("Please Enter Valid Password with size >=8"));
      } else {
        emit(ValidState());
      }
    });
    on<SignInSubmittedChangedEvent>((event, emit) {
      // TODO: implement event handler
      emit(LoadingState());
    });
  }
}
