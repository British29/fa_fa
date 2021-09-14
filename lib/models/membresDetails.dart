class MembreDetailsData {
  String id;
  String nom;
  String prenom;
  String numero;

  MembreDetailsData({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.numero,
  });

  factory MembreDetailsData.fromJson(Map<String, dynamic> json) {
    return MembreDetailsData(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      numero: json['numero'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['numero'] = this.numero;
    return data;
  }
}
