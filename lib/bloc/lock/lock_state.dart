part of 'lock_bloc.dart';

abstract class LockState extends Equatable {
  const LockState();
}

class LockInitial extends LockState {
  @override
  List<Object> get props => [];
}
