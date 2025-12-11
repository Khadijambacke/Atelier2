import 'package:flutter/material.dart';

class CtaButton extends StatefulWidget {
  const CtaButton({super.key});

  @override
  State<CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<CtaButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          counter++;
        });
      },
      child: Text("Commander !: $counter"),
    );
  }
}
