import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/models/address_model.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/modules/Home/Home%20Screens/account_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/favourite_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/home_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/offer_screen.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/static%20data/static_data.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  /// NAV BAR
  int currentIndex = 0;
  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarIndex());
  }

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
        ),
        label: 'account'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer_outlined,
        ),
        label: 'offer'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border_outlined,
        ),
        label: 'favourite')
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const AccountScreen(),
    const OfferScreen(),
    const FavouriteScreen(),
  ];

  /// BANNERS
  List<String> baners = banersData;

  /// CATEGORY
  List<CategoryModel> categories = categoriesData;

  /// ITEMS
  List<ProductModel> products = productsData;

  /// ADDRESSES
  List<AddressModel> addresses = addressesData;

  int current = 0;
  final CarouselController controller = CarouselController();

  void changeIndicator(int index) {
    current = index;
    emit(ChangeCarousalIndicator());
  }

  double currenRate = 1;
  void changeRate(double rate) {
    currenRate = rate;
    emit(ChangeRateState());
  }

  /// Searched List
  List<ProductModel> searchedProducts = [];
  TextEditingController searchController = TextEditingController();
  Future searchProduct(String text) async {
    final suggestions = products.where((product) {
      final productName = product.name.toLowerCase();
      final input = text.toLowerCase();
      return productName.contains(input);
    }).toList();
    searchedProducts = suggestions;
    emit(ChangeSearchState());
  }

  // FAVOURITE
  List<ProductModel> favouriteList = [];

  void changeFavourite(bool isFavourite, ProductModel product) {
    if (!isFavourite) {
      product.isFavourite = true;
      favouriteList.add(product);
      showToast(text: 'Added to Favourite', color: Colors.green);
      debugPrint('add' '$favouriteList');
      emit(ChangeFavourite());
    } else {
      if (isFavourite) {
        product.isFavourite = false;
        favouriteList.remove(product);
        showToast(text: 'Removed from Favourite', color: Colors.red);
        debugPrint('remove' '$favouriteList');
        emit(ChangeFavourite());
      }
    }
  }

  // CART

  /* 
  else {
      if (inCart) {
        product.inCart = false;
        inCartList.remove(product);
        showToast(text: 'Removed from Your Cart', color: Colors.red);
        print('remove' '$inCartList');
        emit(ChangeInCart());
      }
    }
  */

  List<ProductModel> inCartList = [];

  Future addtoCart(bool inCart, ProductModel product) async {
    if (!inCart) {
      product.inCart = true;
      inCartList.add(product);
      product.quantity = 1;
      showToast(text: 'Added to Your cart', color: Colors.green);
      debugPrint('add' '$inCartList');
      emit(ChangeInCart());
    }
  }

  void removeFromCart(bool inCart, ProductModel product) {
    if (inCart) {
      product.inCart = false;
      inCartList.remove(product);
      product.quantity = 0;
      showToast(text: 'Removed from Your Cart', color: Colors.red);
      debugPrint('remove' '$inCartList');
      emit(ChangeInCart());
    }
  }

  // CALCULATE PRICE

  Map<int, dynamic> finalPriceMap = {};
  dynamic finalPrice;

  void changequantity(bool add, ProductModel product) {
    if (add) {
      product.quantity++;
      getFinalPrice(product);
      emit(ChangePriceState());
    } else {
      if (product.quantity > 1) {
        product.quantity--;
        getFinalPrice(product);
        emit(ChangePriceState());
      } else {
        product.quantity;
        getFinalPrice(product);
        emit(ChangePriceState());
      }
    }
  }

  void getFinalPrice(ProductModel product) {
    finalPriceMap.addAll({product.id: product.price * product.quantity});
    finalPrice =
        finalPriceMap.values.reduce((value, element) => value + element);
  }

  //Ship To
  int currentShipToIndex = 0;
  void changeShipTocurrenIndex(int index) {
    currentShipToIndex = index;
    emit(ChangeShipToIndexState());
  }

  // CHOOSELANG
  String selectedlanguage = 'English';
  void chooseLang(String value) {
    selectedlanguage = value;
    emit(ChooseLanguageState());
  }
}
