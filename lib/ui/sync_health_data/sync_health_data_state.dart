part of 'sync_health_data_cubit.dart';

class SyncHealthDataState extends Equatable {
  final LoadStatus sendHealthDataToServerStatus;
  final LoadStatus syncHealthDataStatus;
  final String message;
  final SyncStateEnum syncStateEnum;

  SyncHealthDataState({
    this.message,
    this.syncStateEnum,
    this.sendHealthDataToServerStatus = LoadStatus.INITIAL,
    this.syncHealthDataStatus = LoadStatus.INITIAL,
  });

  SyncHealthDataState copyWith({
    LoadStatus sendHealthDataToServerStatus,
    LoadStatus syncHealthDataStatus,
    String message,
    SyncStateEnum syncStateEnum,
  }) {
    return SyncHealthDataState(
      sendHealthDataToServerStatus:
          sendHealthDataToServerStatus ?? this.sendHealthDataToServerStatus,
      syncHealthDataStatus: syncHealthDataStatus ?? this.syncHealthDataStatus,
      message: message ?? this.message,
      syncStateEnum: syncStateEnum ?? this.syncStateEnum,
    );
  }

  @override
  List<Object> get props => [
        this.sendHealthDataToServerStatus,
        this.syncHealthDataStatus,
        this.message,
        this.syncStateEnum,
      ];
}
