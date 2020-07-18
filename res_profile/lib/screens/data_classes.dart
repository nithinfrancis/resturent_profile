import 'dart:core';

class Restaurant {
  int id;
  String name;
  String description;
  int rating;
  int numberOfReviews;
  int distanceInMinute;
  String deliveryTpe;
  String resImageWide;
  String resImageProfile;
  List<Category> category;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.rating,
    this.numberOfReviews,
    this.distanceInMinute,
    this.deliveryTpe,
    this.resImageWide,
    this.resImageProfile,
    this.category,
  });
}

class Category {
  int categoryId;
  String categoryName;
  List<Dish> dishList;

  Category({this.categoryId, this.categoryName, this.dishList});
}

class Dish {
  int dishId;
  String dishName;
  String dishDescription;
  String dishImage;
  String amount;

  Dish({this.dishId, this.dishName, this.dishDescription, this.amount, this.dishImage});
}

final _tempDish1 = Dish(dishId: 1, amount: "KD 2.350", dishDescription: "4pcs Chicken+Fries+ Cola and drink 23 in 2 litrews etc n", dishImage: "http://restaurants.unicomerp.net//images/Restaurant/1010000001/Item/Items/100000001.jpg", dishName: "Super Dinner na 1 line");

final List<Dish> featuredList = [_tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1];
final List<Dish> topSellingList = [_tempDish1, _tempDish1];
final List<Dish> allList = [_tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1];
final List<Dish> forOneList = [_tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1];
final List<Dish> forSharingList = [_tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1, _tempDish1];

final Category featured = Category(categoryId: 1, categoryName: "Featured", dishList: featuredList);
final Category topSelling = Category(categoryId: 2, categoryName: "Top selling", dishList: topSellingList);
final Category all = Category(categoryId: 3, categoryName: "All", dishList: allList);
final Category forOne = Category(categoryId: 4, categoryName: "For One", dishList: forOneList);
final Category forSharing = Category(categoryId: 5, categoryName: "For Sharing", dishList: forSharingList);

final Restaurant restaurant = Restaurant(
    id: 1,
    name: "KFC Salmiya KFC Salmiya block 12",
    description: "American Sandwiches,burgers",
    resImageProfile: "http://restaurants.unicomerp.net/images/Restaurant/1010000001.jpg",
    resImageWide: "http://restaurants.unicomerp.net/images/Restaurant/1010000001.jpg",
    rating: 4,
    numberOfReviews: 2,
    distanceInMinute: 30,
    deliveryTpe: "1,000 KWD delivery",
    category: [featured, topSelling, all, forOne, forSharing]);
