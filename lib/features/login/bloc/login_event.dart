part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  Login({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
