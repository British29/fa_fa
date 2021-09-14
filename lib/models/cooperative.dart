class AllCooperativeData {
  String id;
  String designation;
  String numRegis;
  String adresse;

  AllCooperativeData(
      {required this.id,
      required this.designation,
      required this.numRegis,
      required this.adresse});

  factory AllCooperativeData.fromJson(Map<String, dynamic> json) {
    return AllCooperativeData(
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
