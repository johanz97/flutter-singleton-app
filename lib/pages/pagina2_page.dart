import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioController,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.nombre)
                : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text(
                  'Establecer usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final user = Usuario(nombre: 'Johan', edad: 24);
                  usuarioService.cargarUsuario(user);
                }),
            MaterialButton(
                child: const Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: usuarioService.existeUsuario
                    ? () => usuarioService.cambiarEdad(20)
                    : null)
          ],
        ),
      ),
    );
  }
}
