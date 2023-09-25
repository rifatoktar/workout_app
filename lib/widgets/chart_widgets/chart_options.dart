import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import 'toggle_item.dart';

class ChartOptionsWidget extends StatefulWidget {
  const ChartOptionsWidget({
    required this.onRefresh,
    required this.toggleItems,
    required this.onAddItems,
    required this.onRemoveItems,
    Key? key,
  }) : super(key: key);

  final VoidCallback onRefresh;
  final VoidCallback onAddItems;
  final VoidCallback onRemoveItems;
  final List<Widget> toggleItems;

  @override
  _ChartOptionsWidgetState createState() => _ChartOptionsWidgetState();
}

class _ChartOptionsWidgetState extends State<ChartOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Text(
                  'Chart Settings',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/icons/arrow-down.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).cardColor, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 16,)
          ],
        ),
        Row(
          children: [
            Flexible(
              child: ListTile(
                trailing: Icon(
                  Icons.add,
                  color: Theme.of(context).cardColor,
                ),
                title: Text(
                  'Add data',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                onTap: widget.onAddItems,
              ),
            ),
            Flexible(
              child: ListTile(
                trailing: Icon(
                  Icons.remove,
                  color: Theme.of(context).cardColor,
                ),
                title: Text(
                  'Remove data',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                onTap: widget.onRemoveItems,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: ToggleItem(
                value: timeDilation == 10,
                title: 'Slow animations',
                onChanged: (value) {
                  setState(() {
                    timeDilation = timeDilation == 10 ? 1 : 10;
                  });
                },
              ),
            ),
            Flexible(
              child: ListTile(
                enabled: widget.onRefresh == true,
                trailing: Icon(
                  Icons.refresh,
                  color: Theme.of(context).cardColor,
                ),
                title: Text(
                  'Refresh dataset',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                onTap: widget.onRefresh,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView(
            padding: EdgeInsets.zero,
            children: widget.toggleItems,
          ),
        ),
      ],
    );
  }
}
