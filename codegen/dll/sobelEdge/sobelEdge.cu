/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: sobelEdge.cu
 *
 * GPU Coder version                    : 1.0
 * CUDA/C/C++ source code generated on  : 14-Jan-2018 07:15:05
 */

/* Include Files */
#include "rt_nonfinite.h"
#include "sobelEdge.h"

/* Variable Definitions */
__constant__ int8_T const_b[9];
__constant__ int8_T b_const_b[9];

/* Function Declarations */
static __global__ void sobelEdge_kernel1(real32_T *expanded);
static __global__ void sobelEdge_kernel2(const real32_T *Image, real32_T
  *expanded);
static __global__ void sobelEdge_kernel3(real32_T *expanded, real32_T *resX);
static __global__ void sobelEdge_kernel4(real32_T *expanded);
static __global__ void sobelEdge_kernel5(const real32_T *Image, real32_T
  *expanded);
static __global__ void sobelEdge_kernel6(real32_T *expanded, real32_T *resY);
static __global__ void sobelEdge_kernel7(real32_T *resX, real32_T *magnitude);
static __global__ void sobelEdge_kernel8(real32_T *resY, real32_T *magnitude,
  real32_T *resX);

/* Function Definitions */

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *expanded
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel1(real32_T
  *expanded)
{
  int32_T k;
  ;
  ;
  k = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                   + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                  threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                 blockDim.x) + threadIdx.x);
  if (!(k >= 77924)) {
    expanded[k] = 0.0F;
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                const real32_T *Image
 *                real32_T *expanded
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel2(const
  real32_T *Image, real32_T *expanded)
{
  uint32_T threadId;
  int32_T k;
  int32_T ocol;
  ;
  ;
  threadId = ((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y) +
                blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
               threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y * blockDim.x)
    + threadIdx.x;
  ocol = (int32_T)(threadId / 240U);
  k = (int32_T)(threadId - (uint32_T)ocol * 240U);
  if ((!(k >= 240)) && (!(ocol >= 320))) {
    expanded[(k + 242 * (1 + ocol)) + 1] = Image[k + 240 * ocol];
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *expanded
 *                real32_T *resX
 * Return Type  : void
 */
static __global__ __launch_bounds__(1024, 1) void sobelEdge_kernel3(real32_T
  *expanded, real32_T *resX)
{
  real32_T cv;
  int32_T n;
  int32_T k;
  int32_T threadIdY;
  int32_T threadIdX;
  __shared__ real32_T expanded_shared[1156];
  int32_T baseR;
  int32_T srow;
  int32_T strideRow;
  int32_T scol;
  int32_T strideCol;
  int32_T y_idx;
  int32_T baseC;
  int32_T x_idx;
  ;
  ;
  threadIdY = (int32_T)(blockDim.y * blockIdx.y + threadIdx.y);
  threadIdX = (int32_T)(blockDim.x * blockIdx.x + threadIdx.x);
  baseR = threadIdX;
  srow = (int32_T)threadIdx.x;
  strideRow = (int32_T)blockDim.x;
  scol = (int32_T)threadIdx.y;
  strideCol = (int32_T)blockDim.y;
  for (y_idx = srow; y_idx <= 33; y_idx += strideRow) {
    baseC = threadIdY;
    for (x_idx = scol; x_idx <= 33; x_idx += strideCol) {
      if ((baseR >= 0) && (baseR < 242) && ((baseC >= 0) && (baseC < 322))) {
        expanded_shared[y_idx + 34 * x_idx] = (real32_T)expanded[242 * baseC +
          baseR];
      } else {
        expanded_shared[y_idx + 34 * x_idx] = 0.0F;
      }

      baseC += strideCol;
    }

    baseR += strideRow;
  }

  __syncthreads();
  if ((!(threadIdX >= 240)) && (!(threadIdY >= 320))) {
    cv = 0.0F;
    for (n = 0; n < 3; n++) {
      for (k = 0; k < 3; k++) {
        cv += expanded_shared[((int32_T)threadIdx.x + ((k + threadIdX) -
          threadIdX)) + 34 * ((int32_T)threadIdx.y + ((n + threadIdY) -
          threadIdY))] * (real32_T)const_b[(3 * (2 - n) - k) + 2];
      }
    }

    resX[threadIdX + 240 * threadIdY] = cv;
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *expanded
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel4(real32_T
  *expanded)
{
  int32_T k;
  ;
  ;
  k = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                   + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                  threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                 blockDim.x) + threadIdx.x);
  if (!(k >= 77924)) {
    expanded[k] = 0.0F;
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                const real32_T *Image
 *                real32_T *expanded
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel5(const
  real32_T *Image, real32_T *expanded)
{
  uint32_T threadId;
  int32_T k;
  int32_T ocol;
  ;
  ;
  threadId = ((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y) +
                blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
               threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y * blockDim.x)
    + threadIdx.x;
  ocol = (int32_T)(threadId / 240U);
  k = (int32_T)(threadId - (uint32_T)ocol * 240U);
  if ((!(k >= 240)) && (!(ocol >= 320))) {
    expanded[(k + 242 * (1 + ocol)) + 1] = Image[k + 240 * ocol];
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *expanded
 *                real32_T *resY
 * Return Type  : void
 */
static __global__ __launch_bounds__(1024, 1) void sobelEdge_kernel6(real32_T
  *expanded, real32_T *resY)
{
  real32_T cv;
  int32_T n;
  int32_T k;
  int32_T threadIdY;
  int32_T threadIdX;
  __shared__ real32_T expanded_shared[1156];
  int32_T baseR;
  int32_T srow;
  int32_T strideRow;
  int32_T scol;
  int32_T strideCol;
  int32_T y_idx;
  int32_T baseC;
  int32_T x_idx;
  ;
  ;
  threadIdY = (int32_T)(blockDim.y * blockIdx.y + threadIdx.y);
  threadIdX = (int32_T)(blockDim.x * blockIdx.x + threadIdx.x);
  baseR = threadIdX;
  srow = (int32_T)threadIdx.x;
  strideRow = (int32_T)blockDim.x;
  scol = (int32_T)threadIdx.y;
  strideCol = (int32_T)blockDim.y;
  for (y_idx = srow; y_idx <= 33; y_idx += strideRow) {
    baseC = threadIdY;
    for (x_idx = scol; x_idx <= 33; x_idx += strideCol) {
      if ((baseR >= 0) && (baseR < 242) && ((baseC >= 0) && (baseC < 322))) {
        expanded_shared[y_idx + 34 * x_idx] = (real32_T)expanded[242 * baseC +
          baseR];
      } else {
        expanded_shared[y_idx + 34 * x_idx] = 0.0F;
      }

      baseC += strideCol;
    }

    baseR += strideRow;
  }

  __syncthreads();
  if ((!(threadIdX >= 240)) && (!(threadIdY >= 320))) {
    cv = 0.0F;
    for (n = 0; n < 3; n++) {
      for (k = 0; k < 3; k++) {
        cv += expanded_shared[((int32_T)threadIdx.x + ((k + threadIdX) -
          threadIdX)) + 34 * ((int32_T)threadIdx.y + ((n + threadIdY) -
          threadIdY))] * (real32_T)b_const_b[(3 * (2 - n) - k) + 2];
      }
    }

    resY[threadIdX + 240 * threadIdY] = cv;
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *resX
 *                real32_T *magnitude
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel7(real32_T
  *resX, real32_T *magnitude)
{
  int32_T k;
  ;
  ;
  k = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                   + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                  threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                 blockDim.x) + threadIdx.x);
  if (!(k >= 76800)) {
    magnitude[k] = resX[k] * resX[k];
  }
}

/*
 * Arguments    : uint3 blockArg
 *                uint3 gridArg
 *                real32_T *resY
 *                real32_T *magnitude
 *                real32_T *resX
 * Return Type  : void
 */
static __global__ __launch_bounds__(512, 1) void sobelEdge_kernel8(real32_T
  *resY, real32_T *magnitude, real32_T *resX)
{
  int32_T k;
  ;
  ;
  k = (int32_T)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                   + blockIdx.x) * (blockDim.x * blockDim.y * blockDim.z) +
                  threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                 blockDim.x) + threadIdx.x);
  if (!(k >= 76800)) {
    resX[k] = resY[k] * resY[k];
    magnitude[k] += resX[k];
    magnitude[k] = sqrtf(magnitude[k]);
    if ((real_T)magnitude[k] < 0.4) {
      magnitude[k] = 0.0F;
    }
  }
}

/*
 * Copyright 2017 The MathWorks, Inc.
 * Arguments    : const real32_T Image[76800]
 *                real32_T magnitude[76800]
 * Return Type  : void
 */
void sobelEdge(const real32_T Image[76800], real32_T magnitude[76800])
{
  static const int8_T b[9] = { -1, -2, -1, 0, 0, 0, 1, 2, 1 };

  static const int8_T b_b[9] = { -1, 0, 1, -2, 0, 2, -1, 0, 1 };

  real32_T *gpu_expanded;
  real32_T *gpu_Image;
  real32_T *gpu_resX;
  real32_T *gpu_resY;
  real32_T *gpu_magnitude;
  cudaMalloc(&gpu_magnitude, 307200ULL);
  cudaMalloc(&gpu_resY, 307200ULL);
  cudaMalloc(&gpu_resX, 307200ULL);
  cudaMalloc(&gpu_Image, 307200ULL);
  cudaMalloc(&gpu_expanded, 311696ULL);
  sobelEdge_kernel1<<<dim3(153U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_expanded);
  cudaMemcpy((void *)gpu_Image, (void *)&Image[0], 307200ULL,
             cudaMemcpyHostToDevice);
  sobelEdge_kernel2<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_Image,
    gpu_expanded);
  cudaMemcpyToSymbol(const_b, b, 9ULL, 0ULL, cudaMemcpyHostToDevice);
  sobelEdge_kernel3<<<dim3(8U, 10U, 1U), dim3(32U, 32U, 1U)>>>(gpu_expanded,
    gpu_resX);
  sobelEdge_kernel4<<<dim3(153U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_expanded);
  sobelEdge_kernel5<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_Image,
    gpu_expanded);
  cudaMemcpyToSymbol(b_const_b, b_b, 9ULL, 0ULL, cudaMemcpyHostToDevice);
  sobelEdge_kernel6<<<dim3(8U, 10U, 1U), dim3(32U, 32U, 1U)>>>(gpu_expanded,
    gpu_resY);
  sobelEdge_kernel7<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_resX,
    gpu_magnitude);
  sobelEdge_kernel8<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_resY,
    gpu_magnitude, gpu_resX);
  cudaMemcpy((void *)&magnitude[0], (void *)gpu_magnitude, 307200ULL,
             cudaMemcpyDeviceToHost);
  cudaFree(gpu_expanded);
  cudaFree(gpu_Image);
  cudaFree(gpu_resX);
  cudaFree(gpu_resY);
  cudaFree(gpu_magnitude);
}

/*
 * File trailer for sobelEdge.cu
 *
 * [EOF]
 */
