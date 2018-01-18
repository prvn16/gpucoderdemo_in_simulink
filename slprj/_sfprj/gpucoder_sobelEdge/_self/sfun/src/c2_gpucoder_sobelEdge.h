#ifndef __c2_gpucoder_sobelEdge_h__
#define __c2_gpucoder_sobelEdge_h__

/* Type Definitions */
#ifndef typedef_SFc2_gpucoder_sobelEdgeInstanceStruct
#define typedef_SFc2_gpucoder_sobelEdgeInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_gpucoder_sobelEdge;
  real32_T c2_u[76800];
  real32_T c2_y[76800];
  real32_T c2_I[76800];
  real32_T c2_b_y[76800];
  real32_T c2_fv1[76800];
  real32_T c2_fv0[76800];
  real32_T c2_b_u[76800];
  void *c2_fEmlrtCtx;
  real32_T (*c2_c_u)[76800];
  real32_T (*c2_c_y)[76800];
} SFc2_gpucoder_sobelEdgeInstanceStruct;

#endif                                 /*typedef_SFc2_gpucoder_sobelEdgeInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_gpucoder_sobelEdge_get_eml_resolved_functions_info
  (void);

/* Function Definitions */
extern void sf_c2_gpucoder_sobelEdge_get_check_sum(mxArray *plhs[]);
extern void c2_gpucoder_sobelEdge_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
