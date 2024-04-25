class Category {
  final String id;
  final String name;
  final int? defaultBudget;
  final String color;
  final String userId;
  final bool isDeleted;
  final DateTime? modifiedDate;
  final DateTime createdDate;

  Category({
    required this.id,
    required this.name,
    this.defaultBudget,
    required this.color,
    required this.userId,
    required this.isDeleted,
    required this.createdDate,
    this.modifiedDate,
  });
}
