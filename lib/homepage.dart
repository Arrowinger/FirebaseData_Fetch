import 'package:assignment1/bloc/msgclick_bloc.dart';
import 'package:assignment1/data/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/firestore_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('FireBase Fetch Data'),
      ),
      body: BlocBuilder<MsgclickBloc,MsgclickState>(
        builder: (context,state){
          if(state is MsgclickInitial){
            return Center(
              child: RaisedButton(
                
                onPressed: (){
                  BlocProvider.of<MsgclickBloc>(context).add(FetchMessage());
                },
                color: Colors.green[300],
                child: Text('Press to see messages',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
                ),
              ),
            );
          } 
          else if(state is MsgclickLoading){
            return Center(child:CircularProgressIndicator());
          }
          else if(state is MsgclickLoaded){
            return Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
          
                  stream: FirestoreService().getMessages() ,
                  builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot){
                  if(snapshot.hasError || !snapshot.hasData){
                    // print(snapshot.hasError);
                    // print(snapshot.hasData);
                    return Center(child: CircularProgressIndicator());
                  }
          
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Message msg = snapshot.data[index];
                      return Card(
                        margin: EdgeInsets.only(top:10.0,left:10.0,right:10.0),
                        elevation: 8.0,
                       child: ListTile(
                         leading: Text('${index+1}.'),
                          title: Text(msg.data),
                        ),
                      );
                    }
                  );
                    }
                    
                  ),
                ),
                Center(
                  child:Container(
                    height: 70.0,
                    width: 70.0,
                    margin: const EdgeInsets.only(bottom:30.0),
                    decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.green,
                     boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0, // soften the shadow
                          spreadRadius: 3.0, //extend the shadow
                         
                        )
                      ],
                     
                    ),
                    child: IconButton(
                      icon:   Icon(Icons.arrow_back,color: Colors.white,size: 40.0,),
                      onPressed: (){
                        BlocProvider.of<MsgclickBloc>(context).add(ReturnBack());
                      }
                      ),
                   
                  
                  )
                  )
              ],
            );
          }
          else{
           return Center(child: Text('No data found'));
          }

          
        }
      ),
            
   

    );
  }
}