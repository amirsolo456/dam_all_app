import 'package:flutter/material.dart';

class HoverableRow extends StatefulWidget {
  final List<String> cells;
  final VoidCallback? onTap;
  final bool isSelected;

  const HoverableRow({
    super.key,
    required this.cells,
    this.onTap,
    this.isSelected = false,
  });

  @override
  State<HoverableRow> createState() => _HoverableRowState();
}
class _HoverableRowState extends State<HoverableRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.isSelected
        ? Colors.blue.withAlpha(200)
        : _hovered
        ? Colors.white.withAlpha(500)
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 44,
          color: bgColor,
          child: Row(
            children: List< Widget>.generate(
              6,
                  (int index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    index < widget.cells.length ? widget.cells[index] : '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class HoverableRow extends StatefulWidget {
  final List<String> cells;

  const HoverableRow({super.key, required this.cells});

  @override
  State<HoverableRow> createState() => _HoverableRowState();
}

class _HoverableRowState extends State<HoverableRow> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        decoration: BoxDecoration(
          color: hovering
              ? const Color(0xff1A1A1C)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade800),
          ),
        ),
        child: Row(
          children: widget.cells.map((cell) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  cell,
                  style: const TextStyle(color: Colors.white54),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
*/
