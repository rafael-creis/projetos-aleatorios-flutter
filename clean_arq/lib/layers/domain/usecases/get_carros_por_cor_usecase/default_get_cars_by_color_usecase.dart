import 'package:clean_arq/layers/domain/entitis/carro_entity.dart';
import 'get_cars_by_color_usecase.dart';

class DefaultGetCarrosPorCor implements GetCarrosPorCor {
  @override
  CarroEntity execute(String cor) {
    if (cor.contains('vermelho')) {
      return CarroEntity(
          placa: 'ABC123', modelo: 'Camaro', qtdPortas: 2, valor: 50000);
    }
    return CarroEntity(
        placa: 'DEF456', modelo: 'Chevette', qtdPortas: 4, valor: 12000);
  }
}
