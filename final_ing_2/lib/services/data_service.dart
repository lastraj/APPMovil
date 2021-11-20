import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:final_ing_2/models/vehiculo.dart';

class DataService {
  Vehiculo v1 = new Vehiculo(
      marca: 'Mercedes Benz',
      modelo: '2021',
      referencia: 'AMG GTR',
      kilometraje: '1200',
      calificacion: '4.9',
      tipo: 'Superdeportivo',
      asientos: '2',
      cilindraje: '3850',
      imagen: '');
  Vehiculo v2 = new Vehiculo(
      marca: 'Nissan',
      modelo: '2020',
      referencia: 'GTR',
      kilometraje: '5000',
      calificacion: '3.8',
      tipo: 'Deportivo',
      asientos: '4',
      cilindraje: '2800',
      imagen: '');
  Vehiculo v3 = new Vehiculo(
      marca: 'Ford',
      modelo: '2021',
      referencia: 'Mustang GT',
      kilometraje: '3800',
      calificacion: '4.3',
      tipo: 'Musclecar',
      asientos: '4',
      cilindraje: '5000',
      imagen: '');

  void dummyTest() async {
    var resp = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );
    log(resp.body);
  }

  Future<List<Vehiculo>> getAllVehiculos() async {
    await Future.delayed(Duration(seconds: 3));
    return [v1, v2, v3];
  }

  Future<Vehiculo> getVehiculo(String id) async {
    await Future.delayed(Duration(seconds: 3));
    return v1;
  }
}
