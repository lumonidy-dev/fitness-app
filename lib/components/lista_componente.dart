import 'package:flutter/material.dart';

class ListaComponente<T> extends StatelessWidget {
  final String titulo;
  final List<T> elementos;
  final double altura;
  final Widget Function(BuildContext, T) itemBuilder;
  final bool isVertical; 

  const ListaComponente({
    required this.titulo,
    required this.elementos,
    required this.altura, 
    required this.itemBuilder,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            titulo,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: altura, 
          child: ListView.separated(
            scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
            separatorBuilder: (context, index) => isVertical ? const SizedBox(height: 20) : const SizedBox(width: 20),
            padding: isVertical ? const EdgeInsets.symmetric(vertical: 20) : const EdgeInsets.symmetric(horizontal: 20),
            itemCount: elementos.length,
            itemBuilder: (context, index) {
              return itemBuilder(context, elementos[index]);
            },
          ),
        )
      ],
    );
  }
}
