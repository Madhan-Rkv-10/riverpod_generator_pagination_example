import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod/riverpod.dart';

final operatorsRepositoryProvider = Provider((ref) => OperatorsRepository());

class OperatorsRepository {
  Future<Either<String, List<User>>> fetchUsers({
    required int offset,
    required int pageSize,
  }) async {
    try {
      // Simulate a network delay
      await Future.delayed(const Duration(seconds: 1));

      // Generate mock user data
      final users = List.generate(
        pageSize,
        (index) => User(
          id: 'user_${offset + index}',
          name: 'User ${offset + index}',
          age: 20 + (offset + index),
        ),
      );

      return Right(users);
    } catch (error) {
      return Left('Failed to fetch users');
    }
  }
}

class User {
  final String id;
  final String name;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.age,
  });
}
