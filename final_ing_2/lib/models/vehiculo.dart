import 'dart:convert';

Vehiculo vehiculoFromJson(String str) => Vehiculo.fromJson(json.decode(str));

String vehiculoToJson(Vehiculo data) => json.encode(data.toJson());

class Vehiculo {
    Vehiculo({
        required this.marca,
        required this.modelo,
        required this.referencia,
        required this.kilometraje,
        required this.calificacion,
        required this.tipo,
        required this.asientos,
        required this.cilindraje,
        required this.imagen,
    });

    String marca;
    String modelo;
    String referencia;
    String kilometraje;
    String calificacion;
    String tipo;
    String asientos;
    String cilindraje;
    String imagen;

    factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        marca: json["marca"],
        modelo: json["modelo"],
        referencia: json["referencia"],
        kilometraje: json["kilometraje"],
        calificacion: json["calificacion"],
        tipo: json["tipo"],
        asientos: json["asientos"],
        cilindraje: json["cilindraje"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "marca": marca,
        "modelo": modelo,
        "referencia": referencia,
        "kilometraje": kilometraje,
        "calificacion": calificacion,
        "tipo": tipo,
        "asientos": asientos,
        "cilindraje": cilindraje,
        "imagen": imagen,
    };
}
