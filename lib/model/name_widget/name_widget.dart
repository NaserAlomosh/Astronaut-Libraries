class NameWidgetModel {
  String? type;
  NameWidgetModel.fromJosn(Map<String, dynamic> json) {
    type = json["type"];
  }
}
