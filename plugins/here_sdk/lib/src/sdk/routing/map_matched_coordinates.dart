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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Information about the user defined coordinates and where they match to the map.

class MapMatchedCoordinates {
  /// The user defined geographic coordinates.
  GeoCoordinates originalCoordinates;

  /// Map-matched geographic coordinates.
  GeoCoordinates matchedCoordinates;


  MapMatchedCoordinates(this.originalCoordinates, this.matchedCoordinates);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapMatchedCoordinates) return false;
    MapMatchedCoordinates _other = other;
    return originalCoordinates == _other.originalCoordinates &&
        matchedCoordinates == _other.matchedCoordinates;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + originalCoordinates.hashCode;
    result = 31 * result + matchedCoordinates.hashCode;
    return result;
  }
}


// MapMatchedCoordinates "private" section, not exported.

final _sdk_routing_MapMatchedCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_create_handle'));
final _sdk_routing_MapMatchedCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_release_handle'));
final _sdk_routing_MapMatchedCoordinates_get_field_originalCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_field_originalCoordinates'));
final _sdk_routing_MapMatchedCoordinates_get_field_matchedCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_field_matchedCoordinates'));

Pointer<Void> sdk_routing_MapMatchedCoordinates_toFfi(MapMatchedCoordinates value) {
  final _originalCoordinates_handle = sdk_core_GeoCoordinates_toFfi(value.originalCoordinates);
  final _matchedCoordinates_handle = sdk_core_GeoCoordinates_toFfi(value.matchedCoordinates);
  final _result = _sdk_routing_MapMatchedCoordinates_create_handle(_originalCoordinates_handle, _matchedCoordinates_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_originalCoordinates_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_matchedCoordinates_handle);
  return _result;
}

MapMatchedCoordinates sdk_routing_MapMatchedCoordinates_fromFfi(Pointer<Void> handle) {
  final _originalCoordinates_handle = _sdk_routing_MapMatchedCoordinates_get_field_originalCoordinates(handle);
  final _matchedCoordinates_handle = _sdk_routing_MapMatchedCoordinates_get_field_matchedCoordinates(handle);
  try {
    return MapMatchedCoordinates(
      sdk_core_GeoCoordinates_fromFfi(_originalCoordinates_handle), 
    
      sdk_core_GeoCoordinates_fromFfi(_matchedCoordinates_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_originalCoordinates_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_matchedCoordinates_handle);
  }
}

void sdk_routing_MapMatchedCoordinates_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_MapMatchedCoordinates_release_handle(handle);

// Nullable MapMatchedCoordinates

final _sdk_routing_MapMatchedCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_create_handle_nullable'));
final _sdk_routing_MapMatchedCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_release_handle_nullable'));
final _sdk_routing_MapMatchedCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_value_nullable'));

Pointer<Void> sdk_routing_MapMatchedCoordinates_toFfi_nullable(MapMatchedCoordinates value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_MapMatchedCoordinates_toFfi(value);
  final result = _sdk_routing_MapMatchedCoordinates_create_handle_nullable(_handle);
  sdk_routing_MapMatchedCoordinates_releaseFfiHandle(_handle);
  return result;
}

MapMatchedCoordinates sdk_routing_MapMatchedCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_MapMatchedCoordinates_get_value_nullable(handle);
  final result = sdk_routing_MapMatchedCoordinates_fromFfi(_handle);
  sdk_routing_MapMatchedCoordinates_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_MapMatchedCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_MapMatchedCoordinates_release_handle_nullable(handle);

// End of MapMatchedCoordinates "private" section.

