/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: sobelEdge_initialize.cu
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 14-Jan-2018 07:15:05
 */

/* Include Files */
#include "rt_nonfinite.h"
#include "sobelEdge.h"
#include "sobelEdge_initialize.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void sobelEdge_initialize(void)
{
  rt_InitInfAndNaN(8U);
}

/*
 * File trailer for sobelEdge_initialize.cu
 *
 * [EOF]
 */
