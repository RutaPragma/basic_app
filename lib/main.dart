import 'package:basic_app/core/di/injector.dart';
import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/core/theme/app_theme.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final List<int> _items = List<int>.generate(300, (int index) => index);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<ItemsProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'BasicApp',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool shadowColor = false;

  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {

    final language = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language.translate('app_title'),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).appBarTheme.backgroundColor!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
            child: Icon(Icons.task, color: Colors.white),
          ),
        ],
      ),

      body: GridView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: Text('Item ${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          if (scrolledUnderElevation == null) {
            setState(() {
              scrolledUnderElevation = 4.0;
            });
          } else {
            setState(() {
              scrolledUnderElevation = scrolledUnderElevation! + 1.0;
            });
          }
        },
      ),
    );
  }
}
