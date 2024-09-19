import 'package:flutter/material.dart';
import 'package:self_report_application/page/requirements_page.dart';
import 'package:self_report_application/styling.dart';
import '../components/agreements.dart' as full_dialog;

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

  Future <void> getItemAndNavigate (BuildContext context) async {
    await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => RequirementsPage()
    )
    );
  }

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
                    SizedBox(height: 135,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ForwardButtons(
                          enableButton: termChecker,
                          onPressed: () => getItemAndNavigate(context)
                        ),
                      ],
                    ),
                    SizedBox(height: 20,), 
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
          return full_dialog.Agreements();
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
    termChecker = true;
  }

}