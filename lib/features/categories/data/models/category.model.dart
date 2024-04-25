import 'package:spendify/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    super.defaultBudget,
    required super.color,
    required super.userId,
    required super.isDeleted,
    required super.createdDate,
    super.modifiedDate,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      userId: map['userId'],
      isDeleted: map['isDeleted'],
      createdDate: map['createdDate'],
      modifiedDate: map['modifiedDate'],
      defaultBudget: map['defaultBudget'],
    );
  }
}
