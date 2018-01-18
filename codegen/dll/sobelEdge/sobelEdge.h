/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: sobelEdge.h
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 14-Jan-2018 07:15:05
 */

#ifndef SOBELEDGE_H
#define SOBELEDGE_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "sobelEdge_types.h"

/* Function Declarations */
#ifdef __cplusplus

extern "C" {

#endif

  extern void sobelEdge(const real32_T Image[76800], real32_T magnitude[76800]);

#ifdef __cplusplus

}
#endif
#endif

/*
 * File trailer for sobelEdge.h
 *
 * [EOF]
 */
