import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:self_report_application/terms.dart';
import 'firebase_options.dart';
import 'package:self_report_application/styling.dart';
import 'package:self_report_application/requirements_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future <void> clearData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future <void> requestStoragePermission() async{
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    late final Map<Permission, PermissionStatus> statusess;

    if(androidInfo.version.sdkInt <= 32){
      statusess = await [Permission.storage].request();
    } else {
      statusess = await [Permission.photos].request();
    }

    statusess.forEach((permission, status){
      if(status != PermissionStatus.granted){
        AlertDialog(content: Text('Please allow storage permission to access the application'));
        openAppSettings();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    clearData();
    if(!kIsWeb){
      requestStoragePermission();
    }
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Onboarding Lapor Diri',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: WelcomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
}

Future <void> getItemAndNavigate (BuildContext context) async {
    await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TermPage()
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ForwardButtons(
                        enableButton: true,
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
