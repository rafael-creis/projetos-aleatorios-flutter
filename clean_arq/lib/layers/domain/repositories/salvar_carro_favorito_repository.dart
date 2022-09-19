import 'package:clean_arq/layers/domain/entitis/carro_entity.dart';

abstract class SalvarCarroFavoritoRepository {
  Future<bool> execute(CarroEntity carroEntity);
}
