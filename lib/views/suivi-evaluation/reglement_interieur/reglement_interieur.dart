import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../../../constants/Assets.dart';

class reglementInterieur extends StatefulWidget {
  const reglementInterieur({Key? key}) : super(key: key);

  @override
  State<reglementInterieur> createState() => _reglementInterieurState();
}

class _reglementInterieurState extends State<reglementInterieur> {
  static const int _initialPage = 2;
  bool _isSampleDoc = true;
  late PdfController _pdfController;
  String document = Assets.reglement_interieur_pdf;
  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openAsset(document),
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('REGLEMENT INTERIEUR'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: _pdfController,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (_isSampleDoc) {
                _pdfController.loadDocument(
                    PdfDocument.openAsset(document));
              } else {
                _pdfController
                    .loadDocument(PdfDocument.openAsset(document));
              }
              _isSampleDoc = !_isSampleDoc;
            },
          ),
        ],
      ),
      body: PdfView(
        builders: PdfViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          pageBuilder: _pageBuilder,
        ),
        controller: _pdfController,
      ),
    );
  }

  PhotoViewGalleryPageOptions _pageBuilder(
      BuildContext context,
      Future<PdfPageImage> pageImage,
      int index,
      PdfDocument document,
      ) {
    return PhotoViewGalleryPageOptions(
      imageProvider: PdfPageImageProvider(
        pageImage,
        index,
        document.id,
      ),
      minScale: PhotoViewComputedScale.contained * 1,
      maxScale: PhotoViewComputedScale.contained * 2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
    );
  }
}