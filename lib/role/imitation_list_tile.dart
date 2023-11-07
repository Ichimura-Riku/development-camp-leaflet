import 'package:flutter/material.dart';

class ImitationListTile extends StatelessWidget {
  const ImitationListTile({
    Key? key,
    required this.leading,
    required this.title,
    this.height,
    this.onTap,
  }) : super(key: key);

  final Text leading;
  final Text title;
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 32.0),
              title,
            ],
          ),
        ),
      ),
    );
  }
}
