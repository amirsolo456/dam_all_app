import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class PlanCardComponent extends StatefulWidget {
  const PlanCardComponent({super.key});

  @override
  State<PlanCardComponent> createState() => _PlanCardComponentState();
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    final Paint progressPaint = Paint()
      ..shader = const LinearGradient(
          colors: <Color>[Colors.deepPurple, Colors.purple, Colors.purpleAccent])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _PlanCardComponentState extends State<PlanCardComponent>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;
  final Duration fadeInDuration = const Duration(milliseconds: 500);
  final Duration fillDuration = const Duration(seconds: 2);
  double progressDegrees = 0;
  final double goalCompleted = 0.7;
  int count = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: 280,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary
        ]),
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("My Plan", style: Theme.of(context).textTheme.titleLarge),
              Text("For Today", style: Theme.of(context).textTheme.titleLarge),
              Text("5/7 Complete",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          CustomPaint(
            painter: RadialPainter(progressDegrees),
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: progressDegrees > 30 ? 1.0 : 0.0,
                duration: fadeInDuration,
                child: Text("75%",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween<double>(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
  }
}
