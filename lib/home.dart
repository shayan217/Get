import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller.dart';
import 'package:test/model.dart'; 

class Home extends StatelessWidget {
  MaineController maineController = Get.put(MaineController());
   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boards'),
      ),
      body: FutureBuilder<List<FetchModel>>(
        future: maineController.fetchData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Fetching data, please wait..."));
          }
          
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              FetchModel fetchModel = snapshot.data![index];
              return Card(
                child: Text(fetchModel.name ?? "Unknown city"),
              );
            },
          );
        },
      ),
    );
  }
}
