import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../models/responses.dart';

class QuestionResponseItem extends StatelessWidget {
  QuestionResponseItem(
      {Key? key,
      this.id,
      this.listResponse,
      this.question,
      this.onResponseSelected,
      this.point,
      this.selecteResponse})
      : super(key: key);

  final int? id;
  final String? question;
  final int? point;
  final List<Responses>? listResponse;
  final Function? onResponseSelected;
  final List? selecteResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        //color: Colors.grey.withOpacity(.5),
        decoration: BoxDecoration(
          border: Border.all(color: hexToColor("#e0e5e8")),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 40,
              offset: Offset(0, 10),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.only(left: 13, top: 5, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x07000000),
                        blurRadius: 40,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: hexToColor("#39b689"),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      id.toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(question!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: hexToColor("#2564a9"),
                          fontWeight: FontWeight.bold,
                        ))),
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 4,
                        color: hexToColor("#89c789"),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(point.toString() + " Pts",
                          style: TextStyle(
                              fontSize: 13.0,
                              color: hexToColor("#2c812c"),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Opacity(
              opacity: 0.30,
              child: Container(
                width: double.infinity,
                height: 0.50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff008bb2)),
                ),
              ),
            ),
            //list checklist response
            ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(),
                physics: ClampingScrollPhysics(),
                itemCount: listResponse == null ? 0 : listResponse!.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = listResponse![index].reponse;
                  String response_id = listResponse![index].reponse;
                  return CheckboxListTile(
                    title: Text(
                      title,
                      style: TextStyle(fontSize: 14),
                    ),
                    value: selecteResponse!.contains(response_id),
                    activeColor: Colors.green,
                    onChanged: (bool? selected) {
                      onResponseSelected!(selected, response_id);
                    },
                  );
                })
          ],
        ),
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      ),
    );
  }
}
