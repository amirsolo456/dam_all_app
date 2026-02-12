import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text_from_field.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/date_picker_field.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/status_drop_down.dart';

class InvoiceInfoWidget extends StatefulWidget {
  const InvoiceInfoWidget({super.key});

  @override
  State<InvoiceInfoWidget> createState() => _State();
}

class _State extends State<InvoiceInfoWidget> {
  String? invoiceNumber, promotionCode;
  double totalAmount = 0;
  String prefix = 'DEV-';
  late String prefixMsg = context.l10n.componentsMessagesInvoiceNumberPrefix(
    prefix,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 12,
          children: <Widget>[
            Row(
              spacing: 12,
              children: <Widget>[
                Expanded(
                  child: CustomTextFormField(
                    enabled: false,
                    label: 'سند',
                    initialValue: '',
                    onChanged: (String value) => invoiceNumber = value,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return context.l10n.invoice_number;
                      }
                      if (!value.startsWith(prefix)) {
                        return prefixMsg;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                // const SizedBox(width: 12),
                const Expanded(child: DatePickerField()),
              ],
            ),

            CustomTextFormField(
              label: context.l10n.invoice_discount_code,
              initialValue: '',
              onChanged: (String value) => promotionCode = value,
              keyboardType: TextInputType.number,
            ),

            CustomTextFormField(
              label: context.l10n.invoice_totalAmount,
              initialValue: '',
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  totalAmount = double.tryParse(value) ?? 0.0;
                }
              },
              validator: (String? value) {

                return null;
              },
            ),

            const StatusDropDown(),
          ],
        ),
      ),
    );
  }
}
