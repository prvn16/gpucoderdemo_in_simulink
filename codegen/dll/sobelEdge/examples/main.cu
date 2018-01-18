/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.cu
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 14-Jan-2018 07:15:05
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include Files */
#include "rt_nonfinite.h"
#include "sobelEdge.h"
#include "main.h"
#include "sobelEdge_terminate.h"
#include "sobelEdge_initialize.h"

/* Function Declarations */
static void argInit_240x320_real32_T(real32_T result[76800]);
static real32_T argInit_real32_T(void);
static void main_sobelEdge(void);

/* Function Definitions */

/*
 * Arguments    : real32_T result[76800]
 * Return Type  : void
 */
static void argInit_240x320_real32_T(real32_T result[76800])
{
  int32_T idx0;
  int32_T idx1;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 240; idx0++) {
    for (idx1 = 0; idx1 < 320; idx1++) {
      /* Set the value of the array element.
         Change this value to the value that the application requires. */
      result[idx0 + 240 * idx1] = argInit_real32_T();
    }
  }
}

/*
 * Arguments    : void
 * Return Type  : real32_T
 */
static real32_T argInit_real32_T(void)
{
  return 0.0F;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
static void main_sobelEdge(void)
{
  static real32_T magnitude[76800];
  static real32_T b[76800];

  /* Initialize function 'sobelEdge' input arguments. */
  /* Initialize function input argument 'Image'. */
  /* Call the entry-point 'sobelEdge'. */
  argInit_240x320_real32_T(b);
  sobelEdge(b, magnitude);
}

/*
 * Arguments    : int32_T argc
 *                const char * const argv[]
 * Return Type  : int32_T
 */
int32_T main(int32_T argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* Initialize the application.
     You do not need to do this more than one time. */
  sobelEdge_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_sobelEdge();

  /* Terminate the application.
     You do not need to do this more than one time. */
  sobelEdge_terminate();
  return 0;
}

/*
 * File trailer for main.cu
 *
 * [EOF]
 */
