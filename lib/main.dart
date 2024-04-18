import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InputDecoration decorationUser = InputDecoration(
    icon: const Icon(Icons.person),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    filled: true,
  );
  InputDecoration decorationPass = InputDecoration(
    icon: const Icon(Icons.lock),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    filled: true,
  );

  EdgeInsets padding = const EdgeInsets.only(left: 15, right: 15);
  Widget vertical() {
    return Padding(
        padding: padding,
        child: Column(
          children: [
            Image.network(
                height: MediaQuery.sizeOf(context).height / 5,
                'https://th.bing.com/th/id/OIG2.xxZAQqi4EqnFzy4H1Uz7?pid=ImgGn'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: decorationUser,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: decorationPass,
            ),
            const SizedBox(
              height: 15,
            ),
            FilledButton(onPressed: () {}, child: Text('Login'))
          ],
        ));
  }

  Widget horizontal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Image.network(
                height: MediaQuery.sizeOf(context).height / 2,
                'https://th.bing.com/th/id/OIG2.xxZAQqi4EqnFzy4H1Uz7?pid=ImgGn')),
        Expanded(
            child: Padding(
                padding: padding,
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: decorationUser,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: decorationPass,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FilledButton(onPressed: () {}, child: Text('Login'))
                ])))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Scaffold(
          body: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Image.network(
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                  'https://images.unsplash.com/photo-1584722065451-922e4d176e53?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              Container(
                height: height / 2,
                width: width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                    child: width > 800 ? horizontal() : vertical()),
              )
            ],
          ),
        );
      },
    );
  }
}
