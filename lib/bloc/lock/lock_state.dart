part of 'lock_bloc.dart';

abstract class LockState extends Equatable {
  const LockState();
}

class LockInitial extends LockState {
  @override
  List<Object> get props => [];
}

class HiveBoxOpeningState extends LockState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LockState {
  @override
  List<Object> get props => [];
}

class ErrorState extends LockState {
  final String error;

  const ErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class LoggedInState extends LockState {
  final int code;

  const LoggedInState(this.code);
  @override
  List<Object> get props => [code];
}

// states required -> LoadingState, ErrorState, LoggedInState ... that's it!
// one more state will be required -> HiveBoxOpeningEvent
