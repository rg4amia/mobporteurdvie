
class RegisterStudent {
  late  int? bapteme1;
  late int? bapteme2;
  late int? engagement1;
  late int? engagement2;
  late  int? engagement3;
  late int? recommandation;
  late String? name;
  late String? lname;
  late String? birthday;
  late String? gender;
  late String? ville;
  late String? ktier;
  late String? location;
  late String? callingcode;
  late String? phone1;
  late String? phone2;
  late String? email;
  late String? facebook;
  late String? whatsapp;
  late String? skype;
  late  String? marital;
  late String? partenairename;
  late String? children;
  late String? taille;
  late String? campus;
  late String? situationpro;
  late String? profession;
  late String? niveauacademi;
  late String? civility;
  late String? yearofconversion;
  late String? pagebiblique;
  late String? baptismaldatebyimmersion;
  late String? baptizedwiththeholyspirit;
  late String? thingyouthinkmost;
  late int? inlang;
  late String? inlangdate;
  late String? egliseactuel;
  late String? actifeglise;
  late int? actif;
  late String? actifdepartement;
  late int? convertis;
  late String? frequencepriere;
  late String? derniersujet;
  late String? aimefaire;
  late int? don;
  late String? donv;
  late bool? certifie;
  late String? temoignageconversion;

  RegisterStudent(
      {this.actif,
      this.actifdepartement,
      this.actifeglise,
      this.aimefaire,
      this.bapteme1,
      this.bapteme2,
      this.baptismaldatebyimmersion,
      this.baptizedwiththeholyspirit,
      this.birthday,
      this.callingcode,
      this.campus,
      this.children,
      this.civility,
      this.convertis,
      this.derniersujet,
      this.don,
      this.donv,
      this.egliseactuel,
      this.email,
      this.engagement1,
      this.engagement2,
      this.engagement3,
      this.facebook,
      this.frequencepriere,
      this.gender,
      this.inlang,
      this.inlangdate,
      this.ktier,
      this.lname,
      this.location,
      this.marital,
      this.name,
      this.niveauacademi,
      this.pagebiblique,
      this.partenairename,
      this.phone1,
      this.phone2,
      this.profession,
      this.recommandation,
      this.situationpro,
      this.skype,
      this.taille,
      this.thingyouthinkmost,
      this.ville,
      this.whatsapp,
      this.certifie,
      this.temoignageconversion,
      this.yearofconversion});

  factory RegisterStudent.fromJson(Map<String, dynamic> json) {
    return RegisterStudent(
        bapteme1: json['bapteme1'],
        bapteme2: json['bapteme2'],
        engagement1: json['engagement1'],
        engagement2: json['engagement2'],
        engagement3: json['engagement3'],
        recommandation: json['recommandation'],
        name: json['name'],
        lname: json['lname'],
        birthday: json['birthday'],
        gender: json['gender'],
        ville: json['ville'],
        ktier: json['ktier'],
        location: json['location'],
        callingcode: json['calling_code'],
        phone1: json['phone1'],
        phone2: json['phone2'],
        email: json['email'],
        facebook: json['facebook'],
        whatsapp: json['whatsapp'],
        skype: json['skype'],
        marital: json['marital'],
        partenairename: json['partenaire_name'],
        children: json['children'],
        taille: json['taille'],
        campus: json['campus'],
        situationpro: json['situation_pro'],
        profession: json['profession'],
        niveauacademi: json['niveau_academi'],
        civility: json['civility'],
        yearofconversion: json['year_of_conversion'],
        pagebiblique: json['page_biblique'],
        baptismaldatebyimmersion: json['baptismal_date_by_immersion'],
        baptizedwiththeholyspirit: json['Baptized_with_the_holy_spirit'],
        thingyouthinkmost: json['thing_you_think_most'],
        inlang: json['in_lang'],
        inlangdate: json['in_lang_date'],
        egliseactuel: json['eglise_actuel'],
        actifeglise: json['actif_eglise'],
        actif: json['actif'],
        actifdepartement: json['actif_departement'],
        convertis: json['convertis'],
        frequencepriere: json['frequence_priere'],
        derniersujet: json['dernier_sujet'],
        aimefaire: json['aime_faire'],
        don: json['don'],
        donv: json['don_v']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bapteme1'] = this.bapteme1;
    data['bapteme2'] = this.bapteme2;
    data['engagement1'] = this.engagement1;
    data['engagement2'] = this.engagement2;
    data['engagement3'] = this.engagement3;
    data['recommandation'] = this.recommandation;
    data['name'] = this.name;
    data['lname'] = this.lname;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['ville'] = this.ville;
    data['ktier'] = this.ktier;
    data['location'] = this.location;
    data['calling_code'] = this.callingcode;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['whatsapp'] = this.whatsapp;
    data['skype'] = this.skype;
    data['marital'] = this.marital;
    data['partenaire_name'] = this.partenairename;
    data['children'] = this.children;
    data['taille'] = this.taille;
    data['campus'] = this.campus;
    data['situation_pro'] = this.situationpro;
    data['profession'] = this.profession;
    data['niveau_academi'] = this.niveauacademi;
    data['civility'] = this.civility;
    data['year_of_conversion'] = this.yearofconversion;
    data['page_biblique'] = this.pagebiblique;
    data['baptismal_date_by_immersion'] = this.baptismaldatebyimmersion;
    data['Baptized_with_the_holy_spirit'] = this.baptizedwiththeholyspirit;
    data['thing_you_think_most'] = this.thingyouthinkmost;
    data['in_lang'] = this.inlang;
    data['in_lang_date'] = this.inlangdate;
    data['eglise_actuel'] = this.egliseactuel;
    data['actif_eglise'] = this.actifeglise;
    data['actif'] = this.actif;
    data['actif_departement'] = this.actifdepartement;
    data['convertis'] = this.convertis;
    data['frequence_priere'] = this.frequencepriere;
    data['dernier_sujet'] = this.derniersujet;
    data['aime_faire'] = this.aimefaire;
    data['don'] = this.don;
    data['don_v'] = this.donv;
    data['certifie'] = this.certifie;
    data['temoignageconversion'] = this.temoignageconversion;
    return data;
  }
}
