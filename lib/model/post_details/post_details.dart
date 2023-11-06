class PostDetailsModel {
  String? gitHubUrl;
  String? pubDevUrl;
  String? description;
  List<dynamic> likes = [];
  PostDetailsModel.fromJosn(Map<String, dynamic> json) {
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    description = json["description"];
    for (var element in json['likes']) {
      likes.add(LikesModel.fromJosn(element));
    }
  }
}

class LikesModel {
  String? id;
  bool? like;
  LikesModel.fromJosn(Map<String, dynamic> json) {
    id = json["id"];
    like = json["like"];
  }
}
