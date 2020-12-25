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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/routing/isoline_range_type.dart';
import 'package:here_sdk/src/sdk/routing/map_matched_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents an isoline polygon around a center point.
///
/// Any possible route between
/// the center and any point on the edges of the polygon can be travelled within the
/// given range restriction. The edges of the polygon are not guaranteed to be on the road as
/// all reachable road endpoints are smoothened to fit into one polygon shape. This
/// process can be influenced by setting [IsolineOptionsCalculation.maxPoints].
abstract class Isoline {
  /// Constructs an isoline instance.
  ///
  /// This instance is provided by the
  /// [CalculateIsolineCallback].
  /// [rangeType] Specifies the range type of the provided [Isoline.make.rangeValue] list.
  /// [rangeValue] A list of range values. At least one value must be set.
  /// [center] The center of the isoline.
  /// [polygons] A list of polygons that belong to this isoline. At least one value must be set.
  factory Isoline(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) => Isoline$Impl.make(rangeType, rangeValue, center, polygons);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets the type of the restriction that was used to calculate this isoline.
  IsolineRangeType get rangeType;





  /// Gets the numerical value of the restriction that was used to calculate this isoline.
  double get rangeValue;





  /// Gets the center point that was used to calculate this isoline.
  /// This includes the original center that was passed to the RoutingEngine.
  MapMatchedCoordinates get center;





  /// Gets a list of polygons that belong to this isoline. An isoline can consist of multiple
  /// polygons. For example, islands that can be reached by a ferry are included.
  /// Each island is then represented as a separate polygon. However, in most cases
  /// only a single polygone is included.
  List<GeoPolygon> get polygons;



}


// Isoline "private" section, not exported.

final _sdk_routing_Isoline_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Isoline_copy_handle'));
final _sdk_routing_Isoline_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Isoline_release_handle'));
final _sdk_routing_Isoline_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_routing_Isoline_get_raw_pointer'));


class Isoline$Impl implements Isoline {
  @protected
  Pointer<Void> handle;

  Isoline$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_routing_Isoline_get_raw_pointer(handle));
    _sdk_routing_Isoline_release_handle(handle);
    handle = null;
  }


  Isoline$Impl.make(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) : handle = _make(rangeType, rangeValue, center, polygons) {
    __lib.reverseCache[_sdk_routing_Isoline_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _make(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Double, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, int, double, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_Isoline_make__IsolineRangeType_Double_MapMatchedCoordinates_ListOf_1sdk_1core_1GeoPolygon'));
    final _rangeType_handle = sdk_routing_IsolineRangeType_toFfi(rangeType);
    final _rangeValue_handle = (rangeValue);
    final _center_handle = sdk_routing_MapMatchedCoordinates_toFfi(center);
    final _polygons_handle = heresdk_routing_isoline_bindings_ListOf_sdk_core_GeoPolygon_toFfi(polygons);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _rangeType_handle, _rangeValue_handle, _center_handle, _polygons_handle);
    sdk_routing_IsolineRangeType_releaseFfiHandle(_rangeType_handle);
    (_rangeValue_handle);
    sdk_routing_MapMatchedCoordinates_releaseFfiHandle(_center_handle);
    heresdk_routing_isoline_bindings_ListOf_sdk_core_GeoPolygon_releaseFfiHandle(_polygons_handle);
    return __result_handle;
  }

  @override
  IsolineRangeType get rangeType {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_rangeType_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IsolineRangeType_fromFfi(__result_handle);
    } finally {
      sdk_routing_IsolineRangeType_releaseFfiHandle(__result_handle);
    }
  }


  @override
  double get rangeValue {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_rangeValue_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  MapMatchedCoordinates get center {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_center_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_MapMatchedCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_routing_MapMatchedCoordinates_releaseFfiHandle(__result_handle);
    }
  }


  @override
  List<GeoPolygon> get polygons {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_polygons_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_routing_isoline_bindings_ListOf_sdk_core_GeoPolygon_fromFfi(__result_handle);
    } finally {
      heresdk_routing_isoline_bindings_ListOf_sdk_core_GeoPolygon_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_routing_Isoline_toFfi(Isoline value) =>
  _sdk_routing_Isoline_copy_handle((value as Isoline$Impl).handle);

Isoline sdk_routing_Isoline_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_routing_Isoline_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is Isoline) return instance as Isoline;

  final _copied_handle = _sdk_routing_Isoline_copy_handle(handle);
  final result = Isoline$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_routing_Isoline_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_Isoline_release_handle(handle);

Pointer<Void> sdk_routing_Isoline_toFfi_nullable(Isoline value) =>
  value != null ? sdk_routing_Isoline_toFfi(value) : Pointer<Void>.fromAddress(0);

Isoline sdk_routing_Isoline_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_Isoline_fromFfi(handle) : null;

void sdk_routing_Isoline_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Isoline_release_handle(handle);

// End of Isoline "private" section.

