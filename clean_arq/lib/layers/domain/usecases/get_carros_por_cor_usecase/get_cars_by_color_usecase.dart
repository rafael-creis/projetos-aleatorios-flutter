import 'package:clean_arq/layers/domain/entitis/carro_entity.dart';

abstract class GetCarrosPorCor {
  CarroEntity execute(String cor);
}
