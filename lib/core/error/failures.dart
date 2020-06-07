import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : _properties = properties;

  final List<dynamic> _properties;

  @override
  List<Object> get props => _properties;
}

//General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
