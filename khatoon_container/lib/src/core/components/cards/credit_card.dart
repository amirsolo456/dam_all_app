import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphismCreditCard extends StatefulWidget {
  const GlassmorphismCreditCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GlassmorphismCreditCardState createState() =>
      _GlassmorphismCreditCardState();
}

class _GlassmorphismCreditCardState extends State<GlassmorphismCreditCard> {
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return GlassmorphicContainer(
      height: _height * 0.3,
      width: _width * 0.9,
      borderRadius: 15,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(colors: <Color>[
        Colors.white.withAlpha(200),
        Colors.white38.withAlpha(200)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      borderGradient: LinearGradient(colors: <Color>[
        Colors.white24.withAlpha(200),
        Colors.white70.withAlpha(200)
      ]),
      child: Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 16,
            color: Colors.black.withAlpha(100),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: Container(
                height: _height * 0.7,
                width: _width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(200),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withAlpha(200),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('ICICI BANK',
                              style: TextStyle(
                                  color: Colors.white.withAlpha(750))),
                          Icon(
                            Icons.credit_card_sharp,
                            color: Colors.white.withAlpha(750),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('VISA',
                              style: TextStyle(
                                  color: Colors.white.withAlpha(750))),
                          Text('09/27',
                              style: TextStyle(
                                  color: Colors.white.withAlpha(750))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('3648 3847 9283 1482',
                              style: TextStyle(
                                  color: Colors.white.withAlpha(750))),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
