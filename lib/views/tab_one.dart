import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/auctions_card_widget.dart';
import 'package:sizer/sizer.dart';

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard',
                style: TextStyle(fontSize: 10.sp),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Click On ElevatedButton')));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'ElevatedButton',
                      style: TextStyle(fontSize: 12.sp),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Click On ElevatedButton')));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'TextButton',
                      style: TextStyle(fontSize: 12.sp),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CheckboxListTile(
                value: true,
                onChanged: null,
                title: Text(
                  'This is checkbox!',
                  style: TextStyle(fontSize: 10.sp),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                dense: false,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero),
          ),
          const AuctionsCardWidget(),
        ],
      ),
    );
  }
}
