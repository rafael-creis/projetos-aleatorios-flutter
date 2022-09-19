class GatoEntity {
  String id;
  String url;
  String postDate;
  String? imageText;
  String? _textColor;

  String? get textColor => _textColor;

  set textColor(String? textColor) {
    if (imageText != null) {
      _textColor = textColor;
    } else {
      _textColor = 'white';
    }
  }

  GatoEntity({
    required this.id,
    required this.url,
    required this.postDate,
    this.imageText,
  });
}
