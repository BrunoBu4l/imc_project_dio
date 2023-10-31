import 'package:flutter/material.dart';
import 'package:imcproject/model/imc.dart';
import 'package:imcproject/repositories/imc_repository.dart';

class PagePrincipal extends StatefulWidget {
  const PagePrincipal({Key? key}) : super(key: key);

  @override
  State<PagePrincipal> createState() => _MainPageState();
}

class _MainPageState extends State<PagePrincipal> {
  var alturaController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");
  bool salvando = false;

  var imcRepository = ImcRepository();
  var _imcs = const <Imc>[];
  double calcular = 0;

  @override
  void initState() {
    super.initState();
    obter();
  }

  void obter() async {
    _imcs = await imcRepository.listar();
    setState(() {});
  }

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
                          const Text("Altura em 0.00"),
                          TextField(
                            controller: alturaController,
                            keyboardType: TextInputType.number,
                          ),
                          const Text("Peso em quilos"),
                          TextField(
                            controller: pesoController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () async {
                              await imcRepository.adicionar(Imc(
                                  double.parse(alturaController.text),
                                  double.parse(pesoController.text)));
                              // Calcular o IMC após a adição do objeto Imc

                              //print(pesoController.text);
                              //print(alturaController.text);
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text("Salvar"))
                      ],
                    );
                  });
            }),
        body: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 50),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lista de IMC:",
                            style:
                                TextStyle(fontSize: 18, color: Colors.red[900]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _imcs.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var imc = _imcs[index];
                      //print(resultado);
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          await imcRepository.remover(imc.getId());
                          obter();
                        },
                        key: Key(imc.getId()),
                        child: Card(
                          child: ListTile(
                            title:
                                Text("Altura: ${imc.getAltura().toString()}"),
                            subtitle: Text("Peso: ${imc.getPeso().toString()}"),
                            trailing: Column(
                              children: [
                                Text("IMC: ${imc.calcularIMC(imc).toString()}"),
                                Text(
                                    "Classificação: ${imc.classificarIMC(imc).toString()}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
