import 'package:flutter/material.dart';

//Terms and Conditions page
class TermPage extends StatelessWidget {
  const TermPage({super.key});


  @override
  Widget build(BuildContext context) {
    return TermScreen();
  }
}

class TermScreen extends StatefulWidget {
  const TermScreen({super.key});
  
  @override
  State<TermScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermScreen> {
  bool termChecker = false;

  @override
   Widget build(BuildContext context) {
      return LayoutBuilder(
        builder:(context, constraints){
          return Scaffold(
            body: Center(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        _openAgreeDialog(context);
                      },
                    ),
                  ],
                ),
              )
            )
          );
        }
      );
  }

  Future _openAgreeDialog(context) async {
    String result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return fullDialog.CreateAgreement();
        },
        //true to display with a dismiss button rather than a return navigation arrow
        fullscreenDialog: true));
    if (result != null) {
      letsDoSomething(context);
    } else {
      print('you could do another action here if they cancel');
    }
  }

  letsDoSomething(context) {
    print('succreed');
  }

}