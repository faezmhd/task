import 'package:flutter/material.dart';
import 'package:newone/screens/controller/recipe_controller.dart';
import 'package:newone/screens/view/user_view.dart';
import 'package:provider/provider.dart';
import '../model/recipe_model.dart';

class DataViewHome extends StatelessWidget {
  const DataViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        backgroundColor: Colors.blue,
        actions: [IconButton(icon: const Icon(Icons.arrow_circle_right_outlined),onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DataViewUser(),));
        },)],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<ApiController>(context, listen: false).getData(),
          builder: (BuildContext context, AsyncSnapshot<MyUser?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.recipes?.length ?? 0,
                itemBuilder: (context, index) {
                  final recipes = snapshot.data?.recipes;
                  if (recipes != null && index < recipes.length) {
                    final recipe = recipes[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${recipe.name}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Ingredients:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe.ingredients?.map((ingredient) {
                              return Text("- $ingredient");
                            }).toList() ?? [],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Instructions:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe.instructions?.map((instruction) {
                              return Text("- $instruction");
                            }).toList() ?? [],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            } else {
              return const Text("Error loading data");
            }
          },
        ),
      ),
    );
  }
}
