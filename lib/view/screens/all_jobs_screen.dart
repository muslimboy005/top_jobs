import 'package:flutter/material.dart';
import 'package:top_jobs/controller/all_job_controller/all_jobs_controller.dart';
import 'package:top_jobs/model/admins/job_model.dart';

class AllJobsScreen extends StatefulWidget {
  const AllJobsScreen({super.key});

  @override
  State<AllJobsScreen> createState() =>
      _AllJobsScreenState();
}

class _AllJobsScreenState extends State<AllJobsScreen> {
  AllJobsController allJobsController = AllJobsController();
  List<JobModel> jobs = [];
  
  @override
  void initState() {
    super.initState();
    allJobsController.getData().then((value){
      jobs = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [

        ],
      ));
  }
}
