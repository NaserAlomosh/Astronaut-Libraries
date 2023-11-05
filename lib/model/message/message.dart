class MessagesModel {
  List<dynamic> messages = [];
  MessagesModel.fromJosn(Map<String, dynamic> json) {
    for (var element in json['messags']) {
      messages.add(MessageModel.fromJosn(element));
    }
  }
}

class MessageModel {
  String? id;
  bool? text;
  MessageModel.fromJosn(Map<String, dynamic> json) {
    id = json["sender"];
    text = json["text"];
  }
}
