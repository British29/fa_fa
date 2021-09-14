class CooperativeDetailsData {
  final int id;
  final String designation;
  final String numRegis;
  final String adresse;

  CooperativeDetailsData(
      {required this.id,
      required this.designation,
      required this.numRegis,
      required this.adresse});

  factory CooperativeDetailsData.fromJson(Map<String, dynamic> json) {
    return CooperativeDetailsData(
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