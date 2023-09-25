import 'dart:math';

import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chart_widgets/chart_options.dart';
import 'chart_widgets/toggle_item.dart';

class Header extends StatefulWidget {
  final String header;
  final String buttonText;
  const Header({super.key, required this.header, required this.buttonText});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Map<int, List<BubbleValue>> _values = <int, List<BubbleValue>>{};
  double targetMax = 0;
  int minItems = 15;
  bool _showValues = false;
  bool _smoothPoints = false;
  bool _fillLine = false;
  bool _stack = true;
  bool _showLine = true;

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

  @override
  Widget build(BuildContext context) {
    _setting() {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        context: context,
        builder: (context) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Theme.of(context).canvasColor,
            ),
            child: ChartOptionsWidget(
              onRefresh: () {
                setState(() {
                  _values.clear();
                  _updateValues();
                });
              },
              onAddItems: () {
                setState(() {
                  minItems += 4;
                  _addValues();
                });
              },
              onRemoveItems: () {
                setState(() {
                  if (minItems > 6) {
                    minItems -= 4;
                    _values = _values.map((key, value) {
                      return MapEntry(key,
                          value..removeRange(value.length - 4, value.length));
                    });
                  }
                });
              },
              toggleItems: [
                ToggleItem(
                  title: 'Axis values',
                  value: _showValues,
                  onChanged: (value) {
                    setState(() {
                      _showValues = value;
                    });
                  },
                ),
                ToggleItem(
                  value: _smoothPoints,
                  title: 'Smooth line curve',
                  onChanged: (value) {
                    setState(() {
                      _smoothPoints = value;
                    });
                  },
                ),
                ToggleItem(
                  value: _fillLine,
                  title: 'Fill',
                  onChanged: (value) {
                    setState(() {
                      _fillLine = value;
                    });
                  },
                ),
                ToggleItem(
                  title: 'Stack lines',
                  value: _stack,
                  onChanged: (value) {
                    setState(() {
                      _stack = value;
                    });
                  },
                ),
                ToggleItem(
                  title: 'Show lines',
                  value: _showLine,
                  onChanged: (value) {
                    setState(() {
                      _showLine = value;
                    });
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            widget.header,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          TextButton(
              onPressed: () {
                _setting();
              },
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              child: Text(
                widget.buttonText,
                style: GoogleFonts.lexendDeca(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff04ECA6)),
              ))
        ],
      ),
    );
  }
}
