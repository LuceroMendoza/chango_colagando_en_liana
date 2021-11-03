import "package:flutter/material.dart";
import "package:all_sensors/all_sensors.dart";

void main() => runApp(ChangoyLiana());

class ChangoyLiana extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<ChangoyLiana> {
  late List<double> acelerometro;
  double derecha = 0.0;
  double izquierda = 0.0;
  String mensaje = "";
  late double ejex;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        acelerometro = [event.x, event.y, event.z];
        ejex = event.x;
        if (acelerometro[0] < 0) {
          mensaje = "Izquierda";
        } else if (acelerometro[0] > 0) {
          mensaje = "Derecha";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("$mensaje", style: TextStyle(fontFamily: 'RobotoMono')),
            ),
            body: Container(
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(
                        'https://img.freepik.com/vector-gratis/fondo-selva-detallada_23-2148949774.jpg?size=626&ext=jpg'),
                    fit: BoxFit.fill,
                    height: double.infinity
                  ),
                  Positioned(
                    right: derecha,
                    left: izquierda,
                    child: Container(
                      height: 400,
                      width: 300,
                        child: Positioned(
                            child: Transform.translate(
                              offset: Offset(ejex * 50, 0),
                              child: Image(
                                image: NetworkImage(
                                    'https://img.freepik.com/vector-gratis/mono-dibujos-animados-bebe-colgando-rama-arbol_29190-4769.jpg?size=626&ext=jpg'),
                              ),
                            )
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
