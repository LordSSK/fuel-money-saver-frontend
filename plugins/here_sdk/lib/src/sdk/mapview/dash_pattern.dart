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
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;



/// Represents a dash pattern for [MapPolyline].
@immutable
class DashPattern {
  /// Length of first gap in pixels.
  final double firstGapLength;

  /// Length of first dash in pixels.
  final double firstDashLength;


  const DashPattern._(this.firstGapLength, this.firstDashLength);
  DashPattern._copy(DashPattern _other) : this._(_other.firstGapLength, _other.firstDashLength);

  /// Creates a uniform dash pattern in which the length of a gap is the same
  /// as the length of a dash.
  ///
  /// This allows for patterns like ' ? ? ? ?' or '   ???   ???   ???'.
  /// [dashLength] The length of a dash in pixels. The gap will have the same length.
  /// Clamped to the range of \[1, 500\].
  DashPattern.uniform(double dashLength) : this._copy(_uniform(dashLength));

  /// Creates a simple dash pattern in which the lengths of a dash and gap can be different.
  ///
  /// This allows for patterns like '  ?  ?  ?  ?' or ' ??? ??? ???'.
  /// [gapLength] The length of a gap in pixels. Clamped to the range of \[1, 500\].
  /// [dashLength] The length of a dash in pixels. Clamped to the range of \[1, 500\].
  DashPattern(double gapLength, double dashLength) : this._copy(_$init(gapLength, dashLength));

  /// Creates a uniform dash pattern in which the length of a gap is the same
  /// as the length of a dash.
  ///
  /// This allows for patterns like ' ? ? ? ?' or '   ???   ???   ???'.
  /// [dashLength] The length of a dash in pixels. The gap will have the same length.
  /// Clamped to the range of \[1, 500\].
  static DashPattern _uniform(double dashLength) {
    final _uniform_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_mapview_DashPattern_make__Double'));
    final _dashLength_handle = (dashLength);
    final __result_handle = _uniform_ffi(__lib.LibraryContext.isolateId, _dashLength_handle);
    (_dashLength_handle);
    try {
      return sdk_mapview_DashPattern_fromFfi(__result_handle);
    } finally {
      sdk_mapview_DashPattern_releaseFfiHandle(__result_handle);
    }
  }

  /// Creates a simple dash pattern in which the lengths of a dash and gap can be different.
  ///
  /// This allows for patterns like '  ?  ?  ?  ?' or ' ??? ??? ???'.
  /// [gapLength] The length of a gap in pixels. Clamped to the range of \[1, 500\].
  /// [dashLength] The length of a dash in pixels. Clamped to the range of \[1, 500\].
  static DashPattern _$init(double gapLength, double dashLength) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_mapview_DashPattern_make__Double_Double'));
    final _gapLength_handle = (gapLength);
    final _dashLength_handle = (dashLength);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _gapLength_handle, _dashLength_handle);
    (_gapLength_handle);
    (_dashLength_handle);
    try {
      return sdk_mapview_DashPattern_fromFfi(__result_handle);
    } finally {
      sdk_mapview_DashPattern_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DashPattern) return false;
    DashPattern _other = other;
    return firstGapLength == _other.firstGapLength &&
        firstDashLength == _other.firstDashLength;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + firstGapLength.hashCode;
    result = 31 * result + firstDashLength.hashCode;
    return result;
  }
}


// DashPattern "private" section, not exported.

final _sdk_mapview_DashPattern_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_mapview_DashPattern_create_handle'));
final _sdk_mapview_DashPattern_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_release_handle'));
final _sdk_mapview_DashPattern_get_field_firstGapLength = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_field_firstGapLength'));
final _sdk_mapview_DashPattern_get_field_firstDashLength = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_field_firstDashLength'));

Pointer<Void> sdk_mapview_DashPattern_toFfi(DashPattern value) {
  final _firstGapLength_handle = (value.firstGapLength);
  final _firstDashLength_handle = (value.firstDashLength);
  final _result = _sdk_mapview_DashPattern_create_handle(_firstGapLength_handle, _firstDashLength_handle);
  (_firstGapLength_handle);
  (_firstDashLength_handle);
  return _result;
}

DashPattern sdk_mapview_DashPattern_fromFfi(Pointer<Void> handle) {
  final _firstGapLength_handle = _sdk_mapview_DashPattern_get_field_firstGapLength(handle);
  final _firstDashLength_handle = _sdk_mapview_DashPattern_get_field_firstDashLength(handle);
  try {
    return DashPattern._(
      (_firstGapLength_handle), 
    
      (_firstDashLength_handle)
    );
  } finally {
    (_firstGapLength_handle);
    (_firstDashLength_handle);
  }
}

void sdk_mapview_DashPattern_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_DashPattern_release_handle(handle);

// Nullable DashPattern

final _sdk_mapview_DashPattern_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_create_handle_nullable'));
final _sdk_mapview_DashPattern_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_release_handle_nullable'));
final _sdk_mapview_DashPattern_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_value_nullable'));

Pointer<Void> sdk_mapview_DashPattern_toFfi_nullable(DashPattern value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_DashPattern_toFfi(value);
  final result = _sdk_mapview_DashPattern_create_handle_nullable(_handle);
  sdk_mapview_DashPattern_releaseFfiHandle(_handle);
  return result;
}

DashPattern sdk_mapview_DashPattern_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_DashPattern_get_value_nullable(handle);
  final result = sdk_mapview_DashPattern_fromFfi(_handle);
  sdk_mapview_DashPattern_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_DashPattern_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_DashPattern_release_handle_nullable(handle);

// End of DashPattern "private" section.

