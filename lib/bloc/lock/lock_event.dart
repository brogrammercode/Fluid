part of 'lock_bloc.dart';

abstract class LockEvent extends Equatable {
  const LockEvent();
}

class HiveBoxOpeningEvent extends LockEvent {
  @override
  List<Object> get props => [];
}

class LoginButtonClickedEvent extends LockEvent {
  final int code;

  const LoginButtonClickedEvent(this.code);
  @override
  List<Object?> get props => [code];
}

class RegisterButtonClickedEvent extends LockEvent {
  final int code;

  const RegisterButtonClickedEvent(this.code);
  @override
  List<Object?> get props => [code];
}

// let's see... how much event we will be needing...
// HiveBoxOpeningEvent, LoginButtonClickedEvent, RegisterButtonClickedEvent
