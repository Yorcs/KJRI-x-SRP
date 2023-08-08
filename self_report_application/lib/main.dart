import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_report_application/styling.dart';
import 'package:self_report_application/requirements_page.dart';

void main() {
  runApp(MyApp());
}

//Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Logo Image
                        Image(
                          image: AssetImage('images/logo.png'),
                          width: 100,
                          height: 100,),
                        //Title
                        Text(
                          'Selamat Datang ke Lapor Diri', 
                          style: TextStyling.headerTextStyle),
                        //Freepik Illustration
                        Image(
                          image: AssetImage('images/ListImage.png'),
                          ),
                        //Text
                        Text(
                          'Kemudahan Pelayanan & Perlindungan Bagi WNI di Luar Negeri'
                        ),
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
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
