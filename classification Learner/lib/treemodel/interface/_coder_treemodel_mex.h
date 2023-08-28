/*
 * File: _coder_treemodel_mex.h
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

#ifndef _CODER_TREEMODEL_MEX_H
#define _CODER_TREEMODEL_MEX_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#ifdef __cplusplus

extern "C" {

#endif

  /* Function Declarations */
  MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T
    nrhs, const mxArray *prhs[]);
  emlrtCTX mexFunctionCreateRootTLS(void);
  void treemodel_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
    mxArray *prhs[1]);

#ifdef __cplusplus

}
#endif
#endif

/*
 * File trailer for _coder_treemodel_mex.h
 *
 * [EOF]
 */
