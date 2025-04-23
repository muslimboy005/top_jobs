import 'package:flutter/material.dart';
import 'package:top_jobs/datasource/local_datasource/userLocal.dart';
import 'package:top_jobs/view/widget/education_dioganal_widget.dart';
import 'package:top_jobs/view/widget/experience_dialog_widget.dart';
import 'package:top_jobs/view/widget/language_dialog_widget.dart';
import 'package:top_jobs/view/widget/profile_dialog_widget.dart';
import 'package:top_jobs/view/widget/skill_dialog_widget.dart';

class FilUserProfileScreen extends StatefulWidget {
  const FilUserProfileScreen({super.key});

  @override
  State<FilUserProfileScreen> createState() =>
      _FilUserProfileScreenState();
}

class _FilUserProfileScreenState
    extends State<FilUserProfileScreen> {
  List<Widget> diologs = [];
  late String id;
  @override
  void initState() {
    Userlocal().getData().then((value) {
      id = value!.id;
      diologs = [
        ProfileDialogWidget(id: id, isFirst: true),
        LanguageDialogWidget(id: id, isFirst: true),
        EducationDioganalWidget(id: id, isFirst: true),
        ExperienceDialogWidget(id: id, isFirst: true),
        SkillDialogWidget(id: id, isFirst: true),
      ];
    });
    super.initState();
  }

  void _showInfoDialog(BuildContext context) async {
    for (int i = 0; i < diologs.length; i++) {
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return diologs[i];
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 50,
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image
                  Image.network(
                    'https://www.shutterstock.com/shutterstock/photos/1049534216/display_1500/stock-vector-congratulations-typography-lettering-handwritten-vector-for-greeting-1049534216.jpg',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  // Text
                  const Text(
                    "🎉 Tabriklaymiz!\n\nRo'yxatdan o'tdingiz. Endi shaxsiy ma'lumotlaringizni to'ldirishingiz kerak.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _showInfoDialog(context),
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 35,
            ),
            label: const Text(
              " Boshlash",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
