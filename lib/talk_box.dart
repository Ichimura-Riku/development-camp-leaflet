import 'package:flutter/material.dart';

class TalkBox extends StatelessWidget {
  const TalkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333A47),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333A47),
        elevation: 0,
        title: Text(
          'KITCAMP2023 TalkBox',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}
