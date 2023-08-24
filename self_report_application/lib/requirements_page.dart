import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';

//Requirements Page
class RequirementsPage extends StatelessWidget {
  const RequirementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Container(
              //TODO: readjust margin
              //TODO: readjust padding
              //TODO: Make the Image and the text scale depending on the size of the screen
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
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
                  Text(
                    'Persyaratan Pengisian Lapor Diri', 
                    style: TextStyling.headerTextStyle,
                    textAlign: TextAlign.center,
                  ),
            
                  //Sub header Text
                  Text(
                    'Pengisian ini sesuai dengan peraturan/kebiasaan yang berlaku di Indonesia',
                    style: TextStyling.subHeaderTextStyle,
                    textAlign: TextAlign.center,
                  ),
                
                  //text
                    Text(
                    'Sebelum mulai mengisi, siapkan dokumen pada perangkat:',
                    style: TextStyling.regularBoldTextStyle,
                    textAlign: TextAlign.center,
                  ),
            
                  //List
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. KTP',
                          style: TextStyling.regularBoldTextStyle,
                          textAlign: TextAlign.left,
                        ),
                  
                        Text(
                          '2. Paspor',
                          style: TextStyling.regularBoldTextStyle,
                          textAlign: TextAlign.left,
                        ),
                  
                        Text(
                          '3. Bukti Tinggal',
                          style: TextStyling.regularBoldTextStyle,
                          textAlign: TextAlign.left,
                        ),
                  
                        Text(
                          '4. Izin Tinggal',
                          style: TextStyling.regularBoldTextStyle,
                          textAlign: TextAlign.left,
                        ),

                        Text(
                          '5. Identitas Kontak Darurat di Luar Negeri dan di Indonesia',
                          style: TextStyling.regularBoldTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
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
          ),
        );
      }
    );
  }
}
