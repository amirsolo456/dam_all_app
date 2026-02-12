import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/section_card.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_form/purchase_form_widget.dart';

class PurchaseCreatePage extends StatelessWidget {
  final InvoiceType invoiceType;

  const PurchaseCreatePage({super.key, required this.invoiceType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(context.l10n.submit_buy_invoice),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      primary: false,
      resizeToAvoidBottomInset: true,
      body: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Column(
          children: <Widget>[
            SectionCard(
              // padding: const EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: .baseline,
                mainAxisSize: .min,
                spacing: 20,
                children: <Widget>[
                  const PurchaseFormWidget(),
                  // const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(context.l10n.submit_buy_invoice),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
