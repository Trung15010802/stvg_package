import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'table_data_source.dart';

class GridTable extends StatefulWidget {
  final TableDataSource dataGridSource;
  final List<GridColumn> collums;
  final bool showCheckBox;

  const GridTable({
    Key? key,
    required this.dataGridSource,
    required this.collums,
    this.showCheckBox = false,
  }) : super(key: key);

  @override
  State<GridTable> createState() => _TableState();
}

class _TableState extends State<GridTable> {
  late double pageCount;
  int _rowsPerPage = 15;

  void _updatePageCount() {
    final rowsCount = widget.dataGridSource.filterConditions.isNotEmpty
        ? widget.dataGridSource.effectiveRows.length
        : widget.dataGridSource.list.length;
    pageCount = (rowsCount / _rowsPerPage).ceilToDouble();
  }

  @override
  void initState() {
    _updatePageCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfDataGrid(
            allowFiltering: true,
            allowSorting: true,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            showCheckboxColumn: widget.showCheckBox,
            columnWidthMode: ColumnWidthMode.auto,
            source: widget.dataGridSource,
            columns: widget.collums,
            rowsPerPage: _rowsPerPage,
            onFilterChanged: (details) {
              _updatePageCount();
            },
          ),
        ),
        SfDataPager(
          pageCount: pageCount,
          delegate: widget.dataGridSource,
        )
      ],
    );
  }
}
