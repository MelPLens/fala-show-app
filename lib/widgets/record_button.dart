import 'package:flutter/material.dart';
import '../services/audio_recorder_service.dart';

class RecordButton extends StatefulWidget {
  final Function(String path) onFinished;

  const RecordButton({super.key, required this.onFinished});

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  bool gravando = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(gravando ? Icons.stop : Icons.mic),
      label: Text(gravando ? "Parar gravação" : "Gravar"),
      onPressed: () async {
        if (!gravando) {
          await AudioRecorderService.gravar();
        } else {
          final path = await AudioRecorderService.parar();
          if (path != null) widget.onFinished(path);
        }
        setState(() {
          gravando = !gravando;
        });
      },
    );
  }
}
