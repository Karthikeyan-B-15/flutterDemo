import 'package:flutter/material.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  late String data = '';
  bool isDismiss = false;
  final textController = TextEditingController();
  List<String> name = [];
  List<String> checkedItems = [];
  @override
  void initState() {
    super.initState();
    data = 'No data';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) => Card(
                  child: CheckboxListTile(
                onChanged: (value) {
                  setState(() {
                    checkedItems.contains(name[index])
                        ? checkedItems.remove(name[index])
                        : checkedItems.add(name[index]);
                  });
                },
                value: checkedItems.contains(name[index]),
                title: Text(name[index]),
              )),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SizedBox(
                                height: 300,
                                child: Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Scrollbar(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          controller: textController,
                                          decoration: const InputDecoration(
                                            hintText: 'Give your tasks!!!',
                                            border: InputBorder.none,
                                          ),
                                          maxLines: 8,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(20, 0, 0, 0),
                                              blurRadius: 10.0,
                                              offset: Offset(
                                                0.0,
                                                -15.0,
                                              ),
                                            )
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  name.add(textController
                                                      .value.text
                                                      .toString());
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: const Text('Submit')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.grey)),
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: const Text('Cancel')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ])),
                          );
                        });
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ));
  }
}
