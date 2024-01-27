class Pet {
  late String petName, petImage;
  late int petPrice, petAge, petAdopt;

  Pet({
    required String pName,
    required String pImage,
    required int pAge,
    required int pPrice,
    required int pAdopt,
  }) {
    petName = pName;
    petImage = pImage;
    petAge = pAge;
    petPrice = pPrice;
    petAdopt = pAdopt;
  }

  Pet copyWith({
    String? pName,
    String? pImage,
    int? pAge,
    int? pPrice,
    int? pAdopt,
  }) {
    return Pet(
      pName: pName ?? petName,
      pImage: pImage ?? petImage,
      pAge: pAge ?? petAge,
      pPrice: pPrice ?? petPrice,
      pAdopt: pAdopt ?? petAdopt,
    );
  }

  setPetAdopt(int adopt) {
    petAdopt = adopt;
  }

  getPetAdopt() {
    return petAdopt;
  }
}
