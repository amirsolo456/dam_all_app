import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_text_from_field.dart';

class CustomerInformationCard extends StatelessWidget {
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onPhoneChanged;

  const CustomerInformationCard({
    super.key,
    required this.onNameChanged,
    required this.onAddressChanged,
    required this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        textDirection: .rtl,
        spacing: 12,

        children: <Widget>[
          CustomTextFormField(

            label: 'نام خریدار',
            keyboardType: TextInputType.name,
            onChanged: onNameChanged,
            validator: (String? value) =>
                value == null || value.isEmpty ? 'نام را وارد کنید' : null,
            initialValue: '',
          ),
          // const SizedBox(height: 12),
          CustomTextFormField(
            label: 'آدرس',
            keyboardType: TextInputType.streetAddress,
            onChanged: onAddressChanged,
            initialValue: '',
          ),
          // const SizedBox(height: 12),
          CustomTextFormField(
            label: 'شماره تماس',
            keyboardType: TextInputType.phone,
            onChanged: onPhoneChanged,
            initialValue: '',
          ),
        ],

    );
  }
}
