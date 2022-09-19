import 'package:clean_arq/layers/domain/entitis/carro_entity.dart';

abstract class SalvarCarroFavoritoUsecase {
  Future<bool> execute(CarroEntity carroEntity);
}
