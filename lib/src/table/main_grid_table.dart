// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stvg_package/src/table/column_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:stvg_package/src/table/grid_table.dart';

import 'grid_column_title.dart';
import 'table_data_source.dart';

class MainGridTable<T> extends StatefulWidget {
  final List<ColumnData> columnsData;
  final List<T> listModel;
  final bool showCheckBox;
  final Map<int, Widget Function(T)> customCellWidget;
  const MainGridTable({
    Key? key,
    required this.columnsData,
    required this.listModel,
    this.showCheckBox = false,
    required this.customCellWidget,
  }) : super(key: key);

  @override
  State<MainGridTable<T>> createState() => _MainGridTableState<T>();
}

class _MainGridTableState<T> extends State<MainGridTable<T>> {
  late final TableDataSource dataGridSource;
  late final List<GridColumn> columns;

  @override
  void initState() {
    super.initState();
    dataGridSource = TableDataSource<T>(
      list: widget.listModel,
      columnsData: widget.columnsData,
      customCellWidget: widget.customCellWidget,
    );

    columns = widget.columnsData
        .map(
          (e) => GridColumn(
            columnName: e.name,
            label: GridCollumTitle(
              name: e.name,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridTable(
      collums: columns,
      dataGridSource: dataGridSource,
      showCheckBox: widget.showCheckBox,
    );
  }
}
