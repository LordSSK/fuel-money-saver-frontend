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

import 'dart:typed_data';
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapview/image_format.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a drawable resource that can be used by a MapMarker to be shown on the map.
abstract class MapImage {
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.png]
  /// is accepted.
  /// [pixelData] Data to be used for the image. The bytes of a PNG image datastream are expected as
  /// defined in https://www.w3.org/TR/PNG
  /// [imageFormat] The format of the image data to be used.
  factory MapImage.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) => MapImage$Impl.withPixelDataAndImageFormat(pixelData, imageFormat);
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.svg]
  /// is accepted.
  /// [imageData] Data to be used for the image. For image format [ImageFormat.svg] the bytes
  /// of a UTF-8 encoded string in SVG Tiny format are expected. For the format specification
  /// see https://www.w3.org/TR/SVGTiny12
  /// [imageFormat] The format of the image data to be used.
  /// [width] Width of the image in pixels
  /// [height] Height of the image in pixels
  factory MapImage.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) => MapImage$Impl.withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height);
  /// Creates a new map image from the provided path to the SVG Tiny or PNG image.
  ///
  /// Will throw an error
  /// if either the height or width equals zero or the path is empty. Trying to load the data that is
  /// not compliant with SVG Tiny or PNG could result in an undefined behavior.
  /// [filePath] The path to image file
  /// [width] Width of image in pixels
  /// [height] Height of image in pixels
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  factory MapImage.withFilePathAndWidthAndHeight(String filePath, int width, int height) => MapImage$Impl.withFilePathAndWidthAndHeight(filePath, width, height);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// MapImage "private" section, not exported.

final _sdk_mapview_MapImage_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_copy_handle'));
final _sdk_mapview_MapImage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_release_handle'));
final _sdk_mapview_MapImage_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapImage_get_raw_pointer'));



final _withFilePathAndWidthAndHeight_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_release_handle'));
final _withFilePathAndWidthAndHeight_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_result'));
final _withFilePathAndWidthAndHeight_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_error'));
final _withFilePathAndWidthAndHeight_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_has_error'));


class MapImage$Impl implements MapImage {
  @protected
  Pointer<Void> handle;

  MapImage$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapImage_get_raw_pointer(handle));
    _sdk_mapview_MapImage_release_handle(handle);
    handle = null;
  }


  MapImage$Impl.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) : handle = _withPixelDataAndImageFormat(pixelData, imageFormat) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) : handle = _withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.withFilePathAndWidthAndHeight(String filePath, int width, int height) : handle = _withFilePathAndWidthAndHeight(filePath, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) {
    final _withPixelDataAndImageFormat_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat'));
    final _pixelData_handle = Blob_toFfi(pixelData);
    final _imageFormat_handle = sdk_mapview_ImageFormat_toFfi(imageFormat);
    final __result_handle = _withPixelDataAndImageFormat_ffi(__lib.LibraryContext.isolateId, _pixelData_handle, _imageFormat_handle);
    Blob_releaseFfiHandle(_pixelData_handle);
    sdk_mapview_ImageFormat_releaseFfiHandle(_imageFormat_handle);
    return __result_handle;
  }

  static Pointer<Void> _withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) {
    final _withImageDataImageFormatWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat_UInt_UInt'));
    final _imageData_handle = Blob_toFfi(imageData);
    final _imageFormat_handle = sdk_mapview_ImageFormat_toFfi(imageFormat);
    final _width_handle = (width);
    final _height_handle = (height);
    final __result_handle = _withImageDataImageFormatWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _imageData_handle, _imageFormat_handle, _width_handle, _height_handle);
    Blob_releaseFfiHandle(_imageData_handle);
    sdk_mapview_ImageFormat_releaseFfiHandle(_imageFormat_handle);
    (_width_handle);
    (_height_handle);
    return __result_handle;
  }

  static Pointer<Void> _withFilePathAndWidthAndHeight(String filePath, int width, int height) {
    final _withFilePathAndWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt'));
    final _filePath_handle = String_toFfi(filePath);
    final _width_handle = (width);
    final _height_handle = (height);
    final __call_result_handle = _withFilePathAndWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _filePath_handle, _width_handle, _height_handle);
    String_releaseFfiHandle(_filePath_handle);
    (_width_handle);
    (_height_handle);
    if (_withFilePathAndWidthAndHeight_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withFilePathAndWidthAndHeight_return_get_error(__call_result_handle);
        _withFilePathAndWidthAndHeight_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withFilePathAndWidthAndHeight_return_get_result(__call_result_handle);
    _withFilePathAndWidthAndHeight_return_release_handle(__call_result_handle);
    return __result_handle;
  }


}

Pointer<Void> sdk_mapview_MapImage_toFfi(MapImage value) =>
  _sdk_mapview_MapImage_copy_handle((value as MapImage$Impl).handle);

MapImage sdk_mapview_MapImage_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapImage_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is MapImage) return instance as MapImage;

  final _copied_handle = _sdk_mapview_MapImage_copy_handle(handle);
  final result = MapImage$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapImage_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapImage_release_handle(handle);

Pointer<Void> sdk_mapview_MapImage_toFfi_nullable(MapImage value) =>
  value != null ? sdk_mapview_MapImage_toFfi(value) : Pointer<Void>.fromAddress(0);

MapImage sdk_mapview_MapImage_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapImage_fromFfi(handle) : null;

void sdk_mapview_MapImage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapImage_release_handle(handle);

// End of MapImage "private" section.

