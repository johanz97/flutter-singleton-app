import 'dart:async';

import 'package:estadosapp/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioController =
      StreamController.broadcast();

  Usuario? get usuario => _usuario;
  bool get existeUsuario => _usuario != null ? true : false;
  Stream<Usuario> get usuarioController => _usuarioController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    _usuarioController.add(_usuario!);
  }
}

final usuarioService = _UsuarioService();
