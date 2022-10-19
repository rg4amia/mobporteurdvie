import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class ItemDashboard extends StatelessWidget {
  var width;
  var height;
  IconData? icon;
  var pourcentage;
  var libelle;
  AssetImage? image;

  ItemDashboard({this.icon, this.libelle, this.pourcentage, this.image});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.only(bottom: 10),
            width: (width * 0.40625),
            decoration: BoxDecoration(
              color: Color(0xffece8f2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${pourcentage}',
                      style: TextStyle(
                          fontSize: 14,
                          color: hexToColor("#1b84d9"),
                          fontWeight: FontWeight.w800),
                    ),
                    Icon(Icons.arrow_drop_up,
                        size: 30, color: hexToColor("#1b84d9"))
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage: image),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$pourcentage',
                    style:TextStyle(fontSize: 16, color: hexToColor("#5c6a80")),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$libelle',
                    style:TextStyle(fontSize: 14, color: hexToColor("#5c6a80")),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
