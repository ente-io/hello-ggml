
#include "ggml.h"
#include "test.h"


char *test_ggml_init(char *arg) {
    struct ggml_init_params params_ggml;
    params_ggml.mem_size   = ggml_tensor_overhead();
    params_ggml.no_alloc   = true;
    params_ggml.mem_buffer = NULL;
    ggml_init(params_ggml);
    return (char *)"pong";
}