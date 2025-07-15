import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({super.key});

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  final String _firstLine = "Silence is not empty";
  final String _secondLine = "It’s full of answers";
  final int _typingSpeed = 75; // Typing speed in milliseconds
  final int _fadeDuration = 200; // Fade-in duration for each character

  List<int> _visibleFirstLineChars = [];
  List<int> _visibleSecondLineChars = [];

  @override
  void initState() {
    super.initState();
    _startTypewriterEffect();
  }

  Future<void> _startTypewriterEffect() async {
    //// Typing the first line
    for (int i = 0; i <= _firstLine.length; i++) {
      setState(() {
        _visibleFirstLineChars = List.generate(
          i,
          (index) => index,
        ); 
      });
      await Future.delayed(Duration(milliseconds: _typingSpeed));
    }

    //// Delay before typing the second line
    await Future.delayed(Duration(milliseconds: 100));

    //// Typing the second line
    for (int i = 0; i <= _secondLine.length; i++) {
      setState(() {
        _visibleSecondLineChars = List.generate(
          i,
          (index) => index,
        ); 
      });
      await Future.delayed(Duration(milliseconds: _typingSpeed));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: List.generate(_firstLine.length, (index) {
            String char = _firstLine[index];
            return AnimatedOpacity(
              opacity: _visibleFirstLineChars.contains(index) ? 1.0 : 0.0,
              duration: Duration(milliseconds: _fadeDuration),
              child: Text(
                char,
                textAlign: TextAlign.center,
                style: TypographyStyles.snigletNormal24Colored(),
              ),
            );
          }),
        ),
        Wrap(
          children: List.generate(_secondLine.length, (index) {
            String char = _secondLine[index];
            return AnimatedOpacity(
              opacity: _visibleSecondLineChars.contains(index) ? 1.0 : 0.0,
              duration: Duration(milliseconds: _fadeDuration),
              child: Text(
                char,
                textAlign: TextAlign.center,
                style: TypographyStyles.snigletNormal24Colored(),
              ),
            );
          }),
        ),
      ],
    );
  }
}
