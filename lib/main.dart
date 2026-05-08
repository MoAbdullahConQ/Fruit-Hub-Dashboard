import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';

Future<void> main() async {
    Bloc.observer = CustomBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
