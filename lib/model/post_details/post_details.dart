class PostDetailsModel {
  String? gitHubUrl;
  String? pubDevUrl;
  String? description;
  List<dynamic>? likes = [];
  List<dynamic>? favorite = [];
  PostDetailsModel.fromJosn(Map<String, dynamic> json) {
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    description = json["description"];
    for (var element in json['likes']) {
      likes!.add(LikesModel.fromJosn(element));
    }
    for (var element in json['favorite']) {
      favorite!.add(FavoriteModel.fromJosn(element));
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

class FavoriteModel {
  String? id;
  FavoriteModel.fromJosn(Map<String, dynamic> json) {
    id = json["id"];
  }
}
