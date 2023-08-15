import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_report_application/styling.dart';
import 'package:self_report_application/requirements_page.dart';

class TextEditingControllerIdentity extends StatefulWidget{
  const TextEditingControllerIdentity({super.key});


  @override
  State<TextEditingControllerIdentity> createState() => _TextEditingControllerIdentityState();
  }

class _TextEditingControllerIdentityState extends State<TextEditingControllerIdentity>{
  final TextEditingController _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toString();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //make the form
      
    );
  }
}