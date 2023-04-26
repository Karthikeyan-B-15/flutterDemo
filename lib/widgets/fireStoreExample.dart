import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo/widgets/fireStoreModal.dart';

class FireStoreExample extends StatefulWidget {
  const FireStoreExample({super.key});

  @override
  State<FireStoreExample> createState() => _FireStoreExampleState();
}

class _FireStoreExampleState extends State<FireStoreExample> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("tasks").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Text(
                          snapshot.data!.docs[index].data()['task'] as String);
                    },
                  ),
                );
              } else {
                return const Text('Error');
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('tasks')
                    .doc()
                    .set({'task': _controller.text});
                _controller.text = '';
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
