import 'package:flutter/material.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
/*
    final selectedItem = await PurchaseItemSelector.show(context, availableItems);
    if (selectedItem != null) {
        setState(() {
        currentItem = selectedItem;
    });
}*/

class ItemPickerDialog extends StatelessWidget {
  final List<PurchaseItemModel> items;
  final String title;

  const ItemPickerDialog({
    super.key,
    required this.items,
    this.title = 'Select Product',
  });


  static Future<PurchaseItemModel?> show(
      BuildContext context, List<PurchaseItemModel> items,
      {String title = 'Select Product'}) {
    return showDialog<PurchaseItemModel>(
      context: context,
      builder: (_) => ItemPickerDialog(items: items, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (_, int index) {
            final PurchaseItemModel item = items[index];
            return ListTile(
              title: Text(item.id.toString()),
              subtitle: Text('Price: ${item.unitPrice.toStringAsFixed(2)}'),
              trailing: Text('Qty: ${item.qty}'),
              onTap: () => Navigator.of(context).pop(item),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        )
      ],
    );
  }

}
