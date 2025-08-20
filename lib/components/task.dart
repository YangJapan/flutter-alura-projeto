import 'package:flutter/material.dart';

import 'package:nosso_primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;

  final String foto;

  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  List<Color> maestria = [
    Colors.blue,

    Colors.green,

    Colors.yellow,

    Colors.orange,

    Colors.red,

    Colors.purple,

    Colors.black,
  ];

  int maestriaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Stack(
        children: [
          Container(
            height: 140,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),

              color: maestria[maestriaLevel],
            ),
          ),

          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),

                  color: Colors.white,
                ),

                height: 100,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),

                        color: Colors.black26,
                      ),

                      height: 100,

                      width: 72,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),

                        child: Image.asset(widget.foto, fit: BoxFit.cover),
                      ),
                    ),

                    SizedBox(
                      width: 200,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            widget.nome,

                            style: const TextStyle(
                              fontSize: 24,

                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Difficulty(difficultyLevel: widget.dificuldade),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 52,

                      height: 52,

                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),

                          shape: WidgetStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),

                          backgroundColor: WidgetStateProperty.all(
                            Colors.blueAccent,
                          ),
                        ),

                        onPressed: () {
                          setState(() {
                            if ((nivel >= widget.dificuldade * 10) &&
                                maestriaLevel < 6) {
                              maestriaLevel++;

                              nivel = 0;
                            }

                            nivel++;
                          });
                        },

                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.white),

                            Text(
                              'UP',

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(
                      width: 200,

                      child: LinearProgressIndicator(
                        color: Colors.white,

                        backgroundColor: Colors.white24,

                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),

                    Text(
                      'Nivel: $nivel',

                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
