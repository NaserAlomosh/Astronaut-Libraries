class MassegesModel {
  String? date;
  String? senderID;
  String? receiverID;
  String? text;
  MassegesModel({
    String? date,
    String? senderID,
    String? receiverID,
    String? text,
  });
  MassegesModel.fromJosn(Map<String, dynamic>? json) {
    date = json!["date"].toString();
    senderID = json["senderID"];
    receiverID = json["receiverID"];
    text = json["text"];
  }
}
