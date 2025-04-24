import 'package:flutter/material.dart';
import 'package:top_jobs/controller/admin_controller/admin_profile_controller.dart';
import 'package:top_jobs/controller/admin_controller/admin_job_controller.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';
import 'package:top_jobs/model/admins/job_model.dart';
import 'package:top_jobs/view/screens/adminScreen/admin_profile_screen2.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final adminProfile = AdminProfileController(contact: "admin1");
  final adminJobController = AdminJobController(contact: "admin1");
  late AboutCompanyModel? aboutCompanyModel;
  bool isLoading = true;

  List<JobModel> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future<void> getProfileData() async {
    aboutCompanyModel = await adminProfile.getProfileData();
    filteredJobs = await adminJobController.getJobs();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> addNewJob(JobModel job) async {
    await adminJobController.addJob(jobModel: job);    await getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 93, 71, 71),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromARGB(255, 93, 71, 71),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Image.network(
                    aboutCompanyModel!.companyImage,
                    height: 270,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      aboutCompanyModel!.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '● ${aboutCompanyModel?.name}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '● ${aboutCompanyModel?.location}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: const Text("Edit")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Company',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("● Company Name: ${aboutCompanyModel?.name}"),
                        Text("● Company Location: ${aboutCompanyModel?.location}"),
                        Text("● Company Bio: ${aboutCompanyModel?.companyBio}"),
                        Text("● Number of employees: ${aboutCompanyModel?.employees}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Jobs",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController imageController = TextEditingController();
                                TextEditingController infoController = TextEditingController();
                                TextEditingController nameController = TextEditingController();
                                TextEditingController titleController = TextEditingController();
                                TextEditingController salaryController = TextEditingController();
                                TextEditingController locationController = TextEditingController();

                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    String? errorText;

                                    void validateAndSave() async {
                                      if (imageController.text.isEmpty ||
                                          infoController.text.isEmpty ||
                                          nameController.text.isEmpty ||
                                          titleController.text.isEmpty ||
                                          salaryController.text.isEmpty ||
                                          locationController.text.isEmpty) {
                                        setState(() {
                                          errorText = "Iltimos, barcha maydonlarni to'ldiring!";
                                        });
                                      } else {
                                        JobModel newJob = JobModel(
                                          companyImage: imageController.text,
                                          jobInfo: infoController.text,
                                          jobName: nameController.text,
                                          jobTile: titleController.text,
                                          salary: salaryController.text,
                                          shortLocation: locationController.text,
                                          time: DateTime.now(),
                                          comment: {},
                                        );
                                        await addNewJob(newJob);
                                        Navigator.of(context).pop();
                                      }
                                    }

                                    return AlertDialog(
                                      title: const Text('New Info'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: imageController,
                                              decoration: const InputDecoration(labelText: 'Company Image:'),
                                            ),
                                            TextField(
                                              controller: infoController,
                                              decoration: const InputDecoration(labelText: 'Job Info:'),
                                            ),
                                            TextField(
                                              controller: nameController,
                                              decoration: const InputDecoration(labelText: 'Job Name:'),
                                            ),
                                            TextField(
                                              controller: titleController,
                                              decoration: const InputDecoration(labelText: 'Job Title:'),
                                            ),
                                            TextField(
                                              controller: salaryController,
                                              decoration: const InputDecoration(labelText: 'Salary:'),
                                            ),
                                            TextField(
                                              controller: locationController,
                                              decoration: const InputDecoration(labelText: 'Location:'),
                                            ),
                                            if (errorText != null) ...[
                                              const SizedBox(height: 10),
                                              Text(errorText!, style: const TextStyle(color: Colors.red)),
                                            ],
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: validateAndSave,
                                          child: const Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.add, color: Colors.black, size: 30),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    itemCount: filteredJobs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final job = filteredJobs[index];
                      return DesignerInfo(
                        date: "${DateTime.now().difference(job.time).inDays != 0 ? DateTime.now().difference(job.time).inDays : DateTime.now().difference(job.time).inHours} ${DateTime.now().difference(job.time).inDays != 0 ? "days ago" : "hours ago"}",
                        image: job.companyImage,
                        money: job.salary,
                        subTitle: job.shortLocation,
                        title1: job.jobTile,
                        title2: job.comment["text"] ?? "",
                        title: job.jobName,
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
