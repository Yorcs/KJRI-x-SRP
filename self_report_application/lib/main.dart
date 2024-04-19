import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/living_abroad_data.dart';
import 'package:self_report_application/goal_of_staying.dart';
import 'package:self_report_application/styling.dart';
import 'package:self_report_application/requirements_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(MyApp());
}

//Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future <void> clearData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    clearData();
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Onboarding Lapor Diri',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: IdentityPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
}

Future <void> getItemAndNavigate (BuildContext context) async {
    await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => RequirementsPage()
    )
  );
}

//Welcome Page
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Container(
              //TODO: Make the Image and the text scale depending on the size of the screen
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo Image
                  Image(
                    image: AssetImage('images/logo.png'),
                    width: 97,
                    height: 97,
                    fit: BoxFit.contain
                    ),
                  //Title
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      'Selamat Datang ke Tutorial Lapor Diri', 
                      style: TextStyling.firstHeaderTextStyle,
                      textAlign: TextAlign.center,),
                  ),
                  //TODO: Change Illustration
                  Image(
                    image: AssetImage('images/ListImage.png'),
                    width: 310,
                    height: 306,
                    fit: BoxFit.contain
                    ),
                  //Text
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Kemudahan Pelayanan & Perlindungan Bagi WNI di Luar Negeri',
                      style: TextStyling.thirdHeaderTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,), 
                  //TODO: Adjust button position
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ForwardButtons(
                        onPressed: () => getItemAndNavigate(context)
                      ),
                    ],
                  ),
                  SizedBox(height: 20,), 
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
