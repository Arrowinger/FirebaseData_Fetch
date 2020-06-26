import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'msgclick_event.dart';
part 'msgclick_state.dart';

class MsgclickBloc extends Bloc<MsgclickEvent, MsgclickState> {
  @override
  MsgclickState get initialState => MsgclickInitial();

  @override
  Stream<MsgclickState> mapEventToState(
    MsgclickEvent event,
  ) async* {
    
    if(event is FetchMessage){
     try{

      yield MsgclickLoading();
      yield MsgclickLoaded();
     }
     catch(e){
       print(e);
       yield MsgclickError();
     }
    }
    if(event is ReturnBack){
      try{
        yield MsgclickLoading();
        yield MsgclickInitial();
      }
      catch(e){
        yield MsgclickError();
      }
    }
  }
}
