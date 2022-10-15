import 'package:mega_store/models/address_model.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/models/product_model.dart';

/// BANERS
List<String> banersData = [
  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
  'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
  'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80'
];

/// CATEGORY
List<CategoryModel> categoriesData = [
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: '123 Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: '456 Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: '789 Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      categoryName: 'First Category'),
  CategoryModel(
      image:
          'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
      categoryName: 'Second Category'),
  CategoryModel(
      image:
          'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
      categoryName: 'Third Category'),
  CategoryModel(
      image:
          'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
      categoryName: 'fourth Category'),
];

/// ITEMS
List<ProductModel> productsData = [
  ProductModel(
      id: 1,
      name: 'FS - Nike Air Max 270 React',
      image:
          'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
      price: 500,
      oldPrice: 800,
      discount: 20,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React  FS - Nike Air Max 270 ReactFS - Nike Air Max 270 React',
      imageList: [
        'https://www.sneakersnstuff.com/images/335981/card_xsmall.jpg',
        'https://images.vestiairecollective.com/cdn-cgi/image//produit/white-rubber-air-force-1-nike-x-off-white-trainers-https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,produit/24887967-1_3.jpg',
        'https://media.gq.com/photos/62fd35143f91baeb482811d2/master/w_1600%2Cc_limit/GQ0922_Nike_59.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
      ],
      rate: 4.5,
      review: [
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
      ]),
  ProductModel(
      id: 2,
      name:
          'FS - Nike Air Max 270 Reactssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
      image:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      price: 200,
      oldPrice: 800,
      discount: 0,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React  FS - Nike Air Max 270 ReactFS - Nike Air Max 270 React',
      imageList: [
        'https://www.sneakersnstuff.com/images/335981/card_xsmall.jpg',
        'https://images.vestiairecollective.com/cdn-cgi/image//produit/white-rubber-air-force-1-nike-x-off-white-trainers-https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,produit/24887967-1_3.jpg',
        'https://media.gq.com/photos/62fd35143f91baeb482811d2/master/w_1600%2Cc_limit/GQ0922_Nike_59.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
      ],
      rate: 4,
      review: [
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
      ]),
  ProductModel(
    id: 3,
    name: 'FS - Nike Air Max 270 React',
    image:
        'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
    price: 500,
    oldPrice: 800,
    discount: 20,
    isFavourite: false,
    inCart: false,
    quantity: 0,
    details:
        'FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React  FS - Nike Air Max 270 ReactFS - Nike Air Max 270 React',
    imageList: [
      'https://www.sneakersnstuff.com/images/335981/card_xsmall.jpg',
      'https://images.vestiairecollective.com/cdn-cgi/image//produit/white-rubber-air-force-1-nike-x-off-white-trainers-https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,produit/24887967-1_3.jpg',
      'https://media.gq.com/photos/62fd35143f91baeb482811d2/master/w_1600%2Cc_limit/GQ0922_Nike_59.jpg',
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
    ],
    rate: 4,
    review: [
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
    ],
  ),
  ProductModel(
    id: 4,
    name: 'FS - Nike Air Max 270 React',
    image:
        'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
    price: 500,
    oldPrice: 800,
    discount: 0,
    isFavourite: false,
    inCart: false,
    quantity: 0,
    details:
        'FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React  FS - Nike Air Max 270 ReactFS - Nike Air Max 270 React',
    imageList: [
      'https://www.sneakersnstuff.com/images/335981/card_xsmall.jpg',
      'https://images.vestiairecollective.com/cdn-cgi/image//produit/white-rubber-air-force-1-nike-x-off-white-trainers-https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,produit/24887967-1_3.jpg',
      'https://media.gq.com/photos/62fd35143f91baeb482811d2/master/w_1600%2Cc_limit/GQ0922_Nike_59.jpg',
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
    ],
    rate: 4,
    review: [
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
      Review(
        name: 'ahmed mohamed',
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        rate: 3,
        review: 'MY Review MY Review MY Review  MY Review MY Review MY Review',
        date: 'December 15, 2022',
      ),
    ],
  ),
  ProductModel(
      id: 5,
      name: 'FS - Nike Air Max 270 React',
      image:
          'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg',
      price: 500,
      oldPrice: 800,
      discount: 20,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React FS - Nike Air Max 270 React  FS - Nike Air Max 270 ReactFS - Nike Air Max 270 React',
      imageList: [
        'https://www.sneakersnstuff.com/images/335981/card_xsmall.jpg',
        'https://images.vestiairecollective.com/cdn-cgi/image//produit/white-rubber-air-force-1-nike-x-off-white-trainers-https://images.vestiairecollective.com/cdn-cgi/image/q=80,f=auto,produit/24887967-1_3.jpg',
        'https://media.gq.com/photos/62fd35143f91baeb482811d2/master/w_1600%2Cc_limit/GQ0922_Nike_59.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
      ],
      rate: 4,
      review: [
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
        Review(
          name: 'ahmed mohamed',
          image:
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80',
          rate: 3,
          review:
              'MY Review MY Review MY Review  MY Review MY Review MY Review',
          date: 'December 15, 2022',
        ),
      ]),
];

// ADDRESSES
List<AddressModel> addressesData = [
  AddressModel(
      title: 'mahmoud',
      details:
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      phone: '+201234567899'),
  AddressModel(
      title: 'Ibraaahim',
      details:
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      phone: '+201234567899'),
  AddressModel(
      title: 'ahmed',
      details:
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      phone: '+201234567899'),
];
