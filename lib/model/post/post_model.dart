class PostModel {
  String? shareTime;
  String? postId;
  String? image;
  String? userId;
  String? name;
  PostModel.fromJosn(Map<String, dynamic> json) {
    shareTime = json["shareTime"];
    postId = json["postId"];
    image = json["image"];
    userId = json["userId"];
    name = json["name"];
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
