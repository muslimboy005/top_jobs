import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/widget/containers_widget.dart';

class DesignerInfo extends StatefulWidget {
  final icon;
  final String title;
  final String subTitle;
  final String title1;
  final String title2;
  final String title3;
  final String date;
  final String money;

  DesignerInfo({
    super.key,
    required this.date,
    required this.icon,
    required this.money,
    required this.subTitle,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title,
  });

  @override
  State<DesignerInfo> createState() => _DesignerInfoState();
}

class _DesignerInfoState extends State<DesignerInfo> {
  
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Container(
      width: 335 * w,
      height: 250 * h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black.withOpacity(0.1),
                  child: Center(child: SvgPicture.asset(widget.icon)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_border, size: 30),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(widget.subTitle, style: TextStyle(fontSize: 16)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainersWidget(title: "  ${widget.title1}  "),
                  ContainersWidget(title: widget.title2),
                  ContainersWidget(title: widget.title3),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(widget.date), Text(widget.money)],
            ),
          ],
        ),
      ),
    );
  }
}
