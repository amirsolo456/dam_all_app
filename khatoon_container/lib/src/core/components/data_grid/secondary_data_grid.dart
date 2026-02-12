import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart'
    show
        GridColumn,
        SelectionMode,
        DataGridSource,
        DataGridRow,
        DataGridRowAdapter,
        DataGridCell,
        GridNavigationMode,
        ColumnWidthMode,
        SfDataGrid;

class Order {
  Order({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    this.isEditable = true,
  });

  final int id;
  String name;
  String city;
  String country;
  final bool isEditable;
}

class OrderDataSource extends DataGridSource {
  OrderDataSource(this.orders) {
    buildRows();
  }

  List<Order> orders;
  @override
  List<DataGridRow> rows = <DataGridRow>[];

  void buildRows() {
    rows = orders.map((Order order) {
      return DataGridRow(
        cells: <DataGridCell<dynamic>>[
          DataGridCell<int>(columnName: 'id', value: order.id),
          DataGridCell<String>(columnName: 'name', value: order.name),
          DataGridCell<String>(columnName: 'city', value: order.city),
          DataGridCell<String>(columnName: 'country', value: order.country),
        ],
      );
    }).toList();
  }

  void sfdg(DataGridSource dataSource) {
    SfDataGrid(
      source: dataSource,
      allowSorting: true,
      allowFiltering: true,
      selectionMode: SelectionMode.single,
      navigationMode: GridNavigationMode.cell,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'id',
          label: const Center(child: Text('Order ID')),
        ),
        GridColumn(
          columnName: 'name',
          label: const Center(child: Text('Name')),
        ),
        GridColumn(
          columnName: 'city',
          label: const Center(child: Text('City')),
        ),
        GridColumn(
          columnName: 'country',
          label: const Center(child: Text('Country')),
        ),
      ],
    );
  }

  // @override
  // List<DataGridRow> get rows => rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((DataGridCell<dynamic> cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
