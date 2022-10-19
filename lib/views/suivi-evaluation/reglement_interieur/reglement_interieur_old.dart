// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import '../../../constants/Assets.dart';
// import '../../../constants/Enums.dart';
// import '../../../Constants/color_constants.dart';
// import 'package:url_launcher/url_launcher.dart';


// class reglementInterieur extends StatefulWidget {
//   reglementInterieur({Key? key}) : super(key: key);
//   @override
//   _reglementInterieurState createState() => _reglementInterieurState();
// }

// class _reglementInterieurState extends State<reglementInterieur> {
//
//   bool _isLoading = true;
//   int navIndex = 9;
//   String document = Assets.reglement_interieur_pdf;
//   //PDFDocument? document;
//   static const route_name = 'pdf_reader';
//
//   final pdfController = PdfController(document: PdfDocument.openAsset(Assets.reglement_interieur_pdf));
//
//   @override
//   void initState() {
//     super.initState();
//     //launch(document);
//   }
//   var screenHeight,screenWidth;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     screenHeight = size.height;
//     screenWidth = size.width;
//
//     return Scaffold(
//         appBar: AppBar(
//         title: Text("REGLEMENT INTERIEUR"),
//         backgroundColor: hexToColor("#008bb2"),
//     ),
//     body: SafeArea(
//       child: PdfView(
//         controller: pdfController,
//         pageLoader: Container(
//           height: screenHeight,
//           width: screenWidth,
//           child: Card(
//             color: Colors.white38,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircularProgressIndicator(),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text('Chargement du document en cour ...',
//                     style: TextStyle(
//                         fontSize: 14, color: Colors.blue)),
//               ],
//             ),
//           ),
//         ),
//         pageBuilder: (
//             Future<PdfPageImage> pageImage,
//             int index,
//             PdfDocument document,
//             ) => PhotoViewGalleryPageOptions(
//           imageProvider: PdfPageImageProvider(
//             pageImage,
//             index,
//             document.id,
//           ),
//           minScale: PhotoViewComputedScale.contained * 1,
//           maxScale: PhotoViewComputedScale.contained * 3.0,
//           initialScale: PhotoViewComputedScale.contained * 1.0,
//           heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
//         ),
//       )
//       ));
//       /* Center(
//         child:   Container(
//           color: Colors.orangeAccent,
//           child: RichText(
//             text:  LinkTextSpan(
//                 url: document,
//                 text: 'Show My Pdf'),
//           ),
//         )
//        // PDFViewer(document: document!, zoomSteps: 1),
//       )*/
//
//   }
// }

/*FutureBuilder(
        future: PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf'),
        builder: (_, pdfData) {
          if (pdfData.connectionState == ConnectionState.waiting) {
            return CenterCircularProgressBar();
          } else if (pdfData.data == null) {
            return CenterText('Not able to open PDF file');
          } else {
            return PDFViewer(document: pdfData.data);
          }
        },
      ),*/
/*

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle? style, String? url, String? text})
      : super(
      style: style,
      text: text ?? url,
      recognizer: new TapGestureRecognizer()
        ..onTap = () {
          launch(url!);
        });
}

class CenterCircularProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CenterText extends StatelessWidget {
  final String stringValue;

  CenterText(this.stringValue);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        stringValue,
      ),
    );
  }
}*/
