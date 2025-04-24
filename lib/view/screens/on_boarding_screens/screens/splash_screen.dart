import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/admin_profile/mian_screen.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';
import 'package:top_jobs/view/screens/user_profile/user_main_page.dart';

class SplashScreen extends StatefulWidget {
  final SignModel? signModel;
  final List<String> users;
  final List<String> admins;
  const SplashScreen({
    super.key,
    this.signModel,
    required this.admins,
    required this.users,
  });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "TopJops",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 115 * h,
            ),
            child: Image.asset(AppImages.grouph75),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30,
              top: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.job),
                SizedBox(height: 15),
                SvgPicture.asset(AppImages.exploreAll),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    Text(""),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        color: Color(0xff130160),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return widget
                                                .signModel ==
                                            null
                                        ? LoginScreen()
                                        : widget.admins
                                            .contains(
                                              widget
                                                  .signModel!
                                                  .id,
                                            )
                                        ? MainScreen()
                                        : UserMainPage();
                                  },
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              AppImages.vector6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
