import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_history_controller.dart';
import 'package:top_jobs/datasource/local_datasource/userLocal.dart';
import 'package:top_jobs/model/users/history_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late UserHistoryController _controller;
  List<HistoryModel> _historyList = [];
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    Userlocal().getData().then((value){
      _controller = UserHistoryController(contact: value!.id);
      loadHistory();
    });
    
    
  }

  Future<void> loadHistory() async {
    try {
      final data = await _controller.getExperienceData();
      setState(() {
        _historyList = data;
        _isLoading = false;
      });
    } catch (e) {
      print("Xatolik: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Color getColorForProgress(String process) {
    if (process == "qabul qilindi") {
      return Colors.green;
    } else if (process == "jarayonda") {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:
        
              (_isLoading
                  ? Center(child: CircularProgressIndicator())
                  : (_historyList.isEmpty
                      ? Center(child: Text("Ma'lumotlar topilmadi."))
                      : ListView.builder(
                        itemCount: _historyList.length,
                        itemBuilder: (context, index) {
                          final item = _historyList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  item.companyImage,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Company: ${item.companyName}"),
                                          Spacer(),
                                          Text(
                                            item.process,
                                            style: TextStyle(
                                              color: getColorForProgress(
                                                item.process,
                                              ),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Date: ${item.date.toLocal().toString().split(' ')[0]}",
                                      ),
                                      Text("Job name: ${item.jobName}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ))),
           

    );
  }
}
