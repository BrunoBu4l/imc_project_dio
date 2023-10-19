import 'package:flutter/material.dart';
import 'package:imcproject/pages/page_principal.dart';

//import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira a faixa do Banner "DEBUG"
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: Typography.blackCupertino, //texto geral de toda a aplicação
      ),
      home: const PagePrincipal(),
    );
  }
}
