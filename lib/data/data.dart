import 'package:wallpaper/model/category_model.dart';

String apiKEY = "QZcLOvgXY3haKDdLVMCcTc5rsrFPSlu22SfBwcCELdR6sR5CirHFWPgf";

List<Categories_model> getcategories() {
  List<Categories_model> category = [];

  Categories_model categories = new Categories_model();
  categories.category = " Street Lights";
  categories.url =
      "https://images.pexels.com/photos/1595437/pexels-photo-1595437.jpeg";
  category.add(categories);
  categories = new Categories_model();

  categories.category = "Indian Food";
  categories.url =
      "https://images.pexels.com/photos/6363498/pexels-photo-6363498.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categories);
  categories = new Categories_model();

  categories.category = "Nature";
  categories.url =
      "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categories);
  categories = new Categories_model();

  categories.category = " Sports";
  categories.url =
      "https://images.pexels.com/photos/1192027/pexels-photo-1192027.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categories);
  categories = new Categories_model();

  categories.category = "Gym";
  categories.url =
      "https://images.pexels.com/photos/791763/pexels-photo-791763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categories);
  categories = new Categories_model();

  categories.category = "Reading";
  categories.url =
      "https://images.pexels.com/photos/3747468/pexels-photo-3747468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  category.add(categories);
  categories = new Categories_model();

  categories.category = "Fun";
  categories.url =
      "https://images.pexels.com/photos/1627935/pexels-photo-1627935.jpeg?auto=compress&cs=tinysrgb&w=1600";
  category.add(categories);
  categories = new Categories_model();
  return category;
}
