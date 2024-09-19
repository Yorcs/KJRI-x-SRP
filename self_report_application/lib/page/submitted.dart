import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/main.dart';
import 'package:self_report_application/styling.dart';

Future <void> getItemAndNavigate (BuildContext context) async {
    await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => WelcomePage()
    )
  );
}

//Requirements Page
class SubmittedPage extends StatelessWidget {
  const SubmittedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Container(
              //TODO: Make the Image and the text scale depending on the size of the screen
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Image(
                        image: AssetImage('images/logo.png'),
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0)
                      ),
                      Text(
                        'Lapor Diri',
                        textAlign: TextAlign.left,
                        style: TextStyling.secondHeaderTextStyle,
                      ),
                    ]
                  ),
                  SizedBox(height: 50,),
                  //Text
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Anda sudah siap!',
                      style: TextStyling.thirdHeaderTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //Text
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Terima kasih sudah mengisi tutorial aplikasi lapor diri',
                      style: TextStyling.thirdHeaderTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //Text
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Silahkan lanjut ke www.xxx.com untuk lapor diri kemlu',
                      style: TextStyling.thirdHeaderTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ForwardButtons(
                        onPressed: () => getItemAndNavigate(context)
                      ),
                    ],
                  ),
                ]
              )
            )
          )
        );
      }
    );
  }
}