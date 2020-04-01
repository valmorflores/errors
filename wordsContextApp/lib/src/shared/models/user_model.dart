class UserModel {
  int _id;
  String _name;
  String _email;
  String _emailVerifiedAt;
  String _password;
  String _createdAt;
  String _updatedAt;

  UserModel(
      {int id,
      String name,
      String email,
      String emailVerifiedAt,
      String password,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._emailVerifiedAt = emailVerifiedAt;
    this._password = password;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String get password => _password;
  set password(String password) => _password = password;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['password'] = this._password;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}