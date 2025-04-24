import 'package:flutter/material.dart';
import 'package:top_jobs/controller/admin_controller/admin_profile_controller.dart';
import 'package:top_jobs/controller/admin_controller/admin_job_controller.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';
import 'package:top_jobs/model/admins/job_model.dart';
import 'package:top_jobs/view/widget/admin_profile_screen2.dart';

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
    setState(() => isLoading = false);
  }

  Future<void> addNewJob(JobModel job) async {
    await adminJobController.addJob(jobModel: job);
    await getProfileData();
  }

  void showAddJobDialog() {
    final _formKey = GlobalKey<FormState>();
    final imageController = TextEditingController();
    final infoController = TextEditingController();
    final nameController = TextEditingController();
    final titleController = TextEditingController();
    final salaryController = TextEditingController();
    final locationController = TextEditingController();

    Widget buildFormField({
      required TextEditingController controller,
      required String label,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Iltimos, $label kiriting';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yangi ish qo‘shish'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildFormField(controller: imageController, label: 'Company Image'),
                buildFormField(controller: infoController, label: 'Job Info'),
                buildFormField(controller: nameController, label: 'Job Name'),
                buildFormField(controller: titleController, label: 'Job Title'),
                buildFormField(controller: salaryController, label: 'Salary'),
                buildFormField(controller: locationController, label: 'Location'),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Bekor qilish'),
          ),
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
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
            },
            child: const Text('Saqlash'),
          ),
        ],
      ),
    );
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
            icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 93, 71, 71)),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Color.fromARGB(255, 93, 71, 71)),
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
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('● ${aboutCompanyModel?.name}', style: const TextStyle(fontSize: 20)),
                        Text('● ${aboutCompanyModel?.location}', style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('About Company', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                        const Text("Jobs", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: showAddJobDialog,
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
                      final duration = DateTime.now().difference(job.time);
                      final timeAgo = duration.inDays > 0
                          ? "${duration.inDays} days ago"
                          : "${duration.inHours} hours ago";
                      return DesignerInfo(
                        date: timeAgo,
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
