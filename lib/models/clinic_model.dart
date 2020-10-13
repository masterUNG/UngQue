class ClinicModel {
  String id;
  String idCatigory;
  String name;
  String address;
  String lat;
  String lng;

  ClinicModel(
      {this.id, this.idCatigory, this.name, this.address, this.lat, this.lng});

  ClinicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCatigory = json['idCatigory'];
    name = json['Name'];
    address = json['Address'];
    lat = json['Lat'];
    lng = json['Lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idCatigory'] = this.idCatigory;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['Lat'] = this.lat;
    data['Lng'] = this.lng;
    return data;
  }
}

