import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    super.key,
  });

  static const appBarTitle = 'Acerca De Nosotros';

  static const paragraphs = [
    'Dólar Al Día es una aplicación desarrollada por la Corporación Tecnológica de Guayana que monitorea el valor del dólar en Venezuela tomando la información proveniente de distintas fuentes de tasas de cambio. Se tiene como fuente principal la tasa fijada por el Banco Central de Venezuela. Nosotros no establecemos la tasa de cambio de ninguna fuente, solo la mostramos.',
    'La aplicación cuenta con una calculadora virtual que permite al usuario realizar la conversión de dólares estadounidenses a Bolívares y viceversa, con la tasa de cambio que el usuario seleccione.',
    'También contamos con una herramienta para ver el historial del precio del dólar en un rango de fechas seleccionado por el usuario, y realizar conversiones con la tasa de cambio de cualquier fecha en el historial.',
    'Desde la aplicación el usuario puede compartir la tasa del día y configurar notificaciones que le informen cada vez que se actualice el precio del dólar.',
  ];

  @override
  Widget build(BuildContext context) {
    final Widget description = Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/logo_dolar_al_dia.svg',
                fit: BoxFit.contain,
                height: 120.0,
              ),
              SvgPicture.asset(
                'assets/logo_empresa_iso.svg',
                fit: BoxFit.contain,
                height: 50.0,
              )
            ],
          ),
        ),
        for (var paragraph in paragraphs)
          AboutUsDescriptionText(
            textBody: paragraph,
          ),
      ],
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: description,
      ),
    );
  }
}

class AboutUsDescriptionText extends StatelessWidget {
  const AboutUsDescriptionText({
    super.key,
    required this.textBody,
  });

  final String textBody;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Text(
        textBody,
        style: style,
      ),
    );
  }
}
