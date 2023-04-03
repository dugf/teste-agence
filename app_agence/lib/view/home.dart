import 'dart:convert';
import 'package:app_agence/view/product_details.dart';
import 'package:app_agence/view/widget/alert_dialog_permission_widget.dart';
import 'package:app_agence/view/widget/drawer_widget.dart';
import 'package:app_agence/viewmodel/product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          title: const Text(
            'Produtos',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        drawer: const DrawerWidget(),
        body: FutureBuilder(
            future: readJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<ProductDataModel>;
                return GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: items.isEmpty ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Image(
                                  image: NetworkImage(
                                      items[index].imageURL.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Text(
                                items[index].name.toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        Position position = await _determinePosition();

                        if (!mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              title: items[index].name.toString(),
                              price: items[index].price.toString(),
                              description: items[index].description.toString(),
                              image: items[index].imageURL.toString(),
                              latitude: position.latitude,
                              longitude: position.longitude,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
            }),
      ),
    );
  }

  Future<List<ProductDataModel>> readJsonData() async {
    //time data return
    await Future.delayed(
      const Duration(seconds: 3),
    );
    //read json file
    final jsondata = await rootBundle.loadString('assets/sample.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showDialogPermission();
      return Future.error('Location permission are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  showDialogPermission() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialogPermissionWidget();
      },
    );
  }
}
