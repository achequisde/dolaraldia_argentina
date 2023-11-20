import 'package:dolaraldia_argentina/pages/about_us.dart';
import 'package:dolaraldia_argentina/pages/history.dart';
import 'package:dolaraldia_argentina/pages/home.dart';
import 'package:dolaraldia_argentina/pages/notifications.dart';
import 'package:dolaraldia_argentina/providers/history/last_dropdown.dart';
import 'package:dolaraldia_argentina/themes/dark_theme.dart';
import 'package:dolaraldia_argentina/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentTheme = ThemeMode.light;

  void toggleTheme() {
    final isDark = currentTheme == ThemeMode.dark;

    setState(() {
      currentTheme = isDark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: currentTheme,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'VE'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
          title: 'Dólar Al Día',
          theme: currentTheme,
          changeThemeCallback: toggleTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.changeThemeCallback,
    required this.theme,
  });

  final String title;
  final Function() changeThemeCallback;
  final ThemeMode theme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  var currentIndex = 1;
  var theme = Brightness.light;

  final titles = [
    'Acerca De Nosotros',
    'Dólar Al Día',
    'Historial',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          titles[currentIndex],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            widget.theme == ThemeMode.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          onPressed: widget.changeThemeCallback,
        ),
        actions: [
          if (currentIndex == 1)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          if (currentIndex == 2)
            IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              onPressed: () {},
            ),
          MenuAnchor(
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                ),
              );
            },
            menuChildren: [
              MenuItemButton(
                leadingIcon: const Icon(Icons.notifications),
                child: const Text('Notificaciones'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationsPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            const AboutUs(),
            const Home(),
            BlocProvider(
              create: (context) => LastDropdownCubit(),
              child: const History(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Acerca De',
            icon: Icon(Icons.question_mark_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Historial',
            icon: Icon(Icons.history),
          ),
        ],
      ),
    );
  }
}
