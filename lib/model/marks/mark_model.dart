import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

@HiveType(typeId :4)
class Markmodel{
  @HiveField(0)
  final String subject1;
  @HiveField(1)
  final String subject2;
  @HiveField(2)
  final String subject3;
  @HiveField(3)
  final String subject4;
  @HiveField(4)
  final String subject5;
  @HiveField(5)
  final String subject6;

  Markmodel({
    required this.subject1,
    required this.subject2,
    required this.subject3,
    required this.subject4,
    required this.subject5,
    required this.subject6
  });
}
