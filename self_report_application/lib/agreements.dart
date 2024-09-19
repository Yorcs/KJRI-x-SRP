import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Agreements extends StatefulWidget {
  @override
  State<Agreements> createState() => _AgreementsState();
}

class _AgreementsState extends State<Agreements> {
  late PDFControllerPinch pdfControllerPinch;

  @override
  void initState(){
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: document);
  }
  @override
  Widget build(BuildContext context) {
       
  }
}