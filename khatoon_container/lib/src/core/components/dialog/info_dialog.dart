import 'package:flutter/material.dart';

class DialogFb1 extends StatelessWidget {
  const DialogFb1({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    // final Color accentColor = Theme.of(context).colorScheme.onPrimary;

    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: 300,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: const Offset(12, 26),
                            blurRadius: 50,
                            color: Colors.grey.withAlpha(100)),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 25,
                        child: const Text('test')
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("How are you doing?",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 3.5,
                      ),
                      Text("This is a sub text, use it to clarify",
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SimpleBtn1(text: "Great", onPressed: () {}),
                          SimpleBtn1(
                            text: "Not bad",
                            onPressed: () {},
                            invertedColors: true,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: const Text('Info Dialog'),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleBtn1(
      {required this.text,
        required this.onPressed,
        this.invertedColors = false,
        super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color accentColor = Theme.of(context).colorScheme.onPrimary;

    return ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            alignment: Alignment.center,
            side: WidgetStateProperty.all(
                BorderSide(color: primaryColor)),
            padding: WidgetStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25)),
            backgroundColor: WidgetStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
