class Ingredient {
  String? ingredientName;
  String? ingredientQuantity;
  String? quantityUnity;

  Ingredient(
      {this.ingredientName, this.ingredientQuantity, this.quantityUnity});

  factory Ingredient.fromJson(Map<String, dynamic> parsedJson) {
    return Ingredient(
      ingredientName: parsedJson['ingredientName'],
      ingredientQuantity: parsedJson['ingredientQuantity'],
      quantityUnity: parsedJson['quantityUnity'],
    );
  }
}
