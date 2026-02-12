import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const DataGridPage(),
    );
  }
}

class Order {
  Order(this.orderId, this.name, this.city, this.country);

  final String orderId;
  final String name;
  final String city;
  final String country;
}

class OrderDataSource extends DataGridSource {
  OrderDataSource({required List<Order> orders}) {
    _orders = orders
        .map<DataGridRow>(
          (Order order) => DataGridRow(
            cells: <DataGridCell<dynamic>>[
              DataGridCell<String>(
                columnName: 'Order ID',
                value: order.orderId,
              ),
              DataGridCell<String>(columnName: 'Name', value: order.name),
              DataGridCell<String>(columnName: 'City', value: order.city),
              DataGridCell<String>(columnName: 'Country', value: order.country),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _orders = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => _orders;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((DataGridCell<dynamic> dataGridCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}

class DataGridPage extends StatefulWidget {
  const DataGridPage({super.key});

  @override
  State<DataGridPage> createState() => _DataGridPageState();
}

class _DataGridPageState extends State<DataGridPage> {
  final List<Order> _orders = <Order>[
    Order('12345', 'Pfooo', 'Campinas', 'Brazil'),
    Order('12345', 'Pfooo', 'Campinas', 'Brazil'),
    Order('12345', 'Pfooo', 'Campinas', 'Brazil'),
    Order('12345', 'Pfooo', 'Campinas', 'Brazil'),
    Order('12345', 'Pfooo', 'Campinas', 'Brazil'),
  ];

  late OrderDataSource _orderDataSource;

  @override
  void initState() {
    super.initState();
    _orderDataSource = OrderDataSource(orders: _orders);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('DataGrid Example')),
      body: Column(
        children: <Widget>[
          // Buttons Row
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // Delete functionality
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // Edit functionality
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // DataGrid
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SfDataGrid(
                source: _orderDataSource,
                columns: <GridColumn>[
                  GridColumn(
                    columnName: 'Order ID',
                    width: 100,
                    label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Order ID',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Name',
                    width: 120,
                    label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'City',
                    width: 120,
                    label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'City',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Country',
                    width: 120,
                    label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Country',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
              ),
            ),
          ),

          // Pagination and Footer
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('1 of 20 Pages'),
                Row(
                  children: <Widget>[
                    const Text('Rows per page'),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<int>(
                        value: 10,
                        underline: const SizedBox(),
                        items: <DropdownMenuItem<int>>[
                          const DropdownMenuItem<int>(value: 10, child: Text('10')),
                          const DropdownMenuItem<int>(value: 20, child: Text('20')),
                          const DropdownMenuItem<int>(value: 50, child: Text('50')),
                        ],
                        onChanged: (int? value) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
