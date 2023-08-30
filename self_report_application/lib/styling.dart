import 'package:flutter/material.dart';



//creating custom text style
class TextStyling {
  //needs readjust
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  //needs readjust
  static const TextStyle subHeaderTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold
  );

  //needs readjust
  static const TextStyle regularTextStyle = TextStyle(
    fontSize: 16,
  );

  //needs readjust
  static const TextStyle regularBoldTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );
}

//Form
//TODO: Needs refactoring
class TextsForm extends StatelessWidget {
  const TextsForm({
    super.key,
    required this.labels,
  });

  final String labels;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labels,
      ),
      validator:(value){
        if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
          return "Invalid input"; //TODO: Please change prompt
        } else{
          return null;
        }
      },
    );
  }
}

//C