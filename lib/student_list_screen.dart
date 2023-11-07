import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kitcamp2023/imitation_list_tile.dart';
import 'package:kitcamp2023/student.dart';

class StudentFilterScreen extends StatefulWidget {
  const StudentFilterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentFilterScreenState createState() => _StudentFilterScreenState();
}

class _StudentFilterScreenState extends State<StudentFilterScreen> {
  List<Student> students = [];
  Set<String> selectedProjects = {};
  Set<String> selectedRoles = {};

  @override
  void initState() {
    super.initState();
    loadJsonData().then((data) {
      setState(() {
        students = data;
      });
    });
  }

  Future<List<Student>> loadJsonData() async {
    String data = await rootBundle.loadString('json/person.json');
    List<dynamic> jsonData = json.decode(data);
    List<Student> students = jsonData.map((json) {
      return Student(
        name: json['name'],
        classes: json['class'],
        projects: List<String>.from(json['project']),
        roles: List<String>.from(json['role']),
      );
    }).toList();
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 8.0,
          children: <Widget>[
            for (var project in getAvailableProjects())
              FilterChip(
                label: Text(
                  project,
                  style: const TextStyle(color: Color(0xFF333A47)),
                ),
                selected: selectedProjects.contains(project),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedProjects.add(project);
                    } else {
                      selectedProjects.remove(project);
                    }
                  });
                },
              ),
            for (var role in getAvailableRoles())
              FilterChip(
                label: Text(
                  role,
                  style: const TextStyle(color: Color(0xFF333A47)),
                ),
                selected: selectedRoles.contains(role),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedRoles.add(role);
                    } else {
                      selectedRoles.remove(role);
                    }
                  });
                },
              ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: getFilteredStudents().length,
            itemBuilder: (context, index) {
              return ImitationListTile(
                height: 40,
                leading: Text(
                  getFilteredStudents()[index].classes,
                  style: const TextStyle(color: Colors.white70),
                ),
                title: Text(getFilteredStudents()[index].name,
                    style: const TextStyle(color: Colors.white70)),
              );
            },
          ),
        ),
      ],
    );
  }

  List<String> getAvailableProjects() {
    Set<String> projects = {};
    for (var student in students) {
      projects.addAll(student.projects);
    }
    return projects.toList();
  }

  List<String> getAvailableRoles() {
    Set<String> roles = {};
    for (var student in students) {
      roles.addAll(student.roles);
    }
    return roles.toList();
  }

  List<Student> getFilteredStudents() {
    List<Student> filteredStudents = List.from(students);
    if (selectedProjects.isNotEmpty) {
      filteredStudents.retainWhere((student) => student.projects
          .any((project) => selectedProjects.contains(project)));
    }
    if (selectedRoles.isNotEmpty) {
      filteredStudents.retainWhere((student) =>
          student.roles.any((role) => selectedRoles.contains(role)));
    }
    return filteredStudents;
  }
}
