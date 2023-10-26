import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        home: WelcomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
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
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: Text(
                      'Selamat Datang ke Lapor Diri', 
                      style: TextStyling.headerTextStyle,
                      textAlign: TextAlign.center,),
                  ),
                  //Freepik Illustration
                  Image(
                    image: AssetImage('images/ListImage.png'),
                    width: 330,
                    height: 326,
                    fit: BoxFit.contain
                    ),
                  //Text
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Kemudahan Pelayanan & Perlindungan Bagi WNI di Luar Negeri',
                      style: TextStyling.regularBoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //TODO: Adjust button position
                  ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RequirementsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
