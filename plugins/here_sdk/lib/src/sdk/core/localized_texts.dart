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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:intl/locale.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;



/// The list of multiple names or titles for the same entity, possibly in different languages.

class LocalizedTexts {
  /// The list of text items.
  /// Recommended to use helper methods instead of directly accessing the items.
  List<LocalizedText> items;


  LocalizedTexts(this.items);

  /// Returns best name or title to be presented to the user according to specified
  /// locales.
  ///
  /// The locales are expected to be ordered by priority.
  /// If no matching locale found - the default is returned.
  /// In case of empty list returns `null`.
  String getPreferredValueForLocales(List<Locale> locales) {
    final _getPreferredValueForLocales_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocalizedTexts_getPreferredValueForLocales__ListOf_1Locale'));
    final _locales_handle = heresdk_core_bindings_ListOf_Locale_toFfi(locales);
    final _handle = sdk_core_LocalizedTexts_toFfi(this);
    final __result_handle = _getPreferredValueForLocales_ffi(_handle, __lib.LibraryContext.isolateId, _locales_handle);
    sdk_core_LocalizedTexts_releaseFfiHandle(_handle);
    heresdk_core_bindings_ListOf_Locale_releaseFfiHandle(_locales_handle);
    try {
      return String_fromFfi_nullable(__result_handle);
    } finally {
      String_releaseFfiHandle_nullable(__result_handle);
    }
  }

  /// Returns the default value.
  ///
  /// In case of empty list return `null`.
  String getDefaultValue() {
    final _getDefaultValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocalizedTexts_getDefaultValue'));
    final _handle = sdk_core_LocalizedTexts_toFfi(this);
    final __result_handle = _getDefaultValue_ffi(_handle, __lib.LibraryContext.isolateId);
    sdk_core_LocalizedTexts_releaseFfiHandle(_handle);
    try {
      return String_fromFfi_nullable(__result_handle);
    } finally {
      String_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! LocalizedTexts) return false;
    LocalizedTexts _other = other;
    return DeepCollectionEquality().equals(items, _other.items);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(items);
    return result;
  }
}


// LocalizedTexts "private" section, not exported.

final _sdk_core_LocalizedTexts_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_create_handle'));
final _sdk_core_LocalizedTexts_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_release_handle'));
final _sdk_core_LocalizedTexts_get_field_items = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_get_field_items'));

Pointer<Void> sdk_core_LocalizedTexts_toFfi(LocalizedTexts value) {
  final _items_handle = heresdk_core_bindings_ListOf_sdk_core_LocalizedText_toFfi(value.items);
  final _result = _sdk_core_LocalizedTexts_create_handle(_items_handle);
  heresdk_core_bindings_ListOf_sdk_core_LocalizedText_releaseFfiHandle(_items_handle);
  return _result;
}

LocalizedTexts sdk_core_LocalizedTexts_fromFfi(Pointer<Void> handle) {
  final _items_handle = _sdk_core_LocalizedTexts_get_field_items(handle);
  try {
    return LocalizedTexts(
      heresdk_core_bindings_ListOf_sdk_core_LocalizedText_fromFfi(_items_handle)
    );
  } finally {
    heresdk_core_bindings_ListOf_sdk_core_LocalizedText_releaseFfiHandle(_items_handle);
  }
}

void sdk_core_LocalizedTexts_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_LocalizedTexts_release_handle(handle);

// Nullable LocalizedTexts

final _sdk_core_LocalizedTexts_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_create_handle_nullable'));
final _sdk_core_LocalizedTexts_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_release_handle_nullable'));
final _sdk_core_LocalizedTexts_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedTexts_get_value_nullable'));

Pointer<Void> sdk_core_LocalizedTexts_toFfi_nullable(LocalizedTexts value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_LocalizedTexts_toFfi(value);
  final result = _sdk_core_LocalizedTexts_create_handle_nullable(_handle);
  sdk_core_LocalizedTexts_releaseFfiHandle(_handle);
  return result;
}

LocalizedTexts sdk_core_LocalizedTexts_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_LocalizedTexts_get_value_nullable(handle);
  final result = sdk_core_LocalizedTexts_fromFfi(_handle);
  sdk_core_LocalizedTexts_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_LocalizedTexts_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_LocalizedTexts_release_handle_nullable(handle);

// End of LocalizedTexts "private" section.

