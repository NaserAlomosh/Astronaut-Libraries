class LibraryModel {
  String? name;
  String? image;
  String? gitHubUrl;
  String? pubDevUrl;
  String? type;
  LibraryModel.fromJosn(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    type = json["type"];
  }
}
