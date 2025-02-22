library flutter_profiler;

import 'dart:developer';

class FlutterProfiler {
  static final Map<String, Stopwatch> _stopwatches = {};
  static final List<Map<String, dynamic>> _timeline = [];

  static void start(String key) {
    if (_stopwatches.containsKey(key)) {
      log('Profiler Warning: Task "$key" is already running.');
      return;
    }
    _stopwatches[key] = Stopwatch()..start();
  }

  static void stop(String key) {
    if (!_stopwatches.containsKey(key)) {
      log('Profiler Warning: Task "$key" was not started.');
      return;
    }

    final stopwatch = _stopwatches.remove(key)!;
    stopwatch.stop();
    final duration = stopwatch.elapsedMilliseconds;

    _timeline.add({
      'key': key,
      'duration': duration,
      'timestamp': DateTime.now().toIso8601String(),
    });

    log('Profiler: Task "$key" completed in ${duration}ms');
  }

  static List<Map<String, dynamic>> getTimeline() {
    return List.unmodifiable(_timeline);
  }

  static void clear() {
    _stopwatches.clear();
    _timeline.clear();
    log('Profiler: Timeline cleared.');
  }
}