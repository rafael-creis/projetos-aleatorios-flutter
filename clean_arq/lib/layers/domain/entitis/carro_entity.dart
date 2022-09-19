class CarroEntity {
  String placa;
  String modelo;
  int qtdPortas;
  double valor;

  CarroEntity({
    required this.placa,
    required this.modelo,
    required this.qtdPortas,
    required this.valor,
  });

  double get valorReal {
    return valor * qtdPortas;
  }
}
