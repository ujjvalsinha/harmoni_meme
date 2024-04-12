import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_code/feature/meme_generator/domain/repository/meme_repository.dart';
import 'package:interview_code/feature/meme_generator/presentation/cubit/meme_cubit.dart';

import 'core/di/service_locator.dart';
import 'feature/meme_generator/presentation/screen/meme_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setupServices();
  runApp(MyApp(
    savedTheme: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedTheme;
  const MyApp({super.key, this.savedTheme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: savedTheme ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: BlocProvider<MemeCubit>(
          create: (context) => MemeCubit(GetIt.I<MemeRepository>()),
          child: const MemeHomeScreen(),
        ),
      ),
    );
  }
}
