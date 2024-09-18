class Tesis {
  String titulo;
  String descripcion;
  String archivo;
  String estado;  // 'pendiente', 'aprobada', 'rechazada'
  String autor;   // Nombre del estudiante que subió la tesis
  String? evaluador;  // Nombre del docente que calificó la tesis (opcional)
  String? comentario;  // Comentario del docente si es rechazada

  Tesis({
    required this.titulo,
    required this.descripcion,
    required this.archivo,
    this.estado = 'pendiente',
    required this.autor,
    this.evaluador,
    this.comentario,
  });
}
