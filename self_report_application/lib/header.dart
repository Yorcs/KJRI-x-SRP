import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_report_application/styling.dart';

class BuildHeader extends StatelessWidget{
  const BuildHeader({
    super.key,
    required this.pageName,
    required this.assetName,
  });

  final String pageName;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          padding: const EdgeInsets.fromLTRB(10, 35, 0, 0),
          child: TextHeader(
            pageName: pageName
          ),
        ),
        SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: 
          SvgPicture.asset(
            assetName,
            fit: BoxFit.contain
          ),
        ),
      ],
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.pageName,
  });

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
        Padding(
          padding: EdgeInsets.only(left: 15.0)
        ),
        Flexible(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 37.0,
              width: 214.0,
              color: Color.fromRGBO(227, 238, 248, 1),
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                pageName,
                textAlign: TextAlign.left,
                style: TextStyling.captionTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
