import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuctionsCardWidget extends StatelessWidget {
  const AuctionsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.width * 0.32;
    return SizedBox(
      height: 150.0,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/auction1.png',
                width: imageSize,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Brunk Auctions',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff757575)),
                        ),
                        Text(
                          'Live',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff04DDFF)),
                        ),
                      ],
                    ),
                    Text(
                      'Premier Auction - Session I - March 24, 2023',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff000000)),
                    ),
                    Text(
                      'Start: Tue, Feb 28, 04:00PM EST',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1E1E1E)),
                    ),
                    Text(
                      'End: Sun, Mar 26, 11:00PM EDT',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1E1E1E)),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'View Catalog (134)',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Click On Register Now')));
                          },
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              alignment: Alignment.center,
                              child: Text(
                                'Register Now',
                                style: TextStyle(fontSize: 12.sp),
                              ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
