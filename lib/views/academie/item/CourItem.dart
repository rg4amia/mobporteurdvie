import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/constants/color_constants.dart';

class CourItem extends StatelessWidget {
  CourItem(
      {Key? key,
      this.onClickAction,
      this.titremodule,
      this.nbvalidate,
      this.totalcourse,
      this.nnbvalidate,
      this.moduleId,
      this.isLoading,
      this.keyVerif,
      this.canAccessModule})
      : super(key: key);
  Function? onClickAction;
  final String? titremodule;
  final int? nbvalidate;
  final int? totalcourse;
  final int? nnbvalidate;
  final int? moduleId;
  final bool? isLoading;
  final int? keyVerif;
  final dynamic canAccessModule;

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
        border:
        Border.all(color: hexToColor("#e0e5e8")),
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
                  Flexible(
                    flex: 1,
                    child: Text(
                      titremodule!,
                      style: TextStyle(
                          color: hexToColor("#2564a9"),
                          fontSize: 14, //taille(titremodule),
                          fontWeight: FontWeight.w500),
                    ),
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
                  SizedBox(height: 7.50),
                  Text(
                    "$totalcourse cours",
                    style: TextStyle(
                        color: hexToColor("#4c5b70"),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 7.50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 140,
                          height: 60,
                          padding:
                          EdgeInsets.only(left: 7, top: 2, right: 5),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: hexToColor("#e0e5e8")),
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
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("$nbvalidate",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: hexToColor("#2a8564"),
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "Validé",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: hexToColor("#2a8564")),
                                  )
                                ],
                              ),
                              Icon(
                                FontAwesomeIcons.smile,
                                color: hexToColor("#2a8564"),
                                size: 40.0,
                              )
                            ],
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 140,
                          height: 60,
                          padding:
                          EdgeInsets.only(left: 7, top: 2, right: 5),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: hexToColor("#e0e5e8")),
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
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("$nnbvalidate",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: hexToColor("#d93a3a"),
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "N validé",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: hexToColor("#d93a3a")),
                                  )
                                ],
                              ),
                              Icon(
                                FontAwesomeIcons.frown,
                                color: hexToColor("#d93a3a"),
                                size: 40.0,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 25.50),
                  MaterialButton(
                    minWidth: 410.0,
                    height: 45,
                    color: Color(0xff008bb2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blueGrey)),
                    child: new Text('VOIR LES COURS',
                        style: new TextStyle(
                            fontSize: 16.0, color: Colors.white)),
                    onPressed: () => {onClickAction!()},
                  )
                  /*(canAccessModule != null)
                      ? MaterialButton(
                    minWidth: 410.0,
                    height: 45,
                    color: Color(0xff008bb2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blueGrey)),
                    child: new Text('VOIR LES COURS',
                        style: new TextStyle(
                            fontSize: 16.0, color: Colors.white)),
                    onPressed: () => {onClickAction!()},
                  ) : keyVerif == 0 ?
                  MaterialButton(
                    minWidth: 410.0,
                    height: 45,
                    color: Color(0xff008bb2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blueGrey)
                    ),
                    child: new Text('VOIR LES COURS',
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Colors.white)),
                    onPressed: () => {onClickAction!()},
                  ) : MaterialButton(
                    minWidth: 410.0,
                    height: 45,
                    disabledColor: Colors.black12,
                    color: Colors.black12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side:
                        BorderSide(color: Colors.blueGrey)),
                    onPressed: () { },
                    child: new Text('VOIR LES COURS',
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Colors.white)),
                  ),*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
