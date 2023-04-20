extension ConversaoData<T> on List<T> {
  void addAllIf(List<T> itens, bool Function(T) validacao) {
    for (final item in itens) {
      if (validacao(item)) {
        this.add(item);
      }
    }
  }

  void substituirValorLista(List<T> novaLista) {
    if (this.isNotEmpty) this.clear();
    this.addAllIf(novaLista, (elemento) => !this.contains(elemento));
  }
}
