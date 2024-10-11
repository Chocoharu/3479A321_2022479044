import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: appData.actions.isNotEmpty
          ? ListView.builder(
              itemCount: appData.actions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(appData.actions[index]),
                );
              },
            )
          : const Center(
              child: Text('No hay acciones registradas'),
            ),
    );
  }
}
