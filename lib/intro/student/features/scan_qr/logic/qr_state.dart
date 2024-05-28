part of 'qr_cubit.dart';

@freezed
class QrState with _$QrState {
  const factory QrState.initial() = _Initial;

  const factory QrState.scanComplete() = ScanComplete;

  const factory QrState.scanError() = ScanError;
}
