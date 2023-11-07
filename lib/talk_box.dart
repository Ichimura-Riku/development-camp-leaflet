import 'package:flutter/material.dart';
import 'dart:math' as math;

class TalkBox extends StatefulWidget {
  const TalkBox({Key? key}) : super(key: key);

  @override
  State<TalkBox> createState() => _TalkBoxState();
}

class _TalkBoxState extends State<TalkBox> {
  _myDialog() {
    var random = math.Random();
    List<String> contents = [
      "最近ハマってること",
      "プロジェクトに入った経緯",
      "コテージ行ったらやりたいこと",
      "今考えているキャリア"
    ];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text("お題"),
        content: Text(contents[random.nextInt(3)]),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "close",
              style: TextStyle(color: Color(0xFF333A47)),
            ),
          )
        ],
      ),
    );
  }

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
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              backgroundColor: Colors.white70),
          onPressed: _myDialog,
          child: const Text(
            'トークデッキ発動',
            style: TextStyle(color: Color(0xFF333A47)),
          ),
        ),
      ),
    );
  }
}
