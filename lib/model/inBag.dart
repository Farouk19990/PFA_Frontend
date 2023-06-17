// ignore_for_file: unnecessary_this, prefer_interpolation_to_compose_strings

class InBag {
  int id;
  String? imgUrl;
  String? productName;
  String? color;
  String? size;
  int? price;
  int qte;
  InBag(this.id, String this.imgUrl, String this.productName, String this.color,
      String this.size, int this.price, this.qte);
  void setQte(int qte) {
    this.qte = qte;
  }

  @override
  String toString() {
    return " id:: " +
        id.toString() +
        "imgUrl:: " +
        imgUrl.toString() +
        " productName:: " +
        this.productName.toString() +
        " color:: " +
        this.color.toString() +
        " size:: " +
        this.size.toString() +
        " price:: " +
        this.price.toString() +
        " qte:: " +
        this.qte.toString();
  }
}
