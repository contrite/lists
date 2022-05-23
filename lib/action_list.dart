class ActionList {
  String? title;
  List<Items>? items;

  ActionList({this.title, this.items});

  ActionList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  bool? isDone;

  Items({this.title, this.isDone});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['isDone'] = this.isDone;
    return data;
  }
}
