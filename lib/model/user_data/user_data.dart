class UserModel {
  String? id;
  String? name;
  int? phone;
  String? token;
  String? email;
  String? image;

  UserModel.fromJosn(Map<String, dynamic> json) {
    name = json["name"];
    id = json["uid"];
    phone = json["phone"];
    email = json["email"];
    image = json["image"];
  }
}
