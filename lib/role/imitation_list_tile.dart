import 'package:flutter/material.dart';

class ImitationListTile extends StatelessWidget {
  const ImitationListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    this.height,
    this.onTap,
  }) : super(key: key);

  final Text leading;
  final Text title;
  final List<String> trailing;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final _height = height ?? 54.0;

    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: _height),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, right: 16, left: 16),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 32.0),
              title,
              const Spacer(),
              Wrap(
                spacing: 8.0,
                children: trailing.map((project) {
                  switch (project) {
                    case 'BusStop':
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.orange, // プロジェクト情報の背景色を設定
                      );
                    case 'CirKit':
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blue, // プロジェクト情報の背景色を設定
                      );
                    case 'スマプロ':
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.grey, // プロジェクト情報の背景色を設定
                      );
                    case 'セキプロ':
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blueGrey, // プロジェクト情報の背景色を設定
                      );
                    case 'IoA':
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red, // プロジェクト情報の背景色を設定
                      );
                    default:
                      return Chip(
                        label: Text(
                          project,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green, // プロジェクト情報の背景色を設定
                      );
                  }
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
