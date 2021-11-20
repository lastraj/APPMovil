import 'dart:developer';

import 'package:final_ing_2/models/vehiculo.dart';
import 'package:final_ing_2/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListadoPage extends StatefulWidget {
  const ListadoPage({Key? key}) : super(key: key);

  @override
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataService.dummyTest();
        },
        child: FaIcon(
          FontAwesomeIcons.ad,
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text('CAR SHOW ROOM'),
      centerTitle: true,
    );
  }

  Widget body(BuildContext context) {
    return Container(
      child: vehiculosList(context),
    );
  }

  Widget vehiculosList(BuildContext context) {
    return FutureBuilder(
      future: dataService.getAllVehiculos(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Vehiculo> data = snapshot.data;

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return vehiculoTile(data[index]);
            },
          );
        }
      },
    );
  }

  ListTile vehiculoTile(Vehiculo vehiculo) {
    return ListTile(
      leading: FaIcon(FontAwesomeIcons.car),
      title: Text(vehiculo.referencia),
      subtitle: Text(vehiculo.marca),
      trailing: Text(vehiculo.modelo),
      onTap: () {
        Navigator.pushNamed(
          context,
          'ficha',
          arguments: {
            "marca": vehiculo.marca,
            "modelo": vehiculo.modelo,
            "referencia": vehiculo.referencia,
            "kilometraje": vehiculo.kilometraje,
            "calificacion": vehiculo.calificacion,
            "tipo": vehiculo.tipo,
            "asientos": vehiculo.asientos,
            "cilindraje": vehiculo.cilindraje,
            "imagen": vehiculo.imagen
          },
        );
      },
    );
  }
}
