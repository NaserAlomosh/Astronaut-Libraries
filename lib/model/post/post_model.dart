class PostModel {
  String? shareTime;
  String? postId;
  String? image;
  String? gitHubUrl;
  String? pubDevUrl;
  String? userId;
  String? description;
  List<dynamic> likes = [];
  PostModel.fromJosn(Map<String, dynamic> json) {
    shareTime = json["shareTime"];
    postId = json["postId"];
    image = json["image"];
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    userId = json["userId"];
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
