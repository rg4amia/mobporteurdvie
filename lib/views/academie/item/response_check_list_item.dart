import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/academie/modules_cours/module_cours_controller.dart';

class ResponseCheckListItem extends StatefulWidget {
  ResponseCheckListItem({Key? key}) : super(key: key);
  @override
  _ResponseCheckListItemState createState() => _ResponseCheckListItemState();
}

class _ResponseCheckListItemState extends State<ResponseCheckListItem> {
  final controller = Get.find<ModuleCoursController>();

  @override
  void initState() {
    super.initState();
    // _init(widget.questionId);
  }

  /*Future<void> _init(int id) async {
    controller.getResponseByQuestion(id);
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return controller.isLoading_1.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(
                  bottom: 16,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text(
                            controller.Listresponse![index].reponse,
                            style: TextStyle(fontSize: 14),
                          ),
                          value: true,
                          activeColor: Colors.green,
                          onChanged: (val) {},
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.Listresponse!.length,
                ),
              );
      }),
    );
  }
}
