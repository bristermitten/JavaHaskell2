#include "../Haskell/Calc_stub.h" //Provides an explicit binding to add()
#include <HsFFI.h>
#include <jni.h>
#include "Library.h"
#include <stdlib.h>
#include <string.h>

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
  hs_init(0, 0); // Make sure Haskell FFI is properly setup
  return JNI_VERSION_1_8;
}

JNIEXPORT jstring JNICALL Java_Library_runHS(JNIEnv *env, jclass clazz) {
  char *res = (char *)cProcess();
  int len = strlen(res) + 1; // haskell CString is null terminated
  char *buf = (char *)malloc(len);
  strcpy(buf, res);
  free(res);
  return (*env)->NewStringUTF(env, buf);
}