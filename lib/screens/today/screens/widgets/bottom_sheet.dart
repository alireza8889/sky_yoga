import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

double _currentValue = 90;

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            startAngle: 180,
            endAngle: 0,
            showTicks: false,
            showLabels: false,
            axisLineStyle: AxisLineStyle(
              thickness: 20,
              color: Colors.grey[300],
              cornerStyle: CornerStyle.bothCurve,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: _currentValue,
                width: 20,
                color: Colors.blue,
                enableAnimation: false,
                enableDragging: true,
                onValueChanged: (double value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: SizedBox(
                  child: Text(
                    'Easy',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                angle: 180,
                positionFactor: 1.3,
              ),
              GaugeAnnotation(
                widget: Container(
                  child: Text(
                    'Hard',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                angle: 0,
                positionFactor: 1.3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
