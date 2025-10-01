import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/creditReportcubit/credit_report_cubit.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CreditreportPage extends StatefulWidget {
  const CreditreportPage({super.key});

  @override
  State<CreditreportPage> createState() => _CreditreportPageState();
}

class _CreditreportPageState extends State<CreditreportPage> {
  @override
  void initState() {
    super.initState();
    context.read<CreditReportCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreditReportCubit, CreditReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CreditReportLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CreditReportLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ListItem(),
                  SizedBox(height: 20),
                  ProgressBarButton(),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.creditReportData.data.scoreFactors.length,
                    itemBuilder: (context, index) {
                      return CreditKeyFactorWidget(
                        keydata: CreditReportKeyFactorModel(
                          title: state
                              .creditReportData.data.scoreFactors[index].title,
                          impactBgColor: state.creditReportData.data
                              .scoreFactors[index].impactBgColor,
                          impactLabel: state.creditReportData.data
                              .scoreFactors[index].impactLabel,
                          description: state.creditReportData.data
                              .scoreFactors[index].description,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class CreditKeyFactorWidget extends StatelessWidget {
  const CreditKeyFactorWidget({super.key, required this.keydata});

  final CreditReportKeyFactorModel keydata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 226, 225, 225),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
          border: Border.all(
            style: BorderStyle.solid,
            color: const Color.fromARGB(255, 230, 229, 229),
          ),
        ),
        child: TextButton(
          onPressed: null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    keydata.title,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(int.parse(keydata.impactBgColor)),
                    ),
                    child: Center(
                      child: Text(
                        keydata.impactLabel,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                keydata.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 131, 130, 130),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditReportKeyFactorModel {
  CreditReportKeyFactorModel({
    required this.title,
    required this.impactBgColor,
    required this.impactLabel,
    required this.description,
  });

  final String title;
  final String impactLabel;
  final String impactBgColor;
  final String description;
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 230, 229, 229),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
            border: Border.all(
              style: BorderStyle.solid,
              color: const Color.fromARGB(255, 197, 197, 197),
            ),
          ),
          child: TextButton(
            onPressed: null,
            child: Text(
              "TransUnion",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 92, 91, 91),
              ),
            ),
          ),
        ),
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 239),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: null,
            child: Text(
              "Equifax",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 108, 108, 108),
              ),
            ),
          ),
        ),
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 239),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: null,
            child: Text(
              "Experian",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 108, 108, 108),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProgressBarButton extends StatefulWidget {
  const ProgressBarButton({
    super.key,
  });

  @override
  State<ProgressBarButton> createState() => _ProgressBarButtonState();
}

class _ProgressBarButtonState extends State<ProgressBarButton>
    with TickerProviderStateMixin {
  late AnimationController arcController;
  late AnimationController valueController;
  late Animation arcAnimation;
  late Animation valueAnimation;

  @override
  void initState() {
    super.initState();
    arcController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    arcAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(arcController)
      ..addListener(() {
        setState(() {});
      });

    valueController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    valueAnimation = Tween<double>(begin: 0, end: 803).animate(valueController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    arcController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('visible--key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 0) {
          arcController.forward();
          valueController.forward();
        }
      },
      child: Column(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width * 0.95,
              MediaQuery.of(context).size.height * 0.20,
            ),
            painter: MyPainter(
              arcAnimation: arcAnimation,
              valueAnimation: valueAnimation,
            ),
          ),
          SizedBox(height: 24),
          TextButton(
            onPressed: null,
            child: Container(
              width: 270,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Update Your Credit Score",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Animation arcAnimation;
  final Animation valueAnimation;

  MyPainter({required this.arcAnimation, required this.valueAnimation});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 3.5;
    final center = Offset(size.width / 2, size.height);

    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      startAngle: pi,
      endAngle: 2 * pi,
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.greenAccent,
        const Color.fromARGB(255, 4, 143, 9),
      ],
    );

    var paint = Paint();
    paint.shader = gradient.createShader(rect);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    canvas.drawArc(rect, pi, pi * arcAnimation.value, false, paint);

    final labels = [300, 450, 600, 750, 900];

    for (int i = 0; i < labels.length; i++) {
      double angle = pi + (i / (labels.length - 1)) * pi;
      final x = center.dx + (radius + 20) * cos(angle);
      final y = center.dy + (radius + 10) * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '${labels[i]}',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height),
      );
    }

    final result = TextPainter(
      text: TextSpan(
        text: valueAnimation.value.toInt().toString(),
        style: TextStyle(
          color: Colors.green,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.rtl,
    );
    result.layout();
    result.paint(
      canvas,
      Offset(center.dx - result.width / 2, center.dy - radius + 40),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
