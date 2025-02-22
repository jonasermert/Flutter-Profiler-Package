library flutter_profiler;

import 'dart:developer' as dev;

class FlutterProfiler {
  static final Map<String, Stopwatch> _timers = {};
  static final List<Map<String, dynamic>> _timeline = [];

  static void start(String key) {
    _timers[key] = Stopwatch()..start();
  }

  static void stop(String key) {
    if (_timers.containsKey(key)) {
      final elapsed = _timers[key]!.elapsedMilliseconds;
      _timers[key]!.stop();
      _timeline.add({
        "key": key,
        "duration": elapsed,
        "timestamp": DateTime.now().toIso8601String(),
      });

      dev.log("Profiler: $key hat $elapsed ms gedauert.", name: "FlutterProfiler");
    }
  }

  static List<Map<String, dynamic>> getTimeline() => _timeline;

  static void clear() {
    _timers.clear();
    _timeline.clear();
  }
}