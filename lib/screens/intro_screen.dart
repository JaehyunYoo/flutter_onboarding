import 'package:flutter/material.dart';
import 'package:flutter_intro_screen/contants/intro_text.dart';
import 'package:flutter_intro_screen/screens/login_screen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  Widget renderSkipBtn() {
    return const Text(
      '건너띄기',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget renderNextBtn() {
    return const Text(
      '다음',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget renderDoneBtn() {
    return const Text(
      '로그인하기',
      style: TextStyle(color: Colors.indigo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      renderSkipBtn: renderSkipBtn(),
      renderNextBtn: renderNextBtn(),
      slides: introTitle
          .map<Slide>(
            (list) => Slide(
              widgetTitle: _Title(
                text: list.text,
                boldText: list.boldText,
                subText: list.subText,
                descriptionsText: list.descriptionsText,
              ),
              centerWidget: _CenterImage(
                imagePath: list.imagePath,
              ),
              backgroundColor: Colors.white,
            ),
          )
          .toList(),
      onDonePress: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      renderDoneBtn: renderDoneBtn(),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  final String boldText;
  final String subText;
  final String descriptionsText;

  const _Title({
    required this.text,
    required this.boldText,
    required this.subText,
    required this.descriptionsText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      color: Colors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle.copyWith(fontWeight: FontWeight.normal),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: boldText,
                style: textStyle,
              ),
              TextSpan(
                text: subText,
                style: textStyle.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          descriptionsText,
          style: textStyle.copyWith(color: Colors.grey, fontSize: 16.0),
        ),
      ],
    );
  }
}

class _CenterImage extends StatelessWidget {
  final String imagePath;
  const _CenterImage({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
