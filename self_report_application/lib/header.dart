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



class LinePath extends StatelessWidget {
  const LinePath({
    super.key,
    required this.opacity1,
    required this.opacity2,
    required this.opacity3,
    required this.opacity4,
    required this.changeColor1,
    required this.changeColor2,
    required this.changeColor3,
    required this.changeColor4,
  });

  final double opacity1;
  final double opacity2;
  final double opacity3;
  final double opacity4;

  final Color changeColor1;
  final Color changeColor2;
  final Color changeColor3;
  final Color changeColor4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        CircleAndLabel(
          labelName: "Identitas",
          pageNumber: '1',
          opacity: opacity1,
          changeColor: changeColor1,),
        SizedBox(width: 45,),
        CircleAndLabel(
          labelName: "Luar Negeri",
          pageNumber: '2',
          opacity: opacity2,
          changeColor: changeColor2,),
        SizedBox(width: 20,),
        Expanded(
          child: CircleAndLabel(
            labelName: "Tujuan",
            pageNumber: '3',
            opacity: opacity3,
            changeColor: changeColor3,),
        ),
        SizedBox(width: 5,),
        Expanded(
          child: CircleAndLabel(
            labelName: "Kontak",
            pageNumber: '4',
            opacity: opacity4,
            changeColor: changeColor4,),
        ),
      ],
    );
  }
}

class CircleAndLabel extends StatelessWidget {
  const CircleAndLabel({
    super.key,
    required this.labelName,
    required this.pageNumber,
    required this.opacity,
    required this.changeColor,
  });

  final String labelName;
  final String pageNumber;
  final double opacity;
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Circles(
          pageNumber: pageNumber,
          opacity: opacity,
          changeColor: changeColor,
        ),
        Text(
          labelName,
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontSize: 10,
            color: Color.fromRGBO(19, 63, 218, opacity),
          ),
        )
      ],
    );
  }
}

//TODO: Change Color
class Circles extends StatelessWidget {
  const Circles({
    super.key,
    required this.pageNumber,
    required this.opacity,
    required this.changeColor,
  });

  final String pageNumber;
  final double opacity;
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(19, 63, 218, opacity),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          pageNumber,
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontSize: 12,
            color: changeColor.withOpacity(opacity)
          )
        )
      )
    );
  }
}