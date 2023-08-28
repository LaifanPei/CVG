/*
 * File: _coder_treemodel_api.h
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

#ifndef _CODER_TREEMODEL_API_H
#define _CODER_TREEMODEL_API_H

/* Include Files */
#include "emlrt.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus

extern "C" {

#endif

  /* Function Declarations */
  real_T treemodel(real_T input[300]);
  void treemodel_api(const mxArray * const prhs[1], const mxArray *plhs[1]);
  void treemodel_atexit(void);
  void treemodel_initialize(void);
  void treemodel_terminate(void);
  void treemodel_xil_shutdown(void);
  void treemodel_xil_terminate(void);

#ifdef __cplusplus

}
#endif
#endif

/*
 * File trailer for _coder_treemodel_api.h
 *
 * [EOF]
 */
