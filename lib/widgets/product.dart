enum Category {
  //all,
  Icecream,
  Cake,
  Bubbletea,
}

class Product {
  const Product({
    this.category,
    this.isOpen,
    this.name,
    this.rating,
    this.path,
    this.distance,
    this.detail,
  });

  final Category category;

  final String isOpen;
  final String name;
  final String rating;
  final String path;
  final String distance;
  final String detail;
}

// class Images1 {
//   const Images1({
//     required this.path1,
//     required this.path2,
//   });

//   final String path1;
//   final String path2;
// }
