import 'package:flutter/material.dart';

class ControlledDropdown extends StatefulWidget {
  final bool isOpen;
  final void Function(bool)? onToggle;
  final List<String> options;
  final String initialValue;
  final Widget? leadingIcon;

  const ControlledDropdown({
    super.key,
    this.isOpen = false,
    this.onToggle,
    required this.options,
    required this.initialValue,
    this.leadingIcon,
  });

  @override
  State<ControlledDropdown> createState() => _ControlledDropdownState();
}

class _ControlledDropdownState extends State<ControlledDropdown> {
  late String selectedValue;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant ControlledDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen != oldWidget.isOpen) {
      if (widget.isOpen) {
        _showOverlay();
      } else {
        _removeOverlay();
      }
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = _buttonKey.currentContext?.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4,
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: widget.options.map((String option) {
                  return ListTile(
                    leading: widget.leadingIcon,
                    title: Text(option),
                    onTap: () {
                      setState(() {
                        selectedValue = option;
                      });
                      _removeOverlay();
                      widget.onToggle?.call(false);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: InkWell(
        key: _buttonKey,
        onTap: () {
          widget.onToggle?.call(!widget.isOpen);
        },
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: <Widget>[
              // آواتار یا آیکون
              widget.leadingIcon ?? CircleAvatar(
                radius: 14,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  selectedValue[0],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  selectedValue,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Icon(
                widget.isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}