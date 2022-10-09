import 'package:flutter/material.dart';

import '../models/offices.dart';
import '../utiles/responses.dart';


class OfficesPage extends StatefulWidget {
  const OfficesPage({super.key, required this.title});

  final String title;

  @override
  State<OfficesPage> createState() => _OfficesPageState();
}

class _OfficesPageState extends State<OfficesPage> {
  late Future<Offices> offices;

  @override
  void initState() {
    super.initState();

    offices = _getOffices();
  }

  Future<Offices> _getOffices() async {
    var json = await getJsonFromUrl('https://about.google/static/data/locations.json');

    Offices offices = Offices.fromJson(json["offices"]);

    return offices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true
      ),
      body: FutureBuilder<Offices>(
        future: offices,
        builder: ((context, snapshot) {
          Offices offices = snapshot.data as Offices;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: offices.list.length,
              itemBuilder: (BuildContext context, int index) {
                Office office = offices.list[index];
                return Card(
                  child: ListTile(
                    title: Text(office.name),
                    subtitle: Text(office.address),
                    leading: Image.network(office.image),
                    isThreeLine: true,
                  ),
                );
              },
            );
          } 
          else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),

    );
  }
}