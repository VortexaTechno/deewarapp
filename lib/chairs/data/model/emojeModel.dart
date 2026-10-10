class Emojemodel {
  int? id;
  DateTime? time;
   String? emoje;
  Emojemodel({this.id, this.time,this.emoje});


}


class EmojeAssetModel {
  String? assets;

  EmojeAssetModel({this.assets});

  EmojeAssetModel.fromJson(Map<String, dynamic> json) {
    assets = json['assets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assets'] = this.assets;
    return data;
  }
}