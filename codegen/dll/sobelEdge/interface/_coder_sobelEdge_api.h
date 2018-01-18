/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_sobelEdge_api.h
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 14-Jan-2018 07:15:05
 */

#ifndef _CODER_SOBELEDGE_API_H
#define _CODER_SOBELEDGE_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_sobelEdge_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
#ifdef __cplusplus

extern "C" {

#endif

  extern void sobelEdge(real32_T Image[76800], real32_T magnitude[76800]);
  extern void sobelEdge_api(const mxArray * const prhs[1], const mxArray *plhs[1]);
  extern void sobelEdge_atexit(void);
  extern void sobelEdge_initialize(void);
  extern void sobelEdge_terminate(void);
  extern void sobelEdge_xil_terminate(void);

#ifdef __cplusplus

}
#endif
#endif

/*
 * File trailer for _coder_sobelEdge_api.h
 *
 * [EOF]
 */
