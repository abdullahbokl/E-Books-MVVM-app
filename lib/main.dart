import 'package:flutter/material.dart';

import 'core/utils/services_locator.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  runApp(const BokloEBook());
}
