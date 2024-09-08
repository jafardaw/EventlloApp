import 'package:event_testing/Featuer/Auth/data/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

class UserError extends UserState {
  final String errorMessage;

  UserError(this.errorMessage);
}
