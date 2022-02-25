import 'dart:io';

import 'package:flutter/services.dart' show ByteData, rootBundle;


import 'package:flutter/material.dart';
import 'package:greeting_card/screens/my_pdf_editer/edit_pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class MyPdfEditer extends StatefulWidget {
  const MyPdfEditer({Key? key}) : super(key: key);

  @override
  _MyPdfEditerState createState() => _MyPdfEditerState();
}

class _MyPdfEditerState extends State<MyPdfEditer> {
  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Get The Text"),
          color: Colors.yellow,
          onPressed: () async {

            //Load an existing PDF document.
            final PdfDocument document =
            PdfDocument(inputBytes: await _readDocumentData('test.pdf'));
            //Extract the text from all the pages.

            //Find the text and get matched items.
            List<MatchedItem> textCollection =
            PdfTextExtractor(document).findText(['Name', 'Place','Location']);

            //Get the matched item in the collection using index.
            MatchedItem matchedText = textCollection[0];
            MatchedItem matchedText2 = textCollection[1];
            MatchedItem matchedText3 = textCollection[2];

            //Get the text bounds.
            Rect textBounds = matchedText.bounds;
            //Get the page index.
            int pageIndex = matchedText.pageIndex;
            //Get the text.
            String text = matchedText.text;
            String text2 = matchedText2.text;
            String text3 = matchedText3.text;

             //String allText = PdfTextExtractor(document).extractText();

            print(text);
            print(text2);
            print(text3);
            // print(allText);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  EditPdf(text, text2, text3)),
            );
          },
        ),
      ),
    );
  }
}
