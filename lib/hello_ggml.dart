import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef test_ggml_init = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8> test_arg);

class GGML {
  static const clipLib = "libtestggml.so";

  static final _ggml = openLib();

  static ffi.DynamicLibrary openLib() {
    if (Platform.isIOS || Platform.isMacOS) {
      return ffi.DynamicLibrary.process();
    } else {
      return ffi.DynamicLibrary.open(clipLib);
    }
  }

  static testGgmlInit(String modelPath) {
    var res = _ggml
        .lookupFunction<test_ggml_init, test_ggml_init>("test_ggml_init")
        .call(modelPath.toNativeUtf8());
    return res.toDartString();
  }
}
