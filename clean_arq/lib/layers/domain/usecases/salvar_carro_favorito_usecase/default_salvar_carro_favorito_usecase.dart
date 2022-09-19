import 'package:clean_arq/layers/domain/entitis/carro_entity.dart';
import 'package:clean_arq/layers/domain/repositories/salvar_carro_favorito_repository.dart';
import 'package:clean_arq/layers/domain/usecases/salvar_carro_favorito_usecase/salvar_carro_favorito_usecase.dart';

class DefaultSalvarCarroFavoritoUsecase implements SalvarCarroFavoritoUsecase {
  final SalvarCarroFavoritoRepository _salvarCarroFavoritoRepository;

  DefaultSalvarCarroFavoritoUsecase(this._salvarCarroFavoritoRepository);

  @override
  Future<bool> execute(CarroEntity carroEntity) async {
    return await _salvarCarroFavoritoRepository(carroEntity);
  }
}
