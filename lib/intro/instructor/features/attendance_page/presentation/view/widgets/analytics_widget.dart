import 'package:attendo/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({
    super.key,
  });

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  @override
  void initState() {
    context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        title: const GaugeTitle(text: "sad"),
        axes: [
          RadialAxis(
            labelOffset: 0,
            pointers: const [
              RangePointer(
                value: 40,
                cornerStyle: CornerStyle.bothCurve,
                color: AppTheme.mainBlue,
                width: 10,
              ),
            ],
            axisLineStyle: const AxisLineStyle(thickness: 10),
            showLabels: false,
            showTicks: false,
            startAngle: 90,
            endAngle: 90,
            annotations: const [
              GaugeAnnotation(
                widget: Text(
                  "sda",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
