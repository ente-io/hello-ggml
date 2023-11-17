#ifndef __TESTGGML_H
#define __TESTGGML_H

#ifdef WIN32
   #define EXPORT __declspec(dllexport)
#else
   #define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

EXPORT char *test_ggml_init(char *arg);

#endif