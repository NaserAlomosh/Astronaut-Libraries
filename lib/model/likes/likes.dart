class LikesModel {
  String? id;
  bool? like;
  LikesModel.fromJosn(Map<String, dynamic> json) {
    id = json["id"];
    like = json["like"];
  }
}
