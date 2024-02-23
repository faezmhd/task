import 'package:flutter/material.dart';


import 'package:newone/screens/controller/user_controller.dart';
import 'package:newone/screens/model/user_model.dart';
import 'package:provider/provider.dart';


class DataViewUser extends StatelessWidget {
  const DataViewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder(
            future:Provider.of<ApiController2>(context,listen: false).getData(),
            builder: (BuildContext context, AsyncSnapshot<MyUserModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${snapshot.data!.users![index].firstName}"),

                        ],
                      ),
                    );
                  },);
              } else {
                return const Text("Error loading data");
              }
            },),
        )
    );

  }
}