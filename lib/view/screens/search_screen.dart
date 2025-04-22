import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/model/admins/job_model.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/widget/containers_widget.dart';
import 'package:top_jobs/view/widget/designer_info.dart';

class SearchScreen extends StatefulWidget {
  
   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<JobModel> jobs = [];
  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375 * w,
            height: 220 * h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff0D0140),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Color(0xffAAA6B9)),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Location",

                        prefixIcon: Icon(
                          Icons.location_on_sharp,
                          color: Color(0xffFF9228),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 15,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff130160),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset(AppImages.icon_filter)],
                      ),
                    ),
                  ),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  spacing: 15,
                  children: [
                    DesignerInfo(
                      date: "25 minute ago",
                      icon: AppImages.google_1,
                      money: "15K/Mo",
                      subTitle: "Google inc California, USA",
                      title1: "Design",
                      title2: "Full time",
                      title3: "Senior designer",
                      title: "UI/UX Designer",
                    ),
                    DesignerInfo(
                      date: "25 minute ago",
                      icon: AppImages.google_1,
                      money: "15K/Mo",
                      subTitle: "Google inc California, USA",
                      title1: "Design",
                      title2: "Full time",
                      title3: "Senior designer",
                      title: "UI/UX Designer",
                    ),
                    DesignerInfo(
                      date: "25 minute ago",
                      icon: AppImages.google_1,
                      money: "15K/Mo",
                      subTitle: "Google inc California, USA",
                      title1: "Design",
                      title2: "Full time",
                      title3: "Senior designer",
                      title: "UI/UX Designer",
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
