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

import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/isoline_calculation_mode.dart';
import 'package:here_sdk/src/sdk/routing/isoline_range_type.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;





/// Specifies options for isolines calculation.

class IsolineOptions {
  /// Specifies isoline parameters.
  IsolineOptionsCalculation calculationOptions;

  /// Specifies options for calculation of isolines for car.
  /// Mutually exclusive with truck_options, ev_car_options and ev_truck_options.
  CarOptions carOptions;

  /// Specifies options for calculation of isolines for truck.
  /// Mutually exclusive with car_options, ev_car_options and ev_truck_options.
  TruckOptions truckOptions;

  /// Specifies options for calculation of isolines for electric car.
  /// Mutually exclusive with car_options, truck and ev_truck_options.
  EVCarOptions evCarOptions;

  /// Specifies options for calculation of isolines for electric truck.
  /// Mutually exclusive with car_options, truck_options and ev_car_options.
  EVTruckOptions evTruckOptions;


  IsolineOptions._(this.calculationOptions, this.carOptions, this.truckOptions, this.evCarOptions, this.evTruckOptions);
  IsolineOptions._copy(IsolineOptions _other) : this._(_other.calculationOptions, _other.carOptions, _other.truckOptions, _other.evCarOptions, _other.evTruckOptions);

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and car routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [carOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  IsolineOptions.withCarOptions(IsolineOptionsCalculation calculationOptions, CarOptions carOptions) : this._copy(_withCarOptions(calculationOptions, carOptions));

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and truck routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [truckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  IsolineOptions.withTruckOptions(IsolineOptionsCalculation calculationOptions, TruckOptions truckOptions) : this._copy(_withTruckOptions(calculationOptions, truckOptions));

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric car routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [evCarOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  IsolineOptions.withEVCarOptions(IsolineOptionsCalculation calculationOptions, EVCarOptions evCarOptions) : this._copy(_withEVCarOptions(calculationOptions, evCarOptions));

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric truck routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [evTruckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  IsolineOptions.withEVTruckOptions(IsolineOptionsCalculation calculationOptions, EVTruckOptions evTruckOptions) : this._copy(_withEVTruckOptions(calculationOptions, evTruckOptions));

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and car routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [carOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  static IsolineOptions _withCarOptions(IsolineOptionsCalculation calculationOptions, CarOptions carOptions) {
    final _withCarOptions_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_CarOptions'));
    final _calculationOptions_handle = sdk_routing_IsolineOptions_Calculation_toFfi(calculationOptions);
    final _carOptions_handle = sdk_routing_CarOptions_toFfi(carOptions);
    final __result_handle = _withCarOptions_ffi(__lib.LibraryContext.isolateId, _calculationOptions_handle, _carOptions_handle);
    sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
    sdk_routing_CarOptions_releaseFfiHandle(_carOptions_handle);
    try {
      return sdk_routing_IsolineOptions_fromFfi(__result_handle);
    } finally {
      sdk_routing_IsolineOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and truck routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [truckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  static IsolineOptions _withTruckOptions(IsolineOptionsCalculation calculationOptions, TruckOptions truckOptions) {
    final _withTruckOptions_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_TruckOptions'));
    final _calculationOptions_handle = sdk_routing_IsolineOptions_Calculation_toFfi(calculationOptions);
    final _truckOptions_handle = sdk_routing_TruckOptions_toFfi(truckOptions);
    final __result_handle = _withTruckOptions_ffi(__lib.LibraryContext.isolateId, _calculationOptions_handle, _truckOptions_handle);
    sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
    sdk_routing_TruckOptions_releaseFfiHandle(_truckOptions_handle);
    try {
      return sdk_routing_IsolineOptions_fromFfi(__result_handle);
    } finally {
      sdk_routing_IsolineOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric car routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [evCarOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  static IsolineOptions _withEVCarOptions(IsolineOptionsCalculation calculationOptions, EVCarOptions evCarOptions) {
    final _withEVCarOptions_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_EVCarOptions'));
    final _calculationOptions_handle = sdk_routing_IsolineOptions_Calculation_toFfi(calculationOptions);
    final _evCarOptions_handle = sdk_routing_EVCarOptions_toFfi(evCarOptions);
    final __result_handle = _withEVCarOptions_ffi(__lib.LibraryContext.isolateId, _calculationOptions_handle, _evCarOptions_handle);
    sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
    sdk_routing_EVCarOptions_releaseFfiHandle(_evCarOptions_handle);
    try {
      return sdk_routing_IsolineOptions_fromFfi(__result_handle);
    } finally {
      sdk_routing_IsolineOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric truck routing options.
  /// [calculationOptions] The options to be used to calculate this isoline.
  /// [evTruckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  static IsolineOptions _withEVTruckOptions(IsolineOptionsCalculation calculationOptions, EVTruckOptions evTruckOptions) {
    final _withEVTruckOptions_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_EVTruckOptions'));
    final _calculationOptions_handle = sdk_routing_IsolineOptions_Calculation_toFfi(calculationOptions);
    final _evTruckOptions_handle = sdk_routing_EVTruckOptions_toFfi(evTruckOptions);
    final __result_handle = _withEVTruckOptions_ffi(__lib.LibraryContext.isolateId, _calculationOptions_handle, _evTruckOptions_handle);
    sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
    sdk_routing_EVTruckOptions_releaseFfiHandle(_evTruckOptions_handle);
    try {
      return sdk_routing_IsolineOptions_fromFfi(__result_handle);
    } finally {
      sdk_routing_IsolineOptions_releaseFfiHandle(__result_handle);
    }
  }

}

/// Specifies isoline parameters.
///
/// Setting at least one limit to [IsolineOptionsCalculation.rangeValues] is mandatory or the calculation will fail.

class IsolineOptionsCalculation {
  /// Specifies the range of values to be included in the isoline.
  IsolineRangeType rangeType;

  /// A list of ranges. The unit is defined by the type parameter.
  /// Each range defines the maximum allowed value to reach a destination.
  /// For each value an [Isoline] is calculated indicating the reachable area.
  List<int> rangeValues;

  /// Specifies how isoline calculation is optimized.
  /// The default waypoint type is [IsolineCalculationMode.balanced].
  IsolineCalculationMode isolineCalculationMode;

  /// Limits the number of points in the resulting isoline polygon. If the
  /// isoline consists of multiple polygons, the sum of points from all
  /// polygons is considered. Note that this parameter does not affect the calculation,
  /// but the shape of the polygon. Look at [IsolineCalculationMode] parameter
  /// to optimize performance.
  /// A higher value will result in a more accurate polygon shape. Rendering a polygon
  /// with a high number of points can negatively impact rendering performance.
  /// The minimum allowed value is 30, lower values will be ignored.
  int maxPoints;


  IsolineOptionsCalculation(this.rangeType, this.rangeValues, this.isolineCalculationMode, this.maxPoints);

  IsolineOptionsCalculation.withDefaults(IsolineRangeType rangeType)
    : rangeType = rangeType, rangeValues = [], isolineCalculationMode = IsolineCalculationMode.balanced, maxPoints = null;

}


// IsolineOptionsCalculation "private" section, not exported.

final _sdk_routing_IsolineOptions_Calculation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_create_handle'));
final _sdk_routing_IsolineOptions_Calculation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_release_handle'));
final _sdk_routing_IsolineOptions_Calculation_get_field_rangeType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_rangeType'));
final _sdk_routing_IsolineOptions_Calculation_get_field_rangeValues = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_rangeValues'));
final _sdk_routing_IsolineOptions_Calculation_get_field_isolineCalculationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_isolineCalculationMode'));
final _sdk_routing_IsolineOptions_Calculation_get_field_maxPoints = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_maxPoints'));

Pointer<Void> sdk_routing_IsolineOptions_Calculation_toFfi(IsolineOptionsCalculation value) {
  final _rangeType_handle = sdk_routing_IsolineRangeType_toFfi(value.rangeType);
  final _rangeValues_handle = heresdk_routing_isoline_bindings_ListOf_Int_toFfi(value.rangeValues);
  final _isolineCalculationMode_handle = sdk_routing_IsolineCalculationMode_toFfi(value.isolineCalculationMode);
  final _maxPoints_handle = Int_toFfi_nullable(value.maxPoints);
  final _result = _sdk_routing_IsolineOptions_Calculation_create_handle(_rangeType_handle, _rangeValues_handle, _isolineCalculationMode_handle, _maxPoints_handle);
  sdk_routing_IsolineRangeType_releaseFfiHandle(_rangeType_handle);
  heresdk_routing_isoline_bindings_ListOf_Int_releaseFfiHandle(_rangeValues_handle);
  sdk_routing_IsolineCalculationMode_releaseFfiHandle(_isolineCalculationMode_handle);
  Int_releaseFfiHandle_nullable(_maxPoints_handle);
  return _result;
}

IsolineOptionsCalculation sdk_routing_IsolineOptions_Calculation_fromFfi(Pointer<Void> handle) {
  final _rangeType_handle = _sdk_routing_IsolineOptions_Calculation_get_field_rangeType(handle);
  final _rangeValues_handle = _sdk_routing_IsolineOptions_Calculation_get_field_rangeValues(handle);
  final _isolineCalculationMode_handle = _sdk_routing_IsolineOptions_Calculation_get_field_isolineCalculationMode(handle);
  final _maxPoints_handle = _sdk_routing_IsolineOptions_Calculation_get_field_maxPoints(handle);
  try {
    return IsolineOptionsCalculation(
      sdk_routing_IsolineRangeType_fromFfi(_rangeType_handle), 
    
      heresdk_routing_isoline_bindings_ListOf_Int_fromFfi(_rangeValues_handle), 
    
      sdk_routing_IsolineCalculationMode_fromFfi(_isolineCalculationMode_handle), 
    
      Int_fromFfi_nullable(_maxPoints_handle)
    );
  } finally {
    sdk_routing_IsolineRangeType_releaseFfiHandle(_rangeType_handle);
    heresdk_routing_isoline_bindings_ListOf_Int_releaseFfiHandle(_rangeValues_handle);
    sdk_routing_IsolineCalculationMode_releaseFfiHandle(_isolineCalculationMode_handle);
    Int_releaseFfiHandle_nullable(_maxPoints_handle);
  }
}

void sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_IsolineOptions_Calculation_release_handle(handle);

// Nullable IsolineOptionsCalculation

final _sdk_routing_IsolineOptions_Calculation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_create_handle_nullable'));
final _sdk_routing_IsolineOptions_Calculation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_release_handle_nullable'));
final _sdk_routing_IsolineOptions_Calculation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_value_nullable'));

Pointer<Void> sdk_routing_IsolineOptions_Calculation_toFfi_nullable(IsolineOptionsCalculation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IsolineOptions_Calculation_toFfi(value);
  final result = _sdk_routing_IsolineOptions_Calculation_create_handle_nullable(_handle);
  sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_handle);
  return result;
}

IsolineOptionsCalculation sdk_routing_IsolineOptions_Calculation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IsolineOptions_Calculation_get_value_nullable(handle);
  final result = sdk_routing_IsolineOptions_Calculation_fromFfi(_handle);
  sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IsolineOptions_Calculation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IsolineOptions_Calculation_release_handle_nullable(handle);

// End of IsolineOptionsCalculation "private" section.

// IsolineOptions "private" section, not exported.

final _sdk_routing_IsolineOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_create_handle'));
final _sdk_routing_IsolineOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_release_handle'));
final _sdk_routing_IsolineOptions_get_field_calculationOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_calculationOptions'));
final _sdk_routing_IsolineOptions_get_field_carOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_carOptions'));
final _sdk_routing_IsolineOptions_get_field_truckOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_truckOptions'));
final _sdk_routing_IsolineOptions_get_field_evCarOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_evCarOptions'));
final _sdk_routing_IsolineOptions_get_field_evTruckOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_evTruckOptions'));

Pointer<Void> sdk_routing_IsolineOptions_toFfi(IsolineOptions value) {
  final _calculationOptions_handle = sdk_routing_IsolineOptions_Calculation_toFfi(value.calculationOptions);
  final _carOptions_handle = sdk_routing_CarOptions_toFfi_nullable(value.carOptions);
  final _truckOptions_handle = sdk_routing_TruckOptions_toFfi_nullable(value.truckOptions);
  final _evCarOptions_handle = sdk_routing_EVCarOptions_toFfi_nullable(value.evCarOptions);
  final _evTruckOptions_handle = sdk_routing_EVTruckOptions_toFfi_nullable(value.evTruckOptions);
  final _result = _sdk_routing_IsolineOptions_create_handle(_calculationOptions_handle, _carOptions_handle, _truckOptions_handle, _evCarOptions_handle, _evTruckOptions_handle);
  sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
  sdk_routing_CarOptions_releaseFfiHandle_nullable(_carOptions_handle);
  sdk_routing_TruckOptions_releaseFfiHandle_nullable(_truckOptions_handle);
  sdk_routing_EVCarOptions_releaseFfiHandle_nullable(_evCarOptions_handle);
  sdk_routing_EVTruckOptions_releaseFfiHandle_nullable(_evTruckOptions_handle);
  return _result;
}

IsolineOptions sdk_routing_IsolineOptions_fromFfi(Pointer<Void> handle) {
  final _calculationOptions_handle = _sdk_routing_IsolineOptions_get_field_calculationOptions(handle);
  final _carOptions_handle = _sdk_routing_IsolineOptions_get_field_carOptions(handle);
  final _truckOptions_handle = _sdk_routing_IsolineOptions_get_field_truckOptions(handle);
  final _evCarOptions_handle = _sdk_routing_IsolineOptions_get_field_evCarOptions(handle);
  final _evTruckOptions_handle = _sdk_routing_IsolineOptions_get_field_evTruckOptions(handle);
  try {
    return IsolineOptions._(
      sdk_routing_IsolineOptions_Calculation_fromFfi(_calculationOptions_handle), 
    
      sdk_routing_CarOptions_fromFfi_nullable(_carOptions_handle), 
    
      sdk_routing_TruckOptions_fromFfi_nullable(_truckOptions_handle), 
    
      sdk_routing_EVCarOptions_fromFfi_nullable(_evCarOptions_handle), 
    
      sdk_routing_EVTruckOptions_fromFfi_nullable(_evTruckOptions_handle)
    );
  } finally {
    sdk_routing_IsolineOptions_Calculation_releaseFfiHandle(_calculationOptions_handle);
    sdk_routing_CarOptions_releaseFfiHandle_nullable(_carOptions_handle);
    sdk_routing_TruckOptions_releaseFfiHandle_nullable(_truckOptions_handle);
    sdk_routing_EVCarOptions_releaseFfiHandle_nullable(_evCarOptions_handle);
    sdk_routing_EVTruckOptions_releaseFfiHandle_nullable(_evTruckOptions_handle);
  }
}

void sdk_routing_IsolineOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_IsolineOptions_release_handle(handle);

// Nullable IsolineOptions

final _sdk_routing_IsolineOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_create_handle_nullable'));
final _sdk_routing_IsolineOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_release_handle_nullable'));
final _sdk_routing_IsolineOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_value_nullable'));

Pointer<Void> sdk_routing_IsolineOptions_toFfi_nullable(IsolineOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IsolineOptions_toFfi(value);
  final result = _sdk_routing_IsolineOptions_create_handle_nullable(_handle);
  sdk_routing_IsolineOptions_releaseFfiHandle(_handle);
  return result;
}

IsolineOptions sdk_routing_IsolineOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IsolineOptions_get_value_nullable(handle);
  final result = sdk_routing_IsolineOptions_fromFfi(_handle);
  sdk_routing_IsolineOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IsolineOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IsolineOptions_release_handle_nullable(handle);

// End of IsolineOptions "private" section.

