import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final inputController = TextEditingController();
  bool passwordVisibility = false;
  @override
  void initState() {
    super.initState();
    inputController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              'https://img.webcodegenie.com/img/technology-infographics/Flutter.svg',
            ),
            buildInputField(),
            const SizedBox(height: 30),
            buildPasswordField(),
          ],
        ),
      ),
    );
  }

  Widget buildInputField() => TextField(
        controller: inputController,
        decoration: InputDecoration(
            hintText: 'abc@gmail.com',
            suffixIcon: inputController.text.isEmpty
                ? Container(
                    width: 0,
                  )
                : IconButton(
                    onPressed: () {
                      inputController.clear();
                    },
                    icon: const Icon(Icons.close)),
            prefixIcon: const Icon(Icons.email_outlined),
            label: const Text('Enter email!!'),
            border: const OutlineInputBorder()),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.search,
      );
  Widget buildPasswordField() => TextField(
        controller: inputController,
        decoration: InputDecoration(
            errorText: ' ',
            suffixIcon: inputController.text.isEmpty
                ? Container(
                    width: 0,
                  )
                : IconButton(
                    onPressed: () {
                      setState(
                          () => {passwordVisibility = !passwordVisibility});
                    },
                    icon: Icon(
                        color: Colors.black,
                        passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility)),
            prefixIcon: const Icon(Icons.lock),
            label: const Text('Enter password!!'),
            border: const OutlineInputBorder()),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.search,
        obscureText: !passwordVisibility,
      );
}
