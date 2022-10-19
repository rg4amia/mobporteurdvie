import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../../constants/Enums.dart';
import '../../../../constants/color_constants.dart';
import '../../../../models/logsvertumetre.dart';
import '../../../../widgets/components/InputTextField.dart';

class VertumetreLogs extends StatelessWidget {
  VertumetreLogs({Key? key,this.data,this.fetchDataVertumetres}) : super(key: key);
  ResponseVertumetre? data;
  FetchDataVertumetre? fetchDataVertumetres;

  Vp2Character? _vp2character = Vp2Character.un;
  Vp1Character? _vp1character = Vp1Character.un;
  Vp4Character? _vp4character = Vp4Character.un;

  M2Character _m2character = M2Character.un;
  M1Character _m1character = M1Character.un;
  M3Character _m3character = M3Character.un;

  PlanCharacter _plancharacter = PlanCharacter.un;

  Map<String, dynamic> values = {
    'Fruit de l’Esprit': false,
    'Caractère': false,
    'Mariage, Foyer': false,
    'Famille': false,
    'Salut des Âmes': false,
    'Professionnel': false,
    'Santé': false,
    'Ministère': false,
    'Eglise, Pasteurs': false
  };

  Temoin3Character _temoin3character = Temoin3Character.un;
  Exo1Character _exo1character = Exo1Character.un;
  Exo2Character _exo2character = Exo2Character.un;
  Exo3Character _exo3character = Exo3Character.un;
  Exo4Character _exo4character = Exo4Character.un;
  Exo5Character _exo5character = Exo5Character.un;
  Exo6Character _exo6character = Exo6Character.un;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Session : " + fetchDataVertumetres!.weekNumber.toString() + " du "+ Jiffy(fetchDataVertumetres!.createdAt.toString()).yMMMMd),
          backgroundColor: hexToColor("#008bb2"),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          height: double.infinity,
          child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Text(
                  "I - VIE DE PRIERE ET DE JEÛNE",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                //1)
                Text(
                  "1 - Combien de fois vous priez chaque jour?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<Vp2Character>(
                      value: Vp2Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!
                          .viePriere1! ==
                          true
                          ? _vp2character
                          : Vp2Character.deux
                          : _vp2character,
                      onChanged: (Vp2Character? value) {

                      },
                    ),
                    const Text(
                        'Pas du tout (cette semaine)'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp2Character>(
                      value: Vp2Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!
                          .viePriere2! ==
                          true
                          ? _vp2character =
                          Vp2Character.deux
                          : _vp2character
                          : _vp2character,
                      onChanged: (Vp2Character? value) {
                      },
                    ),
                    const Text('1 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp2Character>(
                      value: Vp2Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.viePriere3! ==
                          true
                          ? _vp2character =
                          Vp2Character.trois
                          : _vp2character
                          : _vp2character,
                      onChanged: (Vp2Character? value) {
                      },
                    ),
                    const Text('2 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp2Character>(
                      value: Vp2Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.viePriere4! ==
                          true
                          ? _vp2character =
                          Vp2Character.quatre
                          : _vp2character
                          : _vp2character,
                      onChanged: (Vp2Character? value) {
                      },
                    ),
                    const Text('3 fois et plus'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //2)
                Text(
                  "2 - Combien de temps durent vos temps de prière (moyenne par temps de prière) ?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<Vp1Character>(
                      value: Vp1Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.tempsPriere1! ==
                          true
                          ? _vp1character
                          : Vp1Character.deux
                          : _vp1character,
                      onChanged: (Vp1Character? value) {
                      },
                    ),
                    const Text('00 - 15mn'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp1Character>(
                      value: Vp1Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!
                          .tempsPriere2! ==
                          true
                          ? _vp1character =
                          Vp1Character.deux
                          : _vp1character
                          : _vp1character,
                      onChanged: (Vp1Character? value) {
                      },
                    ),
                    const Text('15mn - 30mn'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp1Character>(
                      value: Vp1Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.tempsPriere3! ==
                          true
                          ? _vp1character =
                          Vp1Character.trois
                          : _vp1character
                          : _vp1character,
                      onChanged: (Vp1Character? value) {
                      },
                    ),
                    const Text('30mn - 1h'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp1Character>(
                      value: Vp1Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.tempsPriere4! ==
                          true
                          ? _vp1character =
                          Vp1Character.quatre
                          : _vp1character
                          : _vp1character,
                      onChanged: (Vp1Character? value) {
                      },
                    ),
                    const Text('1h et plus'),
                  ],
                ),
                //3
                Text(
                  "3 - Combien de fois avez-vous jeûné cette semaine?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<Vp4Character>(
                      value: Vp4Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.jeunePriere1 ==
                          true
                          ? _vp4character
                          : Vp4Character.deux
                          : _vp4character,
                      onChanged: (Vp4Character? value) {
                      },
                    ),
                    const Text(
                        'Pas du tout (cette semaine)'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp4Character>(
                      value: Vp4Character.deux,
                      groupValue:
                      data != null
                          ? data!.jeunePriere2 ==
                          true
                          ? _vp4character =
                          Vp4Character.deux
                          : _vp4character
                          : _vp4character,
                      onChanged: (Vp4Character? value) {
                      },
                    ),
                    const Text('1 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp4Character>(
                      value: Vp4Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.jeunePriere3 ==
                          true
                          ? _vp4character =
                          Vp4Character.trois
                          : _vp4character
                          : _vp4character,
                      onChanged: (Vp4Character? value) {
                      },
                    ),
                    const Text('2 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Vp4Character>(
                      value: Vp4Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.jeunePriere4 ==
                          true
                          ? _vp4character =
                          Vp4Character.quatre
                          : _vp4character
                          : _vp4character,
                      onChanged: (Vp4Character? value) {
                      },
                    ),
                    const Text('3 fois et plus'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //4
                Text(
                  "4 - Sur quoi portent vos sujets de prières?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                values != null
                    ? Column(
                    children: data!.nombre ==
                        0
                        ? values.keys.map((String key) {
                      return new CheckboxListTile(
                        title: Text(key),
                        value: values[key],
                        onChanged: (bool? value) {
                        },
                      );
                    }).toList()
                        : data!.sujetPriere!.keys.map((String key) {
                      return new CheckboxListTile(
                        title: Text(key),
                        value: data!.sujetPriere![key],
                        onChanged:
                            (bool? value) {},
                      );
                    }).toList())
                    : SizedBox(
                  height: 1,
                ),
                InputTextField(
                  labelText: "Autre (précisez)",
                  //icon: Icons.business,
                  initialValue:
                  data!.nombre != 0
                      ? data!.sujetPriereAutre
                      : "",
                  textInputType: TextInputType.text,
                  onChange: (text) {
                    //controller.resp.addAll({'other': text});
                  },
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez renseigner une ville';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //5
                Text(
                  "5 - Quel est le sujet pour lequel vous voulez qu'on vous soutienne en prière ?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 500,
                  initialValue:
                  data!.nombre != 0
                      ? data!.soutienSujet
                      : "",
                  onChanged: (val) {
                    //controller.resp.addAll({'soutien_sujet': val});
                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Champ de saisir",
                      hintStyle:
                      TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              new Radius.circular(15.0))),
                      labelStyle:
                      TextStyle(color: Colors.white)),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "II - MEDITATION DE LA PAROLE DE DIEU ET APPROFONDISSEMENT SPIRITUEL",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                //II -1)
                Text(
                  "1- Combien de fois vous méditez chaque jour?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<M2Character>(
                      value: M2Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleJour1! ==
                          true
                          ? _m2character
                          : M2Character.deux
                          : _m2character,
                      onChanged: (M2Character? value) {

                      },
                    ),
                    const Text(
                        'Pas du tout (cette semaine)'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M2Character>(
                      value: M2Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleJour2 ==
                          true
                          ? _m2character =
                          M2Character.deux
                          : _m2character
                          : _m2character,
                      onChanged: (M2Character? value) {
                      },
                    ),
                    const Text('1 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M2Character>(
                      value: M2Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleJour3 ==
                          true
                          ? _m2character =
                          M2Character.trois
                          : _m2character
                          : _m2character,
                      onChanged: (M2Character? value) {
                      },
                    ),
                    const Text('2 fois'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M2Character>(
                      value: M2Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleJour4 ==
                          true
                          ? _m2character =
                          M2Character.quatre
                          : _m2character
                          : _m2character,
                      onChanged: (M2Character? value) {
                      },
                    ),
                    const Text('3 fois et plus'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //II- 2)
                Text(
                  "2 - Combien de temps durent vos méditations de la Parole de Dieu?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<M1Character>(
                      value: M1Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleDuree1! ==
                          true
                          ? _m1character
                          : M1Character.deux
                          : _m1character,
                      onChanged: (M1Character? value) {

                      },
                    ),
                    const Text('00 - 15mn'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M1Character>(
                      value: M1Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleDuree2! ==
                          true
                          ? _m1character =
                          M1Character.deux
                          : _m1character
                          : _m1character,
                      onChanged: (M1Character? value) {

                      },
                    ),
                    const Text('15mn - 30mn'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M1Character>(
                      value: M1Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleDuree3! ==
                          true
                          ? _m1character =
                          M1Character.trois
                          : _m1character
                          : _m1character,
                      onChanged: (M1Character? value) {

                      },
                    ),
                    const Text('30mn - 1h'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M1Character>(
                      value: M1Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleDuree4! ==
                          true
                          ? _m1character =
                          M1Character.quatre
                          : _m1character
                          : _m1character,
                      onChanged: (M1Character? value) {
                      },
                    ),
                    const Text('1h et plus'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //II- 3)
                Text(
                  "3 - Volume de lecture de la Bible",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<M3Character>(
                      value: M3Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleVlecture1 ==
                          true
                          ? M3Character.un
                          : M3Character.deux
                          : _m3character,
                      onChanged: (M3Character? value) {
                      },
                    ),
                    const Text(
                        'Pas du tout (cette semaine)'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M3Character>(
                      value: M3Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleVlecture2 ==
                          true
                          ? _m3character =
                          M3Character.deux
                          : _m3character
                          : _m3character,
                      onChanged: (M3Character? value) {
                      },
                    ),
                    const Text('quelques versets'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M3Character>(
                      value: M3Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleVlecture3 ==
                          true
                          ? _m3character =
                          M3Character.trois
                          : _m3character
                          : _m3character,
                      onChanged: (M3Character? value) {
                      },
                    ),
                    const Text('tout un chapitre'),
                  ],
                ),
                Row(
                  children: [
                    Radio<M3Character>(
                      value: M3Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleVlecture4 ==
                          true
                          ? _m3character =
                          M3Character.quatre
                          : _m3character
                          : _m3character,
                      onChanged: (M3Character? value) {
                      },
                    ),
                    const Text('plus d’un chapitre'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //II- 4)
                Text(
                  "4 - Suivez-vous un plan de lecture de la Bible?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<PlanCharacter>(
                      value: PlanCharacter.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParolePlecture1 ==
                          true
                          ? PlanCharacter.un
                          : PlanCharacter.deux
                          : _plancharacter,
                      onChanged: (PlanCharacter? value) {

                      },
                    ),
                    const Text('Non'),
                  ],
                ),
                Row(
                  children: [
                    Radio<PlanCharacter>(
                      value: PlanCharacter.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParolePlecture2 ==
                          true
                          ? _plancharacter =
                          PlanCharacter.deux
                          : _plancharacter
                          : _plancharacter,
                      onChanged: (PlanCharacter? value) {

                      },
                    ),
                    const Text('De temps en temps'),
                  ],
                ),
                Row(
                  children: [
                    Radio<PlanCharacter>(
                      value: PlanCharacter.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParolePlecture3 ==
                          true
                          ? _plancharacter =
                          PlanCharacter.trois
                          : _plancharacter
                          : _plancharacter,
                      onChanged: (PlanCharacter? value) {
                      },
                    ),
                    const Text('Sur toute l\'année'),
                  ],
                ),
                InputTextField(
                  labelText: "Précisez",
                  //icon: Icons.business,
                  initialValue: "",
                  /* initialValue:  controller.vertumetreData != null ? controller.vertumetreData!.mediParolePprecisez! == "" ?
                                      "": controller.vertumetreData!.mediParolePprecisez! : " ", */
                  textInputType: TextInputType.text,
                  onChange: (text) {
                    /*controller.resp
                      .addAll({'precision': text});*/
                  },
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez renseigner une ville';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //II- 4)
                Text(
                  "5 - Quel(s) enseignement(s) avez-vous écouté cette semaine ?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 500,
                  initialValue:
                  data!.nombre != 0
                      ? data!.enseiEcoute!
                      : " ",
                  onChanged: (val) {
                    /*controller.resp.addAll(
                      {'enseignement_ecoute': val});*/
                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Champ de saisir",
                      hintStyle:
                      TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              new Radius.circular(15.0))),
                      labelStyle:
                      TextStyle(color: Colors.white)),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //II- 5)
                Text(
                  "6 - Témoignage portant sur:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi1 ==
                          true
                          ? Temoin3Character.un
                          : Temoin3Character.deux
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {
                        /*setState(() {
                        _temoin3character = value!;
                        controller.onSelectT3(
                            _temoin3character);
                      });*/
                      },
                    ),
                    const Text('Fruit de l’Esprit'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi2 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.deux
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Caractère'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi3 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.trois
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Mariage, Foyer'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi4 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.quatre
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Famille'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.cinq,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi5 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.cinq
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {
                      },
                    ),
                    const Text('Salut des Âmes'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.six,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi6 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.six
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Professionnel'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.sept,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi7 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.sept
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Santé'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.huit,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi8 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.huit
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Ministère'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Temoin3Character>(
                      value: Temoin3Character.neuf,
                      groupValue: data!.nombre !=
                          0
                          ? data!.mediParoleTemoi9 ==
                          true
                          ? _temoin3character =
                          Temoin3Character.neuf
                          : _temoin3character
                          : _temoin3character,
                      onChanged: (Temoin3Character? value) {

                      },
                    ),
                    const Text('Eglise, Pasteurs'),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 500,
                  initialValue:
                  data!.nombre != 0
                      ? data!.mediParoleTexplik
                      : "",
                  onChanged: (val) {
                    /*controller.resp
                      .addAll({'temoignage': val});*/
                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Expliquez ici",
                      hintStyle:
                      TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              new Radius.circular(15.0))),
                      labelStyle:
                      TextStyle(color: Colors.white)),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "III - FRUIT DE L'ESPRIT & CARACTERE",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Je m'examine à la lumière du Saint Esprit. Cette semaine:",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                //III- 1)
                Text(
                  "1 - Est-ce que j'ai réussi à toujours respecter les priorités que je me suis fixé(e)?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Radio<Exo1Character>(
                      value: Exo1Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx11 ==
                          true
                          ? Exo1Character.un
                          : Exo1Character.deux
                          : _exo1character,
                      onChanged: (Exo1Character? value) {
                        /*setState(() {
                        _exo1character = value!;
                        controller
                            .onSelectExo1(_exo1character);
                      });*/
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo1Character>(
                      value: Exo1Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx12 ==
                          true
                          ? _exo1character =
                          Exo1Character.deux
                          : _exo1character
                          : _exo1character,
                      onChanged: (Exo1Character? value) {
                        /*setState(() {
                        _exo1character = value!;
                        controller
                            .onSelectExo1(_exo1character);
                      });*/
                      },
                    ),
                    const Text(
                        'Je n\'y arrive pas du tout '),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo1Character>(
                      value: Exo1Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx13 ==
                          true
                          ? _exo1character =
                          Exo1Character.trois
                          : _exo1character
                          : _exo1character,
                      onChanged: (Exo1Character? value) {
                        /*setState(() {
                        _exo1character = value!;
                        controller
                            .onSelectExo1(_exo1character);
                      });*/
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'J\'y arrive en partie (ou de temps en temps) ')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo1Character>(
                      value: Exo1Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx14 ==
                          true
                          ? _exo1character =
                          Exo1Character.quatre
                          : _exo1character
                          : _exo1character,
                      onChanged: (Exo1Character? value) {
                        /*setState(() {
                        _exo1character = value!;
                        controller
                            .onSelectExo1(_exo1character);
                      });*/
                      },
                    ),
                    const Text(
                        'J\'y arrive pleinement (ou toujours) '),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //III- 1)
                Text(
                  "2 - Est-ce que j'ai fait chaque fois ce que j'ai dit et est-ce que j'ai toujours dit ce que j'ai fait?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Radio<Exo2Character>(
                      value: Exo2Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx21 ==
                          true
                          ? Exo2Character.un
                          : Exo2Character.deux
                          : _exo2character,
                      onChanged: (Exo2Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo2Character>(
                      value: Exo2Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx22 ==
                          true
                          ? _exo2character =
                          Exo2Character.deux
                          : _exo2character
                          : _exo2character,
                      onChanged: (Exo2Character? value) {

                      },
                    ),
                    const Text(
                        'Je n\'y arrive pas du tout '),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo2Character>(
                      value: Exo2Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx23 ==
                          true
                          ? _exo2character =
                          Exo2Character.trois
                          : _exo2character
                          : _exo2character,
                      onChanged: (Exo2Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'J\'y arrive en partie (ou de temps en temps) ')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo2Character>(
                      value: Exo2Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx24 ==
                          true
                          ? _exo2character =
                          Exo2Character.quatre
                          : _exo2character
                          : _exo2character,
                      onChanged: (Exo2Character? value) {
                      },
                    ),
                    const Text(
                        'J\'y arrive pleinement (ou toujours) '),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //III- 3)
                Text(
                  "3 - Est-ce que j'ai prié d'abord avant de faire toute chose?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Radio<Exo3Character>(
                      value: Exo3Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx31 ==
                          true
                          ? Exo3Character.un
                          : Exo3Character.deux
                          : _exo3character,
                      onChanged: (Exo3Character? value) {

                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo3Character>(
                      value: Exo3Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx32 ==
                          true
                          ? _exo3character =
                          Exo3Character.deux
                          : _exo3character
                          : _exo3character,
                      onChanged: (Exo3Character? value) {
                      },
                    ),
                    const Text(
                        'Je n\'y arrive pas du tout '),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo3Character>(
                      value: Exo3Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx33 ==
                          true
                          ? _exo3character =
                          Exo3Character.trois
                          : _exo3character
                          : _exo3character,
                      onChanged: (Exo3Character? value) {

                      },
                    ),
                    Flexible(
                        child: const Text(
                            'J\'y arrive en partie (ou de temps en temps) ')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo3Character>(
                      value: Exo3Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx34 ==
                          true
                          ? _exo3character =
                          Exo3Character.quatre
                          : _exo3character
                          : _exo3character,
                      onChanged: (Exo3Character? value) {

                      },
                    ),
                    const Text(
                        'J\'y arrive pleinement (ou toujours) '),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //III- 4)
                Text(
                  "4 - Est-ce que j'ai vraiment pris le temps pour reconnaitre mes erreurs et demander pardon?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Radio<Exo4Character>(
                      value: Exo4Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx41 ==
                          true
                          ? Exo4Character.un
                          : Exo4Character.deux
                          : _exo4character,
                      onChanged: (Exo4Character? value) {

                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo4Character>(
                      value: Exo4Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx42 ==
                          true
                          ? _exo4character =
                          Exo4Character.deux
                          : _exo4character
                          : _exo4character,
                      onChanged: (Exo4Character? value) {

                      },
                    ),
                    const Text(
                        'Je n\'y arrive pas du tout '),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo4Character>(
                      value: Exo4Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx43 ==
                          true
                          ? _exo4character =
                          Exo4Character.trois
                          : _exo4character
                          : _exo4character,
                      onChanged: (Exo4Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'J\'y arrive en partie (ou de temps en temps) ')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo4Character>(
                      value: Exo4Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx44 ==
                          true
                          ? _exo4character =
                          Exo4Character.quatre
                          : _exo4character
                          : _exo4character,
                      onChanged: (Exo4Character? value) {
                      },
                    ),
                    const Text(
                        'J\'y arrive pleinement (ou toujours) '),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //III- 5)
                Text(
                  "5 - Est-ce que je me suis sentie énervé(e), irrité(e), vexé(e), frustré(e) ou humilié(e) par une situation ou une personne?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Radio<Exo5Character>(
                      value: Exo5Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx51 ==
                          true
                          ? Exo5Character.un
                          : Exo5Character.deux
                          : _exo5character,
                      onChanged: (Exo5Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo5Character>(
                      value: Exo5Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx52 ==
                          true
                          ? _exo5character =
                          Exo5Character.deux
                          : _exo5character
                          : _exo5character,
                      onChanged: (Exo5Character? value) {

                      },
                    ),
                    const Text('Très souvent'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo5Character>(
                      value: Exo5Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx53 ==
                          true
                          ? _exo5character =
                          Exo5Character.trois
                          : _exo5character
                          : _exo5character,
                      onChanged: (Exo5Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'De temps en temps')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo5Character>(
                      value: Exo5Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx54 ==
                          true
                          ? _exo5character =
                          Exo5Character.quatre
                          : _exo5character
                          : _exo5character,
                      onChanged: (Exo5Character? value) {

                      },
                    ),
                    const Text('Pas du tout'),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //III- 6)
                Text(
                  "6 - En cas de besoin, même le plus simple, est-ce que j'ai d'abord demandé à DIEU (même si j'ai les ressources pour trouver une solution)?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Radio<Exo6Character>(
                      value: Exo6Character.un,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx61 ==
                          true
                          ? Exo6Character.un
                          : Exo6Character.deux
                          : _exo6character,
                      onChanged: (Exo6Character? value) {

                      },
                    ),
                    Flexible(
                        child: const Text(
                            'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo6Character>(
                      value: Exo6Character.deux,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx62 ==
                          true
                          ? _exo6character =
                          Exo6Character.deux
                          : _exo6character
                          : _exo6character,
                      onChanged: (Exo6Character? value) {

                      },
                    ),
                    const Text(
                        'Je n\'y arrive pas du tout '),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo6Character>(
                      value: Exo6Character.trois,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx63 ==
                          true
                          ? _exo6character =
                          Exo6Character.trois
                          : _exo6character
                          : _exo6character,
                      onChanged: (Exo6Character? value) {
                      },
                    ),
                    Flexible(
                        child: const Text(
                            'J\'y arrive en partie (ou de temps en temps) ')),
                  ],
                ),
                Row(
                  children: [
                    Radio<Exo6Character>(
                      value: Exo6Character.quatre,
                      groupValue: data!.nombre !=
                          0
                          ? data!.examHebdoEx64 ==
                          true
                          ? _exo6character =
                          Exo6Character.quatre
                          : _exo6character
                          : _exo6character,
                      onChanged: (Exo6Character? value) {

                      },
                    ),
                    const Text(
                        'J\'y arrive pleinement (ou toujours) '),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ])),
    );
  }
}
