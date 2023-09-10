import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<List<int>> matrixA = List.generate(
    3,
        (i) => List.generate(3, (j) => 0),
  );

  List<List<int>> matrixB = List.generate(
    3,
        (i) => List.generate(3, (j) => 0),
  );

  List<List<int>> hasilMatrik = List.generate(
    3,
        (i) => List.generate(3, (j) => 0),
  );

  List<List<TextEditingController>> matrixAControllers = List.generate(
    3,
        (i) => List.generate(3, (j) => TextEditingController()),
  );

  List<List<TextEditingController>> matrixBControllers = List.generate(
    3,
        (i) => List.generate(3, (j) => TextEditingController()),
  );

  // Clear
  void clearInputs() {
    for (var controllerList in matrixAControllers) {
      for (var controller in controllerList) {
        controller.text = '';
      }
    }

    for (var controllerList in matrixBControllers) {
      for (var controller in controllerList) {
        controller.text = '';
      }
    }

    setState(() {
      matrixA = List.generate(
        3,
            (i) => List.generate(3, (j) => 0),
      );
      matrixB = List.generate(
        3,
            (i) => List.generate(3, (j) => 0),
      );
      hasilMatrik = List.generate(
        3,
            (i) => List.generate(3, (j) => 0),
      );
    });
  }

  bool isInputValid() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (matrixA[i][j] == 0 || matrixB[i][j] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Operations'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Matrix A'),
              for (int i = 0; i < 3; i++)
                Row(
                  children: [
                    for (int j = 0; j < 3; j++)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: matrixAControllers[i][j],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                matrixA[i][j] = int.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              SizedBox(height: 20),
              Text('Matrix B'),
              for (int i = 0; i < 3; i++)
                Row(
                  children: [
                    for (int j = 0; j < 3; j++)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: matrixBControllers[i][j],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                matrixB[i][j] = int.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!isInputValid()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terdapat kotak matriks yang kosong.', textAlign: TextAlign.center,),
                          ),
                        );
                        return;
                      }

                      setState(() {
                        for (int i = 0; i < 3; i++) {
                          for (int j = 0; j < 3; j++) {
                            hasilMatrik[i][j] = matrixA[i][j] + matrixB[i][j];
                          }
                        }
                      });
                    },
                    child: Text('Penjumlahan Matrik'),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (!isInputValid()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terdapat kotak matriks yang kosong.', textAlign: TextAlign.center,),
                          ),
                        );
                        return;
                      }

                      setState(() {
                        for (int i = 0; i < 3; i++) {
                          for (int j = 0; j < 3; j++) {
                            hasilMatrik[i][j] = matrixA[i][j] - matrixB[i][j];
                          }
                        }
                      });
                    },
                    child: Text('Pengurangan Matrik',),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: clearInputs,
                child: Text('Clear'),
              ),
              SizedBox(height: 10),
              Text('Hasil Matrik'),
              for (var row in hasilMatrik)
                Text(row.toString(), style: TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
    );
  }
}
