import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PainterOptions extends StatelessWidget {
  const PainterOptions({
    Key? key,
    required this.onClean,
  }) : super(key: key);

  final VoidCallback onClean;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxHeight >
                    MediaQuery.of(context).size.height * 0.05) {
                  return Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          color: Colors.black,
                          // TODO: Add save method
                          onPressed: () {},
                          icon: const Icon(Icons.star_border_outlined),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxHeight >
                  MediaQuery.of(context).size.height * 0.05) {
                return Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: onClean,
                        icon: const Icon(
                          FontAwesomeIcons.eraser,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Limpar",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }
}
