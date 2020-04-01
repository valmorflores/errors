class WordModel {
  Words _words;

  WordModel({Words words}) {
    this._words = words;
  }

  Words get words => _words;
  set words(Words words) => _words = words;

  WordModel.fromJson(Map<String, dynamic> json) {
    _words = json['words'] != null ? new Words.fromJson(json['words']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._words != null) {
      data['words'] = this._words.toJson();
    }
    return data;
  }
}

class Words {
  int _currentPage;
  List<WordsData> _data;
  String _firstPageUrl;
  int _from;
  int _lastPage;
  String _lastPageUrl;
  String _nextPageUrl;
  String _path;
  int _perPage;
  String _prevPageUrl;
  int _to;
  int _total;

  Words(
      {int currentPage,
      List<WordsData> data,
      String firstPageUrl,
      int from,
      int lastPage,
      String lastPageUrl,
      String nextPageUrl,
      String path,
      int perPage,
      String prevPageUrl,
      int to,
      int total}) {
    this._currentPage = currentPage;
    this._data = data;
    this._firstPageUrl = firstPageUrl;
    this._from = from;
    this._lastPage = lastPage;
    this._lastPageUrl = lastPageUrl;
    this._nextPageUrl = nextPageUrl;
    this._path = path;
    this._perPage = perPage;
    this._prevPageUrl = prevPageUrl;
    this._to = to;
    this._total = total;
  }

  int get currentPage => _currentPage;
  set currentPage(int currentPage) => _currentPage = currentPage;
  List<WordsData> get data => _data;
  set data(List<WordsData> data) => _data = data;
  String get firstPageUrl => _firstPageUrl;
  set firstPageUrl(String firstPageUrl) => _firstPageUrl = firstPageUrl;
  int get from => _from;
  set from(int from) => _from = from;
  int get lastPage => _lastPage;
  set lastPage(int lastPage) => _lastPage = lastPage;
  String get lastPageUrl => _lastPageUrl;
  set lastPageUrl(String lastPageUrl) => _lastPageUrl = lastPageUrl;
  String get nextPageUrl => _nextPageUrl;
  set nextPageUrl(String nextPageUrl) => _nextPageUrl = nextPageUrl;
  String get path => _path;
  set path(String path) => _path = path;
  int get perPage => _perPage;
  set perPage(int perPage) => _perPage = perPage;
  String get prevPageUrl => _prevPageUrl;
  set prevPageUrl(String prevPageUrl) => _prevPageUrl = prevPageUrl;
  int get to => _to;
  set to(int to) => _to = to;
  int get total => _total;
  set total(int total) => _total = total;

  Words.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = new List<WordsData>();
      json['data'].forEach((v) {
        _data.add(new WordsData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this._currentPage;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this._firstPageUrl;
    data['from'] = this._from;
    data['last_page'] = this._lastPage;
    data['last_page_url'] = this._lastPageUrl;
    data['next_page_url'] = this._nextPageUrl;
    data['path'] = this._path;
    data['per_page'] = this._perPage;
    data['prev_page_url'] = this._prevPageUrl;
    data['to'] = this._to;
    data['total'] = this._total;
    return data;
  }
}

class WordsData {
  int _id;
  int _languageId;
  int _typeId;
  String _name;
  String _createdAt;
  String _updatedAt;

  WordsData(
      {int id,
      int languageId,
      int typeId,
      String name,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._languageId = languageId;
    this._typeId = typeId;
    this._name = name;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get languageId => _languageId;
  set languageId(int languageId) => _languageId = languageId;
  int get typeId => _typeId;
  set typeId(int typeId) => _typeId = typeId;
  String get name => _name;
  set name(String name) => _name = name;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  WordsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _languageId = json['language_id'];
    _typeId = json['type_id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['language_id'] = this._languageId;
    data['type_id'] = this._typeId;
    data['name'] = this._name;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}