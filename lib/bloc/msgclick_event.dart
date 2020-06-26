part of 'msgclick_bloc.dart';

@immutable
abstract class MsgclickEvent {}

class FetchMessage extends MsgclickEvent{
  
}

class ReturnBack extends MsgclickEvent{}