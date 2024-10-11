import 'package:flutter/material.dart';

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: const Center(
        child: Text('Historial de acceso del usuario'),
      ),
    );
  }
}