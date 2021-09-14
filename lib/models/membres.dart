class MembreData {
  String id;
  String nom;
  String prenom;
  String numero;
  // String idCooperative;

  MembreData({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.numero,
    // required this.idCooperative,
  });

  factory MembreData.fromJson(Map<String, dynamic> json) {
    return MembreData(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      numero: json['numero'],
      // idCooperative: json['idCooperative'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['numero'] = this.numero;
    // data['idCooperative'] = this.idCooperative;
    return data;
  }
}
