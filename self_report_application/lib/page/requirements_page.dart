import 'package:flutter/material.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/styling.dart';

Future <void> getItemAndNavigate (BuildContext context) async {
    await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => IdentityPage()
    )
    );
}

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
              //TODO: Make the Image and the text scale depending on the size of the screen
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
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
                    style: TextStyling.firstHeaderTextStyle,
                    textAlign: TextAlign.center,
                  ),
            
                  //Sub header Text
                  Text(
                    'Pengisian ini sesuai dengan peraturan/kebiasaan yang berlaku di Indonesia',
                    style: TextStyling.secondHeaderTextStyle,
                    textAlign: TextAlign.center,
                  ),
                
                  //text
                    Text(
                    'Sebelum mulai mengisi, siapkan dokumen pada perangkat:',
                    style: TextStyling.regularBoldTextStyle,
                    textAlign: TextAlign.center,
                  ),
            
                  //List
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  SizedBox(height: 135,), 
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
