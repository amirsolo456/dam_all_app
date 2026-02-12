import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';

class StatusDropDown extends StatefulWidget {
  const StatusDropDown({super.key});

  @override
  State<StatusDropDown> createState() => _StatusDropDownState();
}

class _StatusDropDownState extends State<StatusDropDown> {
  late String selectedStatus = context.l10n.invoice_state_canceled;

  List<String> get _statusOptions => <String>[
    context.l10n.invoice_state_completed,
    context.l10n.invoice_state_canceled,
    context.l10n.invoice_state_refunded,
    context.l10n.invoice_state_pending,
  ];

  Color _getStatusColor(String status) {
    if (status == context.l10n.invoice_state_completed) {
      return Colors.green;
    }
    if (status == context.l10n.invoice_state_pending) {
      return Colors.orange;
    }
    if (status == context.l10n.invoice_state_canceled) {
      return Colors.grey;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            context.l10n.invoice_state_status,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: selectedStatus,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
            items: _statusOptions.map((String status) {
              final Color statusColor = _getStatusColor(status);
              return DropdownMenuItem<String>(
                value: status,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: statusColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(status),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedStatus = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.invoice_state_common_selectionMsg;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
