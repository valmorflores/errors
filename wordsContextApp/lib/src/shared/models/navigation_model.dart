class Navigation {
  String _firstPageUrl;
  int _from;
  int _lastPage;
  String _lastPageUrl;
  String _nextPageUrl;
  String _path;
  int _perPage;
  Null _prevPageUrl;
  int _to;
  int _total;

  Navigation(
      {String firstPageUrl,
      int from,
      int lastPage,
      String lastPageUrl,
      String nextPageUrl,
      String path,
      int perPage,
      Null prevPageUrl,
      int to,
      int total}) {
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
  Null get prevPageUrl => _prevPageUrl;
  set prevPageUrl(Null prevPageUrl) => _prevPageUrl = prevPageUrl;
  int get to => _to;
  set to(int to) => _to = to;
  int get total => _total;
  set total(int total) => _total = total;

  Navigation.fromJson(Map<String, dynamic> json) {
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