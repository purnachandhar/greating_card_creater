import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

///Dart import
import 'dart:io';

///Package imports
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';


class EditPdf extends StatefulWidget {
   String text;
   String text2;
   String text3;

   EditPdf(this.text,  this.text2, this.text3,);

  @override
  _EditPdfState createState() => _EditPdfState();
}

class _EditPdfState extends State<EditPdf> {

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  double _calculateXPosition(String text, PdfFont font, double pageWidth) {
    final Size textSize =
    font.measureString(text, layoutArea: Size(pageWidth, 0));
    return (pageWidth - textSize.width) / 2;
  }

    @override
  Widget build(BuildContext context) {
      TextEditingController editingController = TextEditingController(text: widget.text);
      TextEditingController editingController2 = TextEditingController(text: widget.text2);
      TextEditingController editingController3 = TextEditingController(text: widget.text3);

      return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editingController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editingController2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: editingController3,
              ),
            ),
            RaisedButton(
                child: Text("Save"),
                color: Colors.yellow,
                onPressed: ()async{
                  final PdfDocument document =
                  PdfDocument(inputBytes: await _readDocumentData('test.pdf'));

                  //Get the form
                  final PdfForm form = document.form;

                  print(form.fields.count);

                  //Get text box and fill value
                  final PdfTextBoxField name = document.form.fields[0] as PdfTextBoxField;
                  name.text = editingController.text;

                  // final PdfTextBoxField place = document.form.fields[1] as PdfTextBoxField;
                  // place.text = editingController2.text;
                  //
                  // final PdfTextBoxField location = document.form.fields[2] as PdfTextBoxField;
                  // location.text = editingController3.text;

                  //Disable to view the form field values properly in mobile viewers
                  form.setDefaultAppearance(false);

                  //Save and launch the document
                  final List<int> bytes = document.save();

                  //Save and launch file.
                  await FileSaveHelper.saveAndLaunchFile(bytes,  'Form.pdf');







                  /*try{
                    //Create a PDF document.
                    final PdfDocument document = PdfDocument();
                    document.pageSettings.orientation = PdfPageOrientation.portrait;
                    document.pageSettings.margins.all = 0;

                    //Add page to the PDF
                    final PdfPage page = document.pages.add();
                    //Get the page size
                    final Size pageSize = page.getClientSize();
                    page.graphics.drawImage(PdfBitmap(await _readDocumentData('test.pdf')),
                        Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));

                    final PdfFont nameFont = PdfStandardFont(PdfFontFamily.helvetica, 22);
                    final PdfFont controlFont = PdfStandardFont(PdfFontFamily.helvetica, 19);
                    final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 16);

                    double x =
                    _calculateXPosition(editingController.text, nameFont, pageSize.width);
                    page.graphics.drawString(editingController.text, nameFont,
                        bounds: Rect.fromLTWH(x, 253, 0, 0),
                        brush: PdfSolidBrush(PdfColor(20, 58, 86)));
                    x = _calculateXPosition(
                        editingController2.text, controlFont, pageSize.width);
                    page.graphics.drawString(editingController2.text, controlFont,
                        bounds: Rect.fromLTWH(x, 340, 0, 0),
                        brush: PdfSolidBrush(PdfColor(20, 58, 86)));
                    x = _calculateXPosition(
                        editingController3.text, controlFont, pageSize.width);
                    page.graphics.drawString(editingController3.text, controlFont,
                        bounds: Rect.fromLTWH(x, 385, 0, 0),
                        brush: PdfSolidBrush(PdfColor(20, 58, 86)));

                    final List<int> bytes = document.save();

                    //Dispose the document.
                    document.dispose();
                    //Save and launch file.
                    await FileSaveHelper.saveAndLaunchFile(bytes, 'Certificate.pdf');
                  }catch(e){
                    print(e);
                  }*/
                  // final String dateText = 'on ' + editingController3.text;
                  // x = _calculateXPosition(dateText, dateFont, pageSize.width);
                  // page.graphics.drawString(dateText, dateFont,
                  //     bounds: Rect.fromLTWH(x, 385, 0, 0),
                  //     brush: PdfSolidBrush(PdfColor(20, 58, 86)));

                  // final PdfDocument document =
                  // PdfDocument(inputBytes: await _readDocumentData('test.pdf'));

                  //Get the form.
                  // PdfForm form = document.form;
                  //Get text box and fill value.
                  // PdfTextElement name = document.form.fields[0] as PdfTextElement;

                  // form.flattenAllFields();

                  //PdfTextBoxField name2 = document.form.fields[1] as PdfTextBoxField;
                  // PdfTextBoxField name3 = document.form.fields[2] as PdfTextBoxField;
                  // name.text = editingController.text;
                  // name2.text = editingController.text;
                  // name3.text = editingController.text;
                  // print(name);

                  //Save and dispose the document.
                  // File('form.pdf').writeAsBytesSync(document.save());
                  // print(name2);
                  // print(name3);
                  print(editingController.text);
                  print(editingController2.text);
                  print(editingController3.text);
                }
            )
          ],
        ),
      ),
    );
  }


}
// ignore: avoid_classes_with_only_static_members
///To save the pdf file in the device
class FileSaveHelper {
  static const MethodChannel _platformCall = MethodChannel('launchFile');

  ///To save the pdf file in the device
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    String? path;
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isWindows) {
      final Directory directory = await getApplicationSupportDirectory();
      path = directory.path;
    } else {
      path = await PathProviderPlatform.instance.getApplicationSupportPath();
    }
    final File file =
    File(Platform.isWindows ? '$path\\$fileName' : '$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (Platform.isAndroid || Platform.isIOS) {
      final Map<String, String> argument = <String, String>{
        'file_path': '$path/$fileName'
      };
      try {
        //ignore: unused_local_variable
        final Future<Map<String, String>?> result =
        _platformCall.invokeMethod('viewPdf', argument);
      } catch (e) {
        throw Exception(e);
      }
    } else if (Platform.isWindows) {
      await Process.run('start', <String>['$path\\$fileName'],
          runInShell: true);
    } else if (Platform.isMacOS) {
      await Process.run('open', <String>['$path/$fileName'], runInShell: true);
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', <String>['$path/$fileName'],
          runInShell: true);
    }
  }
}