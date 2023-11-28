class FavouriteModel {
  String? id;
  bool? favorite;
  FavouriteModel.fromJosn(Map<String, dynamic> json) {
    id = json["id"];
    favorite = json["favorite"];
  }
}
