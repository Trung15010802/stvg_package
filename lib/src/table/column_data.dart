class ColumnData<T> {
  final String name;
  final dynamic Function(T) getData;

  ColumnData({required this.name, required this.getData});
}
