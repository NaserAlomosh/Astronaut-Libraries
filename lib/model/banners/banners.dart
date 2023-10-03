class BannersModel {
  String? image;
  BannersModel.fromJosn(Map<String, dynamic> json) {
    image = json["image"];
  }
}
