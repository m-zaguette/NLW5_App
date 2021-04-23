import 'package:flutter/material.dart';
import 'package:nlw5_app/core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({Key? key, required this.percent}) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.15,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Stack(
            children: [
              Center(
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.5,
                  child: CircularProgressIndicator(
                    strokeWidth: screenWidth * 0.025,
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
