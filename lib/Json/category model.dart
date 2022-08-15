class CategoryModel {
  String? banner;
  String? name;
  String? sub_categories;
  String? icon  ;
  int? number_of_children ;

  CategoryModel(this.banner, this.name, this.sub_categories, this.icon,
      this.number_of_children);
}

class Links{
  String? products;
  String? sub_categories;
}