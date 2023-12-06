import 'package:example/dummy_data.dart';
import 'package:example/employee.dart';
import 'package:flutter/material.dart';
import 'package:stvg_package/stvg_package.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MainGridTable<Employee>(
        columnsData: [
          ColumnData(name: 'ID', data: int),
          ColumnData(name: 'NAME', data: String),
          ColumnData(name: 'ROLE', data: String),
          ColumnData(name: 'SALARY', data: int),
        ],
        listModel: kEmployee,
        customCellWidget: {
          0: (e) => Container(
                padding: const EdgeInsets.all(8),
                child: Text(e.id.toString()),
              ),
          1: (e) => Container(
                padding: const EdgeInsets.all(8),
                child: Text(e.name),
              ),
          2: (e) => Container(
                padding: const EdgeInsets.all(8),
                child: Text(e.designation),
              ),
          3: (e) => Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  e.salary.toString(),
                ),
              ),
        },
      ),
    );
  }
}
