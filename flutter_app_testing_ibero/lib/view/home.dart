import 'package:flutter/material.dart';
import 'package:flutter_app_testing_ibero/view/widgets/description_place.dart';
import 'package:flutter_app_testing_ibero/view/widgets/header_appbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 323.0,
            right: 3.0,
          ),
          child: ListView(
            children: [
              DescriptionPlace("Bootcamp Desarrollo \nWeb Full Stack",
                  "¡Conviértete en un Programador Web! Es el cargo más demandado en el mundo de la tecnología. Este bootcamp (curso intensivo de programación) ofrece todas las herramientas, lenguajes y técnicas para ejercer como programador Web.."),
              DescriptionPlace("Bootcamp Data \nScience: Machine \nLearning con Python",
                  "¡Conviértete en un científico de datos! Aprende a manejar información y datos de manera inteligente y automática por medio de inteligencia artificial. Las empresas necesitan expertos para recopilar información y obtener una ventaja competitiva en el mercado."),
              DescriptionPlace(
                  "Curso Diseño y \nDesarrollo de \nVideojuegos con Unity", "Aprende a crear las historias más increíbles para tus videojuegos. Crea los guiones, define el género del juego y el público al cual va dirigido. Crea ilustraciones y los concept art para luego darle vida a esos personajes y/o entornos deseados."),
            ],
          ),
        ),
        HeaderAppBar()
      ],
    ));
  }
}
