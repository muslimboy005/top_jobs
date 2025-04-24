import 'package:flutter/material.dart';

class DesignerInfo extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final String title1;
  final String date;
  final String money;
  final String title2;

  const DesignerInfo({
    super.key,
    required this.date,
    required this.image,
    required this.money,
    required this.subTitle,
    required this.title1,
    required this.title2,
    required this.title,
  });

  @override
  State<DesignerInfo> createState() => _DesignerInfoState();
}

class _DesignerInfoState extends State<DesignerInfo> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heightipython = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.9,
      // height: hight * 0.35,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
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
                  backgroundColor: Colors.black.withOpacity(0.05),
                  child: ClipOval(
                    child: Image.network(
                      widget.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 30,
                    color: isBookmarked ? Colors.blue : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.subTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(widget.title1),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(widget.title2),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.money,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "/Mo",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}