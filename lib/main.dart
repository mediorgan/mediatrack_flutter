import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediatrack_flutter/providers/movies_provider.dart';
import 'package:mediatrack_flutter/providers/settings_provider.dart';
import 'package:mediatrack_flutter/providers/tv_provider.dart';
import 'package:mediatrack_flutter/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TVProvider(),
        )
      ],
      child: Consumer3<SettingsProvider, MoviesProvider, TVProvider>(
        builder:
            (context, settingsProvider, moviesProvider, tvProvider, child) =>
                MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MediaTrack',
          theme: settingsProvider.themeData,
          home: HomePage(),
        ),
      ),
    );
  }
}
