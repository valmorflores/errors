class UserMeDataModel {
  User _user;
  String _accessToken;

  UserMeDataModel({User user, String accessToken}) {
    this._user = user;
    this._accessToken = accessToken;
  }

  User get user => _user;
  set user(User user) => _user = user;
  String get accessToken => _accessToken;
  set accessToken(String accessToken) => _accessToken = accessToken;

  UserMeDataModel.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    data['access_token'] = this._accessToken;
    return data;
  }
}

class User {
  int _id;
  String _name;
  String _email;
  Null _emailVerifiedAt;
  String _createdAt;
  String _updatedAt;

  User(
      {int id,
      String name,
      String email,
      Null emailVerifiedAt,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._emailVerifiedAt = emailVerifiedAt;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  Null get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(Null emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
