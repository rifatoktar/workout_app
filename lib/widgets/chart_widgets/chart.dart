import 'dart:math';

import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class LineChartScreen extends StatefulWidget {
  const LineChartScreen({Key? key}) : super(key: key);

  @override
  _LineChartScreenState createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  Map<int, List<BubbleValue>> _values = <int, List<BubbleValue>>{};
  double targetMax = 0;
  bool _smoothPoints = false;
  bool _fillLine = false;
  bool _showLine = true;
  bool _stack = true;
  int minItems = 15;

  @override
  void initState() {
    super.initState();
    _updateValues();
  }

  void _updateValues() {
    final Random _rand = Random();
    final double _difference = 2 + (_rand.nextDouble() * 15);

    targetMax =
        3 + (_rand.nextDouble() * _difference * 0.75) - (_difference * 0.25);
    _values.addAll(List.generate(3, (index) {
      List<BubbleValue<void>> _items = [];
      for (int i = 0; i < minItems; i++) {
        _items.add(BubbleValue<void>(2 + _rand.nextDouble() * _difference));
      }
      return _items;
    }).asMap());
  }

  void _addValues() {
    _values.addAll(List.generate(3, (index) {
      List<BubbleValue<void>> _items = [];
      for (int i = 0; i < minItems; i++) {
        _items.add(BubbleValue<void>(2 + Random().nextDouble() * targetMax));
      }
      return _items;
    }).asMap());
  }

  List<List<BubbleValue<void>>> _getMap() {
    return [
      _values[0]!.toList(),
      _values[1]!
          .asMap()
          .map<int, BubbleValue<void>>((index, e) {
            return MapEntry(index, e);
          })
          .values
          .toList(),
      _values[2]!
          .asMap()
          .map<int, BubbleValue<void>>((index, e) {
            return MapEntry(index, e);
          })
          .values
          .toList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Stack(
                children: [
                  LineChart<void>.multiple(
                    _getMap(),
                    stack: _stack,
                    height: MediaQuery.of(context).size.height * 0.4,
                    lineWidth: 2.0,
                    chartItemOptions: BubbleItemOptions(
                      maxBarWidth: _showLine ? 0.0 : 6.0,
                    ),
                    smoothCurves: _smoothPoints,
                    backgroundDecorations: [
                      SparkLineDecoration(
                        id: 'first_line_fill',
                        smoothPoints: _smoothPoints,
                        fill: true,
                        lineColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(_fillLine
                                ? _stack
                                    ? 1.0
                                    : 0.2
                                : 0.0),
                        listIndex: 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
