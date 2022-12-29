class SignInModel {
  bool? success;
  String? token;
  Data? data;

  SignInModel({this.success, this.token, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstname;
  String? lastname;
  String? gender;
  String? lookingfor;
  String? email;
  String? password;
  String? dob;
  String? addedon;
  int? iV;

  Data(
      {this.sId,
      this.firstname,
      this.lastname,
      this.gender,
      this.lookingfor,
      this.email,
      this.password,
      this.dob,
      this.addedon,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    lookingfor = json['lookingfor'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    addedon = json['addedon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['gender'] = this.gender;
    data['lookingfor'] = this.lookingfor;
    data['email'] = this.email;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['addedon'] = this.addedon;
    data['__v'] = this.iV;
    return data;
  }
}
 