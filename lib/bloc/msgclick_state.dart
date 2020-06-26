part of 'msgclick_bloc.dart';

@immutable
abstract class MsgclickState {}

class MsgclickInitial extends MsgclickState {}

class MsgclickLoading extends MsgclickState {}

class MsgclickLoaded extends MsgclickState {}

class MsgclickError extends MsgclickState {}