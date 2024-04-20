import 'dart:html';

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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  InputDecoration decorationUser = InputDecoration(
      prefixIcon: const Icon(Icons.person),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      filled: true,
      labelText: 'Email');
  InputDecoration decorationPass = InputDecoration(
      prefixIcon: const Icon(Icons.lock),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      filled: true,
      labelText: 'Password');

  EdgeInsets padding = const EdgeInsets.only(left: 15, right: 15);
  Widget vertical({required double height}) {
    return Padding(
        padding: padding,
        child: Column(
          children: [
            Image.network(
                height: height < 550 ? 125 : height / 5,
                'https://th.bing.com/th/id/OIG2.xxZAQqi4EqnFzy4H1Uz7?pid=ImgGn'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: decorationUser,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: decorationPass.copyWith(
                  suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )),
              obscureText: !_isPasswordVisible,
            ),
            const SizedBox(
              height: 15,
            ),
            FilledButton(onPressed: () {}, child: Text('Login')),
            const SizedBox(
              height: 15,
            )
          ],
        ));
  }

  Widget horizontal({required double height}) {
    return Row(
      children: [
        Expanded(
            child: Image.network(
                height: height < 400 ? 200 : height / 2,
                'https://th.bing.com/th/id/OIG2.xxZAQqi4EqnFzy4H1Uz7?pid=ImgGn')),
        Expanded(
            child: Padding(
                padding: padding,
                child: Column(children: [
                  TextFormField(
                    decoration: decorationUser,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: decorationPass.copyWith(
                        suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )),
                    obscureText: !_isPasswordVisible,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FilledButton(onPressed: () {}, child: Text('Login')),
                  const SizedBox(
                    height: 15,
                  )
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
              SingleChildScrollView(
                  child: Center(
                      child: Container(
                width: width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: width > 800
                    ? horizontal(height: height)
                    : vertical(height: height),
              )))
            ],
          ),
        );
      },
    );
  }
}
