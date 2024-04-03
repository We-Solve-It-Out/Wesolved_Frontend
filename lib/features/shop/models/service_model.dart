class ServiceModel {
  final int servicioId;
  final String descripcion;
  final double precio;
  final String estado;
  final int idCliente;
  final int idProveedor;
  final String urlImagenServicio;
  final String nombreServicio;

  ServiceModel({
    required this.servicioId,
    required this.descripcion,
    required this.precio,
    required this.estado,
    required this.idCliente,
    required this.idProveedor,
    required this.urlImagenServicio,
    required this.nombreServicio,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      servicioId: json['servicio_id'],
      descripcion: json['descripcion'],
      precio: double.parse(json['precio']),
      estado: json['estado'],
      idCliente: json['id_cliente'],
      idProveedor: json['id_proveedor'],
      urlImagenServicio: json['url_imagen_servicio'],
      nombreServicio: json['Nombre_Servicio'],
    );
  }
}
