#include "clip.h"
#include "test.h"
#include <iostream>

char *test_ggml_init(char *arg) {

    // Test GGML Init
    // struct ggml_init_params params_ggml;
    // size_t ctx_size = 0;
    // ctx_size = 176012928;
    // params_ggml.mem_size   = ctx_size;
    // params_ggml.no_alloc   = false;
    // params_ggml.mem_buffer = NULL;
    // ggml_init(params_ggml);

    // Test CLIP model load
    char *filename = (char *)"model.bin";
    int verbosity = 1;
    clip_model_load(filename, verbosity);
    return (char *)"pong";
}