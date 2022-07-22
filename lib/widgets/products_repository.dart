import 'product.dart';

class ProductsRepository {
  static List<Product> likeProducts = [];

  static List<Product> allProducts = [
    Product(
        category: Category.Icecream,
        detail: 'Present tasty ice cream formed into the shape of a flower!',
        isOpen: 'Close',
        name: 'Amorino',
        path: 'https://s2.loli.net/2022/05/18/mayshxI8QzWlp9K.jpg',
        rating: '4.3',
        distance: '0.2 mi'),
    Product(
        category: Category.Icecream,
        detail:
            'Inimate, unfussy white ice-cream parlour serving Italian artisan gelato and sorbets made in house.',
        isOpen: 'Open',
        name: 'Lick',
        path: 'https://s2.loli.net/2022/05/18/Cqeh2vFyi7RcIoM.jpg',
        rating: '3.5',
        distance: '0.6 mi'),
    Product(
        category: Category.Icecream,
        detail:
            'Upmarket cafe with a vast counter selling more than 50 gelatos and storbets made on-site each day. Our creamy organic Jesey milk comes form a family farm in Somerset, whilst our nuts grow in the Italian mountainsides.',
        isOpen: 'Open',
        name: 'Snowflake Luxury Gelato',
        path: 'https://s2.loli.net/2022/05/18/dRhxtYWGf7zS1ij.jpg',
        rating: '4.3',
        distance: '0.3 mi'),
    Product(
        category: Category.Cake,
        detail:
            'Amazing cake shop in the heart of Carnaby/Soho woth an ever-changing selection of cakes, cupcakes, brownies and more plus sodas and coffee.',
        name: 'Crumbs & Doilies',
        path: 'https://s2.loli.net/2022/05/17/T1KYvoFEVZj2upW.jpg',
        isOpen: 'Open',
        rating: '4.7',
        distance: '0.3 mi'),
    Product(
        category: Category.Cake,
        detail:
            'Provide Vegan cakes for birthdays. Red velet tastes really nice and is recommended. We offer delicious and tasty cakes!',
        name: 'Lola s Cupcakes',
        path: 'https://s2.loli.net/2022/05/18/QDVSbXhqYC2AMfU.jpg',
        isOpen: 'Open',
        rating: '4.5',
        distance: '0.2 mi'),
    Product(
        category: Category.Cake,
        name: 'Golden Gate Cake Shop',
        detail:
            'Easygoing, modest grab-&-go bakery featuring sweet& savory Chinese pastries, buns & cakes.',
        path: 'https://s2.loli.net/2022/05/18/wZEkghSJIM3TeGF.jpg',
        isOpen: 'Open',
        rating: '4.5',
        distance: '0.4 mi'),
    Product(
        category: Category.Bubbletea,
        detail:
            'Bright space with contemporary cube stools and tables, for fresh, gourmet Taiwanese bubble tea.',
        name: 'Biju Bubble Tea Room ',
        path: 'https://s2.loli.net/2022/05/18/s6NJVMhHGy5Ltcq.jpg',
        isOpen: 'Open',
        rating: '4.2',
        distance: '0.2 mi'),
    Product(
        category: Category.Bubbletea,
        detail:
            'From classic milk bubble teas to Asian pop tea, smoothies and juices in a tiny casual venue.',
        name: 'Chattime',
        path: 'https://s2.loli.net/2022/05/18/clCh3KfE9FrnA26.jpg',
        isOpen: 'Open',
        rating: '3.9',
        distance: '0.7 mi'),
    Product(
        category: Category.Bubbletea,
        detail:
            'Pho the love of baguettes and bubble tea we got you covered in the heart of soho! Our connoisseyr tea artist will freshly brew each drink to order to ensure you stay hydrated with the freshest tailor made bubble tea in London! Vegan and lactose intolerant friendly!',
        name: 'Presotea Soho',
        path: 'https://s2.loli.net/2022/05/18/Dbtc1jXvJWoMfA4.jpg',
        isOpen: 'Open',
        rating: '4.5',
        distance: '0.6 mi'),
  ];

  static List<Product> loadProducts(Category category) {
    return allProducts.where((Product p) {
      return p.category == category;
    }).toList();
  }
}

// List<Images1> list = [
//   const Images1(
//       path1: 'https://s2.loli.net/2022/05/17/U615OfmHpKTvSsh.jpg',
//       path2: 'https://s2.loli.net/2022/05/17/AMrNxvwIa7yLenB.jpg'),
//   const Images1(
//       path1: 'https://s2.loli.net/2022/05/17/kLgUAlZnDxFz8YV.jpg',
//       path2: 'https://s2.loli.net/2022/05/17/LZh5k92QUO3jSmp.jpg'),
// ];
