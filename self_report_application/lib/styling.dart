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
//TODO: Needs refactoring to reduce redundancy
//TODO: change RegExp String according to what we need
//TODO: Find a way to save the data
class TextsForm extends StatelessWidget {
  const TextsForm({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.requiredData,
    required this.hintContent,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContent;
  final RegExp valueConstraints;
  final bool requiredData;

  // //Saved data string
  // late String savedLabel;
  // late String savedData;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintContent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.black
            )
          ),
      ),
      // onSaved: (value){
      //   if(!requiredData || !valueConstraints.hasMatch(value!)){
          
      //   } else {
      //     savedLabel: labels;
      //     savedData: value;
      //   }
      // },
      validator:(value){
        if(!requiredData || !valueConstraints.hasMatch(value!)){
          return "Invalid input"; //TODO: Please change prompt
        } else{
          return null;
        }
      },
    );
  }
}

//Pop up dialog button
//TODO: Find a new placement since it cannot be placed next to the label text.
//TODO: Change icon
class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.contents,
  });

  final String contents;

//TODO: Replace placeholders
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(contents),
        )),
      icon: const Icon(Icons.add_alert),
      );
  }
}




//C