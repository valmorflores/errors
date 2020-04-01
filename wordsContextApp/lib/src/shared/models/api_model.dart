class ApiModel {
  Data data;

  ApiModel({this.data});

  ApiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    print( 'In Data-Mapeando');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    print('Out Data-Mapeando');
    return data;
  }
}

class Data {
  String system;
  String version;
  String developer;
  String baseUrl;

  Data({this.system, this.version, this.developer, this.baseUrl});

  Data.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    version = json['version'];
    developer = json['developer'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    print('In Mapeando');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system'] = this.system;
    data['version'] = this.version;
    data['developer'] = this.developer;
    data['base_url'] = this.baseUrl;
    print('Out Mapeando');
    return data;
  }
}