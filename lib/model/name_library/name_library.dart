class NameLibraryModel {
  String? type;
  NameLibraryModel.fromJosn(Map<String, dynamic> json) {
    type = json["type"];
  }
}
