part of 'generate_qr_cubit.dart';

@immutable
abstract class GenerateQrState {}

class GenerateQrInitial extends GenerateQrState {}
class GenerateQrSuccess extends GenerateQrState {}
class GenerateQrLoading extends GenerateQrState {}
class GenerateQrFailure extends GenerateQrState {}
