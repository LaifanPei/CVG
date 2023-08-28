/*
 * File: _coder_treemodel_info.c
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

/* Include Files */
#include "_coder_treemodel_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void);

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[5] = {
    "789ce554cf6b1341149e950a82587bf2ecc98bb09304b125b7b25169b1a13fb6b6d2169cecbea443e6c7323329f1e4adf4e6d5a37f86f48ff02494fe292d0866"
    "369964bbb86c309aa23e5876bffd66def7bd37bb0f796b1b1e4268110de3f3fde1fdc1e0ba1e104ba3f777d0cdc8f35e6e9dc58f33ebefa20574f561b8cff176",
    "ffc7118ea430d03743200887f1ce58722a8830e1fb0490022dd909c429d3a60c42ca61270b9a16f197196a0c2c659f836388ba3b3d8ed4b19e38645990f6c3fa"
    "7b97a9d7fa77f52efca41f593e1f5e0e2f8df2ff6f7a9f7e51cfa57a5ea2e7f883dda3a08e7735288d5f839027123740778d4c704c0cc101235ad3368d88a152",
    "840ac0e7c494f7e5e1943ef3f7c9fa7be9fabd8b4b2fdb973fad77bafdf57c9e7a2e6e4baf5f906fdaefec51819efbce1cdfa9765fe8d5577479a5ba1a74b682"
    "24de5aae36263e364b74ca7ca0023caffc5f0af64fdbc7fd82fcae8f8e3f58db0f8e1a75bc410c23ad5aa556696123256bc93ed686188d23fbc72ae8e0a79327",
    "0644092aec3b1983c281e40989cca6829846462a9fbb3ace66ace349491d8e77de7c67cd4f9df50c65da0f1511ba2d15bfbdf93beb79be29d173fce03c9b339f"
    "67da353cee9a3f45df7ed73ca99f7f9beb7c4687dfd95cf546f1afcfe77512863d12efa956d324cfdeaef42b35a982bf7f3eff0066d9229f",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3000U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/*
 * Arguments    : void
 * Return Type  : mxArray *
 */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *epFieldName[6] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs", "FullPath", "TimeStamp" };

  const char_T *propFieldName[4] = { "Version", "ResolvedFunctions",
    "EntryPoints", "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 6, epFieldName);
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("treemodel"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath", emlrtMxCreateString(
    "C:\\Users\\Lenovo\\Desktop\\data\\treemodel.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp", emlrtMxCreateDoubleScalar
                (739123.89788194443));
  xResult = emlrtCreateStructMatrix(1, 1, 4, propFieldName);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.9.0.1467703 (R2020b)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_treemodel_info.c
 *
 * [EOF]
 */
