import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Agreements extends StatefulWidget {
  @override
  State<Agreements> createState() => _AgreementsState();
}

class _AgreementsState extends State<Agreements> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState(){
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openAsset('pdfs/UU23_2006.pdf'));
  }

  @override
  void dispose(){
    super.dispose();
    pdfControllerPinch.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    ); 
  }

  Widget _buildUI(){
    return Column(
      children: [
        _pdfView(),
      ],
    );
  }

  Widget _pdfView(){
    return Expanded(
      child: PdfViewPinch(
        scrollDirection: Axis.vertical,
        controller: pdfControllerPinch,
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          pageLoaderBuilder: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorBuilder: (_, error) => Center(
            child: Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.red
              ),
            ),
          )
        ),
      ),
    );
  }
}