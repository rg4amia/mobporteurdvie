
class CheckBoxListTileModel {
  int? userId;
  String? img;
  String? title;
  bool? isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getInfoValidation() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/logos/log_min.jpeg',
          title: "Je suis né(e) de nouveau",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/logos/log_min.jpeg',
          title:
              "Je suis baptisé(e) (plongé dans l'eau) depuis au moins un (1) an",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/logos/log_min.jpeg',
          title:
              "Je suis disposé(e) à accepter totalement et joyeusement le reglèment intérieur de l'école",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          img: 'assets/logos/log_min.jpeg',
          title: "Je m'engage à payer la totalité des frais de scolarité",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          img: 'assets/logos/log_min.jpeg',
          title: "Je m'engage à me rendre disponible pour suivre les cours",
          isCheck: false),
    ];
  }
}
