import 'package:flutter/material.dart';
import '../models/tesis.dart';
import 'detalle_tesis.dart';
import '../data/tesis_data.dart';  // Lista global

class ListaTesisScreen extends StatefulWidget {
  final String role;  // 'docente' o 'estudiante'
  final String username;  // Nombre del docente o estudiante

  ListaTesisScreen({required this.role, required this.username});

  @override
  _ListaTesisScreenState createState() => _ListaTesisScreenState();
}

class _ListaTesisScreenState extends State<ListaTesisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tesis'),
      ),
      body: ListView.builder(
        itemCount: listaDeTesis.length,
        itemBuilder: (context, index) {
          Tesis tesis = listaDeTesis[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tesis.titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(tesis.descripcion, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  SizedBox(height: 12),
                  Text('Autor: ${tesis.autor}'),  // Mostrar el autor
                  if (tesis.evaluador != null)
                    Text('Evaluador: ${tesis.evaluador}'),  // Mostrar el evaluador si existe
                  if (tesis.estado == 'aprobada')
                    Text('Aprobada por Docente: ${tesis.evaluador}'),  // Mostrar aprobación por el docente
                  if (tesis.estado == 'rechazada' && tesis.comentario != null)
                    Text('Comentario: ${tesis.comentario}'),  // Mostrar comentario si la tesis fue rechazada
                  SizedBox(height: 10),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleTesisScreen(
                            tesis: tesis,
                            role: widget.role,
                            evaluador: widget.role == 'docente' ? widget.username : (tesis.evaluador ?? ''),
                          ),
                        ),
                      ).then((_) {
                        setState(() {});  // Refrescar pantalla después de volver de DetalleTesisScreen
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
