class PostModel {
  bool? success;
  List<Data>? data;

  PostModel({this.success, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? body;
  String? image;
  PostedBy? postedBy;
  int? iV;

  Data({this.sId, this.title, this.body, this.image, this.postedBy, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class PostedBy {
  String? sId;
  String? firstname;
  String? lastname;

  PostedBy({this.sId, this.firstname, this.lastname});

  PostedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
