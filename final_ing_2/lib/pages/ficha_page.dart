import 'dart:convert';
import 'dart:developer';

import 'package:final_ing_2/models/vehiculo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FichaPage extends StatefulWidget {
  const FichaPage({Key? key}) : super(key: key);

  @override
  _FichaPageState createState() => _FichaPageState();
}

class _FichaPageState extends State<FichaPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: body(context, Vehiculo.fromJson(args)),
      floatingActionButton: botonFlotante(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  FloatingActionButton botonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(
        FontAwesomeIcons.arrowLeft,
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget body(BuildContext context, Vehiculo vehiculo) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          header(context, vehiculo),
          ficha(context, vehiculo),
        ],
      ),
    );
  }

  Widget header(BuildContext context, Vehiculo vehiculo) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          headerBackground(vehiculo),
          headerGradient(),
          headerTitle(vehiculo),
        ],
      ),
    );
  }

  Widget ficha(BuildContext context, Vehiculo vehiculo) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: ListTile(
              title: Text(vehiculo.marca),
              subtitle: Text('Marca'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.referencia),
                        subtitle: Text('Referencia'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.modelo),
                        subtitle: Text('Modelo'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.kilometraje),
                        subtitle: Text('Kilometraje'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.cilindraje),
                        subtitle: Text('Cilindraje'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.tipo),
                        subtitle: Text('Tipo'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text(vehiculo.asientos),
                        subtitle: Text('Asientos'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerBackground(Vehiculo vehiculo) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 0.1),
      child: Image(
        image: AssetImage('assets/mustang.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget headerGradient() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget headerTitle(Vehiculo vehiculo) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 50,
      child: Row(
        children: [
          Text(
            '${vehiculo.marca} ${vehiculo.referencia}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          FaIcon(
            FontAwesomeIcons.solidStar,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '${vehiculo.calificacion}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
