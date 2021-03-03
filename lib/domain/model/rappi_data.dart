import 'package:meta/meta.dart' show required;

class RappiCategory {
  const RappiCategory({
    @required this.name,
    @required this.products,
  });
  final String name;
  final List<RappiProduct> products;
}

class RappiProduct {
  const RappiProduct({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.image,
  });
  final String name;
  final String description;
  final double price;
  final String image;
}

const rappiCategories = [
  RappiCategory(
    name: 'Pets',
    products: [
      RappiProduct(
          name: 'Milo',
          description: '6 months',
          price: 26.50,
          image: 'assets/images/dog-img.jpg'),
      RappiProduct(
          name: 'Mando',
          description: '1 year and 6 months',
          price: 11.50,
          image: 'assets/images/dog2.jpg'),
      RappiProduct(
          name: 'Polo',
          description: '1 months',
          price: 28.50,
          image: 'assets/images/dog3.jpg'),
      RappiProduct(
          name: 'Buffy',
          description: '1 year',
          price: 20.50,
          image: 'assets/images/dog4.jpg'),
      RappiProduct(
          name: 'Ceisar',
          description: '9 months',
          price: 29.50,
          image: 'assets/images/dog5.jpg'),
    ],
  ),
  RappiCategory(
    name: 'Medicine',
    products: [
      RappiProduct(
          name: 'Sudogwon Millions',
          description:
              'Steamed bao-sandwiches with kimchi, pickled cucumber and mango cubes.',
          price: 26.50,
          image: 'assets/images/sudogwonmillions.png'),
      RappiProduct(
          name: 'Gentle Monster',
          description: 'Mandus mit Shrimps, 4 Stk.',
          price: 12.50,
          image: 'assets/images/gentlemonster.png'),
      RappiProduct(
          name: 'Unified Silla',
          description:
              'Natural planted fried Blumenkohl glasiert mit Gochujang',
          price: 11.50,
          image: 'assets/images/unifiedsilla.png'),
      RappiProduct(
          name: 'Nosan Night',
          description: 'Pikante koreanische Suppe mit Kimchi und Tofu',
          price: 7.50,
          image: 'assets/images/nosannight.png'),
      RappiProduct(
          name: 'Wings of Incheon',
          description: 'Micro-Greens & gerösteten Erbsen, 4 Stk.',
          price: 29.50,
          image: 'assets/images/wingsofincheon.png'),
    ],
  ),
  RappiCategory(
    name: 'Vets',
    products: [
      RappiProduct(
          name: 'Haeundae Surf',
          description:
              'Chicken-Bibimbap mit Reis, Bohnen, Spinat, Karotten, Shiitake- Pilzen, Sesamöl, gerösteten Zwiebeln & Ei.',
          price: 23.50,
          image: 'assets/images/haeundaesurf.png'),
      RappiProduct(
          name: 'Gugudan O’Clock',
          description:
              'Ramen Soup mit Porkbelly & Chicken, homemade Brühe, Shiitake-Pilzen, & Frühlingszwiebeln.',
          price: 24.50,
          image: 'assets/images/gugudanoclock.png'),
      RappiProduct(
          name: 'Koyote Pop',
          description:
              'Marinierter, knuspriger Tofu & Frühlingszwiebeln, garniert mit Sesam.',
          price: 8.50,
          image: 'assets/images/koyotepop.png'),
      RappiProduct(
          name: 'Edamame',
          description: 'Edamame with Korean chili salt.',
          price: 7.50,
          image: 'assets/images/edamame.png'),
      RappiProduct(
          name: 'Late Sunset',
          description:
              'Korean Fried Chicken, Dirty Cheese Sauce & Artisan Sauce.',
          price: 14.50,
          image: 'assets/images/latesunset.png'),
    ],
  ),
  RappiCategory(
    name: 'Home Training',
    products: [
      RappiProduct(
          name: 'Rice',
          description: 'Portion.',
          price: 4.00,
          image: 'assets/images/rice.png'),
      RappiProduct(
          name: 'Cucumber Kimchi',
          description: 'Portion',
          price: 5.00,
          image: 'assets/images/cucumberkimchi.png'),
      RappiProduct(
          name: 'Cabbage Kimchi',
          description: 'Portion',
          price: 8.50,
          image: 'assets/images/cabbagekimchi.png'),
      RappiProduct(
          name: 'Fries',
          description: 'Fries mit Miss Miu Mayo.',
          price: 6.00,
          image: 'assets/images/fries.png'),
      RappiProduct(
          name: 'Carrot Kimchi',
          description: 'Portion',
          price: 14.50,
          image: 'assets/images/carrotkimchi.png'),
    ],
  ),

  //repeated items
  RappiCategory(
    name: 'Hotels',
    products: [
      RappiProduct(
          name: 'Silim Lights',
          description:
              'Beef-Bibimbap mit Reis, Bohnen, Spinat, Karotten, Shiitake-Pilzen, Sesamöl & Ei.',
          price: 26.50,
          image: 'assets/images/silimlights.png'),
      RappiProduct(
          name: 'Udo Island',
          description:
              'Koreanischer Glasnudelsalat mit Gemüse-Pickles, Melon Balls.',
          price: 11.50,
          image: 'assets/images/udoisland.png'),
      RappiProduct(
          name: 'Secret Japanese Pavillon',
          description:
              'Gimbap Korean Sushi Selection mit Bulgogi-Beef, Kimchi & Mango sowie Beef- Tatar, 12 Stück',
          price: 28.50,
          image: 'assets/images/secretjapanesepavillon.png'),
      RappiProduct(
          name: 'Hanok Stay',
          description:
              'Mazemen mit Bulgogi-Beef, Ramen, Ei, Sojasprossen & Frühlingszwiebeln.',
          price: 20.50,
          image: 'assets/images/hanokstay.png'),
      RappiProduct(
          name: 'Yunai Sky',
          description:
              'Bulgogi mit plant-based Beef dazu Reis, Sojasprossen, Frühlingszwiebeln, Kimchi, Salatblätter & Artisan Sauce',
          price: 29.50,
          image: 'assets/images/yunaisky.png'),
    ],
  ),
  RappiCategory(
    name: 'Picker For You 2',
    products: [
      RappiProduct(
          name: 'Sudogwon Millions',
          description:
              'Steamed bao-sandwiches with kimchi, pickled cucumber and mango cubes.',
          price: 26.50,
          image: 'assets/images/sudogwonmillions.png'),
      RappiProduct(
          name: 'Gentle Monster',
          description: 'Mandus mit Shrimps, 4 Stk.',
          price: 12.50,
          image: 'assets/images/gentlemonster.png'),
      RappiProduct(
          name: 'Unified Silla',
          description:
              'Natural planted fried Blumenkohl glasiert mit Gochujang',
          price: 11.50,
          image: 'assets/images/unifiedsilla.png'),
      RappiProduct(
          name: 'Nosan Night',
          description: 'Pikante koreanische Suppe mit Kimchi und Tofu',
          price: 7.50,
          image: 'assets/images/nosannight.png'),
      RappiProduct(
          name: 'Wings of Incheon',
          description: 'Micro-Greens & gerösteten Erbsen, 4 Stk.',
          price: 29.50,
          image: 'assets/images/wingsofincheon.png'),
    ],
  ),
  RappiCategory(
    name: 'Lost Pets',
    products: [
      RappiProduct(
          name: 'Haeundae Surf',
          description:
              'Chicken-Bibimbap mit Reis, Bohnen, Spinat, Karotten, Shiitake- Pilzen, Sesamöl, gerösteten Zwiebeln & Ei.',
          price: 23.50,
          image: 'assets/images/haeundaesurf.png'),
      RappiProduct(
          name: 'Gugudan O’Clock',
          description:
              'Ramen Soup mit Porkbelly & Chicken, homemade Brühe, Shiitake-Pilzen, & Frühlingszwiebeln.',
          price: 24.50,
          image: 'assets/images/gugudanoclock.png'),
      RappiProduct(
          name: 'Koyote Pop',
          description:
              'Marinierter, knuspriger Tofu & Frühlingszwiebeln, garniert mit Sesam.',
          price: 8.50,
          image: 'assets/images/koyotepop.png'),
      RappiProduct(
          name: 'Edamame',
          description: 'Edamame with Korean chili salt.',
          price: 7.50,
          image: 'assets/images/edamame.png'),
      RappiProduct(
          name: 'Late Sunset',
          description:
              'Korean Fried Chicken, Dirty Cheese Sauce & Artisan Sauce.',
          price: 14.50,
          image: 'assets/images/latesunset.png'),
    ],
  ),
  RappiCategory(
    name: 'Accessories',
    products: [
      RappiProduct(
          name: 'Rice',
          description: 'Portion.',
          price: 4.00,
          image: 'assets/images/rice.png'),
      RappiProduct(
          name: 'Cucumber Kimchi',
          description: 'Portion',
          price: 5.00,
          image: 'assets/images/cucumberkimchi.png'),
      RappiProduct(
          name: 'Cabbage Kimchi',
          description: 'Portion',
          price: 8.50,
          image: 'assets/images/cabbagekimchi.png'),
      RappiProduct(
          name: 'Fries',
          description: 'Fries mit Miss Miu Mayo.',
          price: 6.00,
          image: 'assets/images/fries.png'),
      RappiProduct(
          name: 'Carrot Kimchi',
          description: 'Portion',
          price: 14.50,
          image: 'assets/images/carrotkimchi.png'),
    ],
  ),
];
