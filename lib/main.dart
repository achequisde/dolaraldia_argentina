import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/pages/about_us.dart';
import 'package:dolaraldia_argentina/pages/history.dart';
import 'package:dolaraldia_argentina/pages/home.dart';
import 'package:dolaraldia_argentina/pages/notifications.dart';
import 'package:dolaraldia_argentina/utils/get_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
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
      home: const MyHomePage(title: 'Dólar Al Día'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  var _currentIndex = 1;

  final _titles = [
    'Acerca De Nosotros',
    'Dólar Al Día',
    'Historial',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          _titles[_currentIndex],
        ),
        centerTitle: true,
        actions: [
          if (_currentIndex == 1)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          if (_currentIndex == 2)
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
          index: _currentIndex,
          children: const [
            AboutUs(),
            Home(),
            History(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        currentIndex: _currentIndex,
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
