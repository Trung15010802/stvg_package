import 'package:flutter/material.dart';
import 'package:stvg_package/src/table/column_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableDataSource<T> extends DataGridSource {
  final List<T> list;
  final List<ColumnData> columnsData;
  final Map<int, Widget Function(T t)> customCellWidget;
  late List<DataGridRow> dataGridRows;

  TableDataSource({
    required this.list,
    required this.columnsData,
    this.customCellWidget = const {},
  }) {
    if (customCellWidget.length > columnsData.length) {
      throw ArgumentError(
          "Lỗi chiều dài customCellWidget.length không thể lớn hơn columnsData.length ");
    }
    buildDataGridRows();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.grey[200]!;
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          final int colIndex =
              columnsData.indexWhere((e) => e.name == dataGridCell.columnName);

          if (customCellWidget.containsKey(colIndex)) {
            return customCellWidget[colIndex]!(dataGridCell.value);
          }

          return const Offstage();
        },
      ).toList(),
    );
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() {
    dataGridRows = list.map<DataGridRow>(
      (dataGridRow) {
        return DataGridRow(
          cells: columnsData.map<DataGridCell>(
            (colData) {
              return DataGridCell<dynamic>(
                columnName: colData.name,
                value: dataGridRow,
              );
            },
          ).toList(),
        );
      },
    ).toList();
  }

  void updateDataGridDataSource() {
    notifyListeners();
  }
}
