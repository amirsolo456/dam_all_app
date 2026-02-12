class Shortcut {
  final String id;            // e.g. "open_payments"
  final String action;        // e.g. "open"
  final String target;        // e.g. "microapp:payments"
  final Map<String, dynamic>? params;

  Shortcut({required this.id, required this.action, required this.target, this.params});
}