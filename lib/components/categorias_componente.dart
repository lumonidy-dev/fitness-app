import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/categoria_model.dart';
import './lista_componente.dart';

class CategoriasComponente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    List<CategoriasModel> categorias = CategoriasRepository.getCategorias();

    return ListaComponente<CategoriasModel>(
      titulo: 'Categorias', 
      elementos: categorias, 
      altura: 120,
      itemBuilder: (context, categoria) {
        return GestureDetector(
          onTap: () {
            print("go to ${categoria.nombre} page");
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: categoria.boxColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(categoria.iconPath),
                  ),
                ),
                Text(
                  categoria.nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
