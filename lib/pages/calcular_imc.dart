import 'package:flutter/material.dart';

class PagePrincipal extends StatefulWidget {
  const PagePrincipal({Key? key}) : super(key: key);

  @override
  State<PagePrincipal> createState() => _MainPageState();
}

class _MainPageState extends State<PagePrincipal> {
  var alturaController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");
  bool salvando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar IMC"),
                    content: Wrap(
                      children: [
                        const Text("Altura: "),
                        TextField(controller: alturaController),
                        const Text("Peso:"),
                        TextField(controller: pesoController),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () {
                            //print(pesoController);
                            //print(alturaController);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          }),
    );
  }
}
