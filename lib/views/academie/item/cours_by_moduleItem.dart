import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/color_constants.dart';

class CoursByModuleItem extends StatelessWidget {
  CoursByModuleItem(
      {Key? key,
      this.onClickAction,
      this.courtheme,
      this.orateur,
      this.moderateur,
      this.evaluation,
      this.prevevaluation,
        this.validation
      })
      : super(key: key);
  Function? onClickAction;
  final String? courtheme;
  final String? orateur;
  final String? moderateur;
  final dynamic evaluation;
  final dynamic prevevaluation;
  final int? validation;

  double taille(String text) {
    var lenght = text.length;
    double initSize = 16.0;
    if (lenght > 34) {
      initSize = 12;
    }
    return initSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 415,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 40,
          offset: Offset(0, 10),
        ),
      ],
      color: Colors.white,
    ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courtheme!,
                      style: TextStyle(
                          color: hexToColor("#2564a9"),
                          fontSize: taille(courtheme!),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 7.50),
                    Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: 320.50,
                        height: 0.50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff008bb2)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                              color: hexToColor("#5b943c"),
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text('Orateur : $orateur')
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                              color: hexToColor("#5b943c"),
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text('Modérateur : $moderateur')
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        validation == 0 ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.times,
                              color: Colors.deepOrangeAccent,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Non validé',
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ) : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: hexToColor("#5b943c"),
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'validé',
                              style: TextStyle(
                                  color: hexToColor("#5b943c"),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10.50),
                    MaterialButton(
                      minWidth: 410.0,
                      height: 45,
                      color: Color(0xff008bb2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.blueGrey)),
                      child: new Text('Suivre le cours',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () => {onClickAction!()},
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
