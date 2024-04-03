class QuoteModel {
  final int cotizacionId;
  final int idServicio;
  final String descripcion;
  final double precio;
  final String estado;
  final int proveedorId;
  final double precioContraoferta;

  QuoteModel({
    required this.cotizacionId,
    required this.idServicio,
    required this.descripcion,
    required this.precio,
    required this.estado,
    required this.proveedorId,
    required this.precioContraoferta,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      cotizacionId: json['cotizacion_id'],
      idServicio: json['id_servicio'],
      descripcion: json['descripcion'],
      precio: double.parse(json['precio']),
      estado: json['estado'],
      proveedorId: json['proveedor_id'],
      precioContraoferta: double.parse(json['Precio_Contraoferta']),
    );
  }
}
