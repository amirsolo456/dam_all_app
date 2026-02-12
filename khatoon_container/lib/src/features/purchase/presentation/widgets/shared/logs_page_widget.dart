import 'package:flutter/material.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/shared_widgets.dart';

class LogsPageWidget extends StatefulWidget {
  const LogsPageWidget({super.key});

  @override
  State<LogsPageWidget> createState() => _LogsPageWidgetState();
}

class _LogsPageWidgetState extends State<LogsPageWidget> {
  // Logs
  // final List<LogEntry> _logs = <LogEntry>[
  //   LogEntry(
  //     message: 'Stripe charge complete (Charge ID: Secb8a687987708744aa2690)',
  //     time: 'Jan 31, 6:19 PM',
  //   ),
  //   LogEntry(
  //     message: 'Order status changed from Pending payment to Completed.',
  //     time: 'Jan 31, 6:19 PM',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SharedWidgets().getSectionHeader('Logs'),
          // Card(
          //   elevation: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Column(
          //       children: <Widget>[
          //         ..._logs.map(
          //               (LogEntry log) => Column(
          //             children: <Widget>[
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: <Widget>[
          //                   Container(
          //                     margin: const EdgeInsets.only(top: 4),
          //                     width: 8,
          //                     height: 8,
          //                     decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       color: Colors.blue[600],
          //                     ),
          //                   ),
          //                   const SizedBox(width: 12),
          //                   Expanded(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: <Widget>[
          //                         Text(
          //                           log.message,
          //                           style: const TextStyle(fontSize: 14),
          //                         ),
          //                         const SizedBox(height: 4),
          //                         Text(
          //                           log.time,
          //                           style: TextStyle(
          //                             fontSize: 12,
          //                             color: Colors.grey[600],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(height: 16),
          //             ],
          //           ),
          //         ),
          //
          //         // Load More button
          //         Center(
          //           child: TextButton(
          //             onPressed: () {},
          //             style: TextButton.styleFrom(
          //               foregroundColor: Colors.blue[600],
          //             ),
          //             child: const Text('Load more'),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
