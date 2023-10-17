class PostModel {
  String? shareTime;
  String? postId;
  String? image;
  String? gitHubUrl;
  String? pubDevUrl;
  String? userId;
  String? description;

  PostModel.fromJosn(Map<String, dynamic> json) {
    shareTime = json["shareTime"];
    postId = json["postId"];
    image = json["image"];
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    userId = json["userId"];
    description = json["description"];
  }
}
