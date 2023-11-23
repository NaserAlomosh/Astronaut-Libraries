class UserModel {
  String? id;
  String? name;
  int? phone;
  String? email;
  String? image;
  UserModel();
  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!["name"];
    id = json["uid"];
    phone = json["phone"];
    email = json["email"];
    image = json["image"];
  }
}
