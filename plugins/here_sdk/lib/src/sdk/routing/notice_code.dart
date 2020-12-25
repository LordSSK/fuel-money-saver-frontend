// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Notice codes which point the issues encountered during processing of a route calculation request.
///
/// The notice codes are going to be extended for new error situations.
enum NoticeCode {
    /// No schedule information is available for a transit section.
    noSchedule,
    /// Violated avoid controlled-access highway preference.
    violatedAvoidControlledAccessHighway,
    /// Violated avoid toll road preference.
    violatedAvoidTollRoad,
    /// Violated avoid ferry preference.
    violatedAvoidFerry,
    /// Violated avoid tunnel preference.
    violatedAvoidTunnel,
    /// Violated avoid dirt road preference.
    violatedAvoidDirtRoad,
    /// Violated avoid rail ferry preference.
    violatedAvoidRailFerry,
    /// Violated avoid park preference.
    violatedAvoidPark,
    /// Route uses roads blocked by traffic events.
    violatedBlockedRoad,
    /// Start direction of the route is not as requested.
    violatedStartDirection,
    /// Violated carpool preference.
    violatedCarpool,
    /// Route uses a time-restricted turn.
    violatedTurnRestriction,
    /// Route uses roads or turns which are permanently forbidden for the given truck profile.
    violatedPermanentTruckRestriction,
    /// Route uses roads which are part of restricted routing zones
    violatedZoneRestriction,
    /// Violated avoid difficult turns preference.
    violatedAvoidDifficultTurns,
    /// Route uses a time-restricted road.
    violatedTimeDependentRestriction
}

// NoticeCode "private" section, not exported.

int sdk_routing_NoticeCode_toFfi(NoticeCode value) {
  switch (value) {
  case NoticeCode.noSchedule:
    return 0;
  break;
  case NoticeCode.violatedAvoidControlledAccessHighway:
    return 1;
  break;
  case NoticeCode.violatedAvoidTollRoad:
    return 2;
  break;
  case NoticeCode.violatedAvoidFerry:
    return 3;
  break;
  case NoticeCode.violatedAvoidTunnel:
    return 4;
  break;
  case NoticeCode.violatedAvoidDirtRoad:
    return 5;
  break;
  case NoticeCode.violatedAvoidRailFerry:
    return 6;
  break;
  case NoticeCode.violatedAvoidPark:
    return 7;
  break;
  case NoticeCode.violatedBlockedRoad:
    return 8;
  break;
  case NoticeCode.violatedStartDirection:
    return 9;
  break;
  case NoticeCode.violatedCarpool:
    return 10;
  break;
  case NoticeCode.violatedTurnRestriction:
    return 11;
  break;
  case NoticeCode.violatedPermanentTruckRestriction:
    return 12;
  break;
  case NoticeCode.violatedZoneRestriction:
    return 13;
  break;
  case NoticeCode.violatedAvoidDifficultTurns:
    return 14;
  break;
  case NoticeCode.violatedTimeDependentRestriction:
    return 15;
  break;
  default:
    throw StateError("Invalid enum value $value for NoticeCode enum.");
  }
}

NoticeCode sdk_routing_NoticeCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return NoticeCode.noSchedule;
  break;
  case 1:
    return NoticeCode.violatedAvoidControlledAccessHighway;
  break;
  case 2:
    return NoticeCode.violatedAvoidTollRoad;
  break;
  case 3:
    return NoticeCode.violatedAvoidFerry;
  break;
  case 4:
    return NoticeCode.violatedAvoidTunnel;
  break;
  case 5:
    return NoticeCode.violatedAvoidDirtRoad;
  break;
  case 6:
    return NoticeCode.violatedAvoidRailFerry;
  break;
  case 7:
    return NoticeCode.violatedAvoidPark;
  break;
  case 8:
    return NoticeCode.violatedBlockedRoad;
  break;
  case 9:
    return NoticeCode.violatedStartDirection;
  break;
  case 10:
    return NoticeCode.violatedCarpool;
  break;
  case 11:
    return NoticeCode.violatedTurnRestriction;
  break;
  case 12:
    return NoticeCode.violatedPermanentTruckRestriction;
  break;
  case 13:
    return NoticeCode.violatedZoneRestriction;
  break;
  case 14:
    return NoticeCode.violatedAvoidDifficultTurns;
  break;
  case 15:
    return NoticeCode.violatedTimeDependentRestriction;
  break;
  default:
    throw StateError("Invalid numeric value $handle for NoticeCode enum.");
  }
}

void sdk_routing_NoticeCode_releaseFfiHandle(int handle) {}

final _sdk_routing_NoticeCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_NoticeCode_create_handle_nullable'));
final _sdk_routing_NoticeCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeCode_release_handle_nullable'));
final _sdk_routing_NoticeCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeCode_get_value_nullable'));

Pointer<Void> sdk_routing_NoticeCode_toFfi_nullable(NoticeCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_NoticeCode_toFfi(value);
  final result = _sdk_routing_NoticeCode_create_handle_nullable(_handle);
  sdk_routing_NoticeCode_releaseFfiHandle(_handle);
  return result;
}

NoticeCode sdk_routing_NoticeCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_NoticeCode_get_value_nullable(handle);
  final result = sdk_routing_NoticeCode_fromFfi(_handle);
  sdk_routing_NoticeCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_NoticeCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_NoticeCode_release_handle_nullable(handle);

// End of NoticeCode "private" section.

