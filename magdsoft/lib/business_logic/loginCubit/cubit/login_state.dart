part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class loadingState extends LoginState{}
class loginSuccess extends LoginState{}
class loginFailed extends LoginState{}
