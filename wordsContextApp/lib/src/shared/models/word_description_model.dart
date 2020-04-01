class WordDescriptionModel {
  int _id;
  int _wordId;
  int _contextId;
  String _description;
  String _createdAt;
  String _updatedAt;

  WordDescriptionModel(
      {int id,
      int wordId,
      int contextId,
      String description,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._wordId = wordId;
    this._contextId = contextId;
    this._description = description;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get wordId => _wordId;
  set wordId(int wordId) => _wordId = wordId;
  int get contextId => _contextId;
  set contextId(int contextId) => _contextId = contextId;
  String get description => _description;
  set description(String description) => _description = description;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  WordDescriptionModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _wordId = json['word_id'];
    _contextId = json['context_id'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['word_id'] = this._wordId;
    data['context_id'] = this._contextId;
    data['description'] = this._description;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}