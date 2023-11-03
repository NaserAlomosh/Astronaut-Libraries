class UsersDataModel {
  String? id;
  String? name;
  String? image;
  UsersDataModel.formJson(Map<String, dynamic> jsonData) {
    id = jsonData['uid'];
    name = jsonData['name'];
    image = jsonData['image'];
  }
}
