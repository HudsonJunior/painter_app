import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PainterOptions extends StatefulWidget {
  const PainterOptions({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  State<PainterOptions> createState() => _PainterOptionsState();
}

class _PainterOptionsState extends State<PainterOptions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.height > MediaQuery.of(context).size.height * 0.1)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        color: Colors.black,
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
                ),
              ),
            if (widget.height > MediaQuery.of(context).size.height * 0.1)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
