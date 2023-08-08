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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Logo Image
                      //Title
                      Text(
                        'Persyaratan Pengisian Lapor Diri', 
                        style: TextStyling.headerTextStyle),

                      //Sub header Text
                      Text(
                        'Pengisian ini sesuai dengan peraturan/kebiasaan yang berlaku di Indonesia',
                        style: TextStyling.subHeaderTextStyle
                      ),

                      //text
                        Text(
                        'Sebelum mulai mengisi, siapkan dokumen pada perangkat:',
                        style: TextStyling.subHeaderTextStyle
                      ),
                      
                      //List
                      
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
        );
      }
    );
  }
}
