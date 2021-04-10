#include "../Haskell/Calc_stub.h" //Provides an explicit binding to add()
#include <HsFFI.h>
#include <jni.h>

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
  hs_init(0, 0); // Make sure Haskell FFI is properly setup
  return JNI_VERSION_1_8;
}

JNIEXPORT jint JNICALL Java_Library_addHs(JNIEnv *env, jclass clazz, jint a,
                                          jint b) {
  return add(a, b);
}