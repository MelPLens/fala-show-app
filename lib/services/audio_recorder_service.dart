import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AudioRecorderService {
  static final _recorder = AudioRecorder(); // ✅ USAR AudioRecorder() na v5

  static Future<String?> gravar() async {
    final hasPermission = await _recorder.hasPermission(); // ✅ continua válido
    if (!hasPermission) return null;

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        numChannels: 1,
      ),
      path: path,
    );

    return path;
  }

  static Future<String?> parar() async {
    return await _recorder.stop();
  }
}
