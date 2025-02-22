# 🚀 Flutter Profiler

**A lightweight profiler package for Flutter & Dart.**  
Easily measure execution times for API calls, UI widgets, and other processes using `start()` and `stop()`.  

![GitHub stars](https://img.shields.io/github/stars/jonasermert/flutter_profiler?style=social)  
![Pub Version](https://img.shields.io/pub/v/flutter_profiler)  
![License](https://img.shields.io/github/license/jonasermert/flutter_profiler)  

---

## 📌 Features  
✅ **Easy to use** – `FlutterProfiler.start("Task")` and `FlutterProfiler.stop("Task")`  
✅ **Stores all measurements as a timeline**  
✅ **Logs execution times for debugging**  
✅ **Can be used in any Flutter/Dart project**  

---

## 📦 Installation & Usage  

To use this package, add it to your dependencies in `pubspec.yaml`:  

```yaml
dependencies:
  flutter_profiler: ^1.0.0
```

Then import the package and start using it:  

```dart
import 'package:flutter_profiler/flutter_profiler.dart';

void fetchData() async {
  FlutterProfiler.start("API Request");
  await Future.delayed(Duration(seconds: 2)); // Simulated API call
  FlutterProfiler.stop("API Request");
}

class ProfilingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterProfiler.start("Widget Build");
    final widget = Container(color: Colors.blue, height: 100);
    FlutterProfiler.stop("Widget Build");
    return widget;
  }
}

List<Map<String, dynamic>> data = FlutterProfiler.getTimeline();
print(data);

FlutterProfiler.clear();
```

📌 Sample output:  
```json
[
  { "key": "API Request", "duration": 2000, "timestamp": "2025-02-12T12:34:56Z" }
]
```

---

## 🛠 Development & Testing  
If you want to test the package locally, add the local package path in `pubspec.yaml`:  

```yaml
dependencies:
  flutter_profiler:
    path: ../flutter_profiler
```

Then run the example script:  

```sh
dart run example/example.dart
```

---

## 📜 License  
This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.  

---

## 🌟 Support & Contribute  
⭐ **If you like this package, give it a star on GitHub!**  
🐛 **Found a bug or have a suggestion?** Open an issue or submit a pull request!  

📬 **Questions?** [Open an issue](https://github.com/jonasermert/flutter_profiler/issues)  
