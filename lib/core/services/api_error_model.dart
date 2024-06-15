import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String errMsg;
  const Failure({
    this.errMsg = '',
  });

  @override
  List<Object> get props => [errMsg];

  @override
  String toString() => 'Failure(errMsg: $errMsg)';
}
