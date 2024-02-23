import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController ageController = TextEditingController();


  Future registerApi({required name, required salary, required age})async {
    // Handle Get button press
    var apilink = "https://dummy.restapiexample.com/api/v1/create";
    var url = Uri.parse(apilink);
    var body = {"name":name, "salary":salary, "age":age};
    var resp = await http.post(url,body: body);
    if(resp.statusCode==200){
      print("Success");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    salaryController.dispose();
    ageController.dispose();
     // Dispose the phone controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green,
                Colors.cyanAccent
              ]
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Details'),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: salaryController,
                  decoration: const InputDecoration(
                    labelText: 'Salary',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),
                TextField( // New text field for phone number
                  controller: ageController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Get button press
                      registerApi(name: nameController.text, salary: salaryController.text, age: ageController.text);
                      String name = nameController.text;
                      String salary = salaryController.text;
                      String age = ageController.text; // Get phone number text
                      print('Name: $name, Salary: $salary, Age: $age');
                    },
                    child: const Padding(
                      padding:  EdgeInsets.all(18.0), // Adjust padding as needed
                      child:  Text('Get'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
