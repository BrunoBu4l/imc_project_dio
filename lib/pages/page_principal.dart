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
                          const Text("Altura: "),
                          TextField(
                            controller: alturaController,
                            keyboardType: TextInputType.number,
                          ),
                          const Text("Peso:"),
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
                                  int.parse(alturaController.text),
                                  double.parse(pesoController.text)));
                              print(pesoController.text);
                              print(alturaController.text);
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text("Salvar"))
                      ],
                    );
                  });
            }),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Apenas não concluidos",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
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
                        child: ListTile(
                          title: Text("Altura: ${imc.getAltura().toString()}"),
                          subtitle: Text("Peso: ${imc.getPeso().toString()}"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
