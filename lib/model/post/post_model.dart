import 'package:astronaut_libraries/model/favorite/favorite.dart';
import 'package:astronaut_libraries/model/likes/likes.dart';

class PostModel {
  String? shareTime;
  String? postId;
  String? image;
  String? userId;
  String? name;
  String? userImage;
  String? description;
  List<FavouriteModel> favorite = [];
  List<LikesModel> likes = [];
  PostModel.fromJosn(Map<String, dynamic>? json) {
    shareTime = json!["shareTime"];
    postId = json["postId"];
    image = json["image"];
    userImage = json["userImage"];
    userId = json["userId"];
    name = json["name"];
    description = json["description"];
    for (var element in json['likes']) {
      likes.add(LikesModel.fromJosn(element));
    }
    for (var element in json['favorite']) {
      favorite.add(FavouriteModel.fromJosn(element));
    }
  }
}
