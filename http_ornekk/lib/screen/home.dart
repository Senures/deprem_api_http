import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_ornekk/screen/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:http_ornekk/models/models.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController homeController) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Gerçekleşen Depremler"),
              centerTitle: true,
              toolbarHeight: 65.0,
              backgroundColor: const Color(0xffffc107),
            ),
            body: homeController.isLoading ==false//verilerin yüklenmesi bitmemişse
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: homeController.verilerim.length,
                    itemBuilder: (context, index) {
                      Result item = homeController.verilerim[index];

                      return Card(
                          margin: const EdgeInsets.all(8.0),
                          shadowColor: Colors.grey,
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: const Color(0xffffc107),
                                foregroundColor: Colors.black,
                                child: Text(item.mag.toString())),
                            title: Text(
                              item.title,
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(item.date),
                            tileColor: index % 2 == 0
                                ? const Color(0xffffe082)
                                : const Color(0xfffff9c4),
                            trailing: InkWell(
                              onTap: () async {
                                var mapLink =
                                    'https://maps.google.com/maps?q=${item.lat.toString()},${item.lng}';
                                await launch(mapLink);
                              },
                              child: const Icon(
                                Icons.place,
                                color: Colors.black,
                              ),
                            ),
                          ));
                    },
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xffffc107),
              onPressed: () {
                homeController.setIsLoading(true);
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
          );
        });
  }
}
