part of 'generate_qr_cubit.dart';

abstract class GenerateQrState {}

class GenerateQrInitial extends GenerateQrState {}

class GenerateQrSuccess extends GenerateQrState {
  final String qrCode;

  GenerateQrSuccess({required this.qrCode});
}

class GenerateQrLoading extends GenerateQrState {}

class GenerateQrFailure extends GenerateQrState {
  final String errMessage;

  GenerateQrFailure({required this.errMessage});
}

//------------------------------------------------------
