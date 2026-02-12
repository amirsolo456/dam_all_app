import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/shared_widgets.dart';

class OrderItemsBuilder extends Column {
  final Function(int index)? editOrderItem;
  final VoidCallback? addNewOrderItem;
  // final List<OrderItem> orderItems;

  OrderItemsBuilder({
    super.key,
    // required this.orderItems,
    this.editOrderItem,
    this.addNewOrderItem,
  }) : super(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           OrderItems$CardBuilder(
             // orderItems: orderItems,
             addNewOrderItem: addNewOrderItem,
             editOrderItem: editOrderItem,
           ),
         ],
       );
}

class OrderItems$CardBuilder extends Card {
  final Function(int index)? editOrderItem;
  final VoidCallback? addNewOrderItem;
  // final List<OrderItem> orderItems;

  OrderItems$CardBuilder({
    super.key,
    // required this.orderItems,
    this.editOrderItem,
    this.addNewOrderItem,
  }) : super(
         elevation: 2,
         child: Padding(
           padding: const EdgeInsets.all(5.0),
           child: Column(
             children: <Widget>[
               SharedWidgets().getSectionHeader(''),
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 12),
                 decoration: BoxDecoration(
                   border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                 ),
                 child: const Row(
                   children: <Widget>[
                     Expanded(flex: 3, child: CustomText('Description')),
                     Expanded(child: CustomText('BILLING CYCLE')),
                     Expanded(child: CustomText('AMOUNT')),
                   ],
                 ),
               ),
               // ...orderItems.asMap().entries.map((
               //   MapEntry<int, OrderItem> entry,
               // ) {
               //   final int index = entry.key;
               //   final OrderItem item = entry.value;
               //   return Container(
               //     padding: const EdgeInsets.symmetric(vertical: 12),
               //     decoration: BoxDecoration(
               //       border: Border(
               //         bottom: BorderSide(color: Colors.grey[100]!),
               //       ),
               //     ),
               //     child: Row(
               //       children: <Widget>[
               //         Expanded(flex: 3, child: Text(item.description)),
               //         Expanded(child: Text(item.billingCycle)),
               //         Expanded(
               //           child: Text('\$${item.amount.toStringAsFixed(2)}'),
               //         ),
               //         IconButton(
               //           icon: const Icon(Icons.edit, size: 18),
               //           onPressed: () => (editOrderItem != null
               //               ? editOrderItem(index)
               //               : null),
               //           color: Colors.blue[600],
               //         ),
               //       ],
               //     ),
               //   );
               // }),
               const SizedBox(height: 16),
               // Add new item button
               OutlinedButton.icon(
                 onPressed: (addNewOrderItem ?? () {}),
                 icon: const Icon(Icons.add),
                 label: const Text('Add Order Item'),
                 style: OutlinedButton.styleFrom(
                   foregroundColor: Colors.blue[600],
                   side: BorderSide(color: Colors.blue[600]!),
                 ),
               ),

               // Pagination
               const SizedBox(height: 20),
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 12),
                 decoration: BoxDecoration(
                   border: Border(top: BorderSide(color: Colors.grey[300]!)),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Row(
                       children: <Widget>[
                         Text(
                           'Rows per page:',
                           style: TextStyle(color: Colors.grey[600]),
                         ),
                         const SizedBox(width: 8),
                         Container(
                           padding: const EdgeInsets.symmetric(
                             horizontal: 8,
                             vertical: 4,
                           ),
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey[300]!),
                             borderRadius: BorderRadius.circular(4),
                           ),
                           child: const Row(
                             children: <Widget>[
                               Text('5'),
                               Icon(Icons.arrow_drop_down, size: 16),
                             ],
                           ),
                         ),
                       ],
                     ),
                     Row(
                       children: <Widget>[
                         // Text(
                         //   '1–${orderItems.length} of ${orderItems.length}',
                         //   style: TextStyle(color: Colors.grey[600]),
                         // ),
                         const SizedBox(width: 8),
                         IconButton(
                           icon: const Icon(Icons.chevron_left),
                           onPressed: () {},
                           color: Colors.grey[600],
                         ),
                         IconButton(
                           icon: const Icon(Icons.chevron_right),
                           onPressed: () {},
                           color: Colors.grey[600],
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       );
}
