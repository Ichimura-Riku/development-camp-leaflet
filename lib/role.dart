import 'package:flutter/material.dart';
import 'package:kitcamp2023/student_list_screen.dart';

class Role extends StatelessWidget {
  const Role({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333A47),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333A47),
        elevation: 0,
        title: Text(
          'KITCAMP2023 Role',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white70),
        ),
      ),
      body: const StudentFilterScreen(),
    );
  }
}
