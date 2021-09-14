class CooperativeData {
  String id;
  String designation;
  String numRegis;
  String adresse;

  CooperativeData({
    required this.id,
    required this.designation,
    required this.numRegis,
    required this.adresse,
  });

  factory CooperativeData.fromJson(Map<String, dynamic> json) {
    return CooperativeData(
      id: json['id'],
      designation: json['designation'],
      numRegis: json['numRegis'],
      adresse: json['adresse'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['designation'] = this.designation;
    data['numRegis'] = this.numRegis;
    data['adresse'] = this.adresse;
    return data;
  }
}
