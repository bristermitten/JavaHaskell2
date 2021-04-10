#include <jni.h>
#include "haskell_compat.h"


JNIEXPORT jboolean JNICALL Java_me_bristermitten_haskellplugin_HaskellPlugin_processCommand
  (JNIEnv * env, jclass cls, jobject sender, string label, jobjectArray args) {

  }


void sendMessage(JNIENV * env, jobject sender, char * msg) {
  jclass cls_sender = env->GetObjectClass()
}