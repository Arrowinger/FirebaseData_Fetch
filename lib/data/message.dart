class Message{

  final String data;

  Message({ this.data});

  Message.fromMap(Map<String,dynamic> values):

    data = values['data'];

  
}