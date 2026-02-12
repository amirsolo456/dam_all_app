import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;

  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: <BoxShadow>[
          BoxShadow(color: color ?? const Color(0XFF1E1E1E)),
          const BoxShadow(offset: Offset(2, 2), blurRadius: 4),
        ],
      ),
      child: child,
    );
  }
}

class TagInputField extends StatefulWidget {
  const TagInputField({super.key});

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final Set<String> chips = List<String>.generate(
    1,
    (int index) => 'Chip ${index + 1}',
  ).toSet();
  final TextEditingController controller = TextEditingController();
  late FocusNode inputFieldNode;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      // ignore: deprecated_member_use
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (KeyEvent key) {
          if (controller.text.isEmpty &&
              // ignore: deprecated_member_use
              key is KeyDownEvent &&
              key.logicalKey == LogicalKeyboardKey.backspace) {
            setState(() {
              chips.remove(chips.last);
            });
          }
        },
        child: Center(
          child: InputDecorator(
            decoration: const InputDecoration(
              filled: false,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            child: Wrap(
              spacing: 5,
              runSpacing: -7,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                ...chips.map(
                  (String value) => Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide.none,
                    label: Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onDeleted: () {
                      _removeChip(value);
                    },
                    deleteIcon: const Icon(Icons.cancel),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: controller,
                    focusNode: inputFieldNode,
                    style: Theme.of(context).textTheme.bodySmall,
                    onSubmitted: (String value) {
                      if (value.isNotEmpty) {
                        final String word = value.substring(0, value.length);
                        _addChip(word);
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: 'Tags',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    inputFieldNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    inputFieldNode = FocusNode();
    super.initState();
  }

  void _addChip(String value) {
    setState(() {
      chips.add(value);
    });
    controller.clear();
    FocusScope.of(context).requestFocus(inputFieldNode);
  }

  void _removeChip(String value) {
    setState(() {
      chips.remove(value);
    });
  }
}
