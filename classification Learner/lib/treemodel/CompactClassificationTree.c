/*
 * File: CompactClassificationTree.c
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

/* Include Files */
#include "CompactClassificationTree.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"

/* Function Definitions */
/*
 * Arguments    : const double obj_CutPredictorIndex[189]
 *                const double obj_Children[378]
 *                const double obj_CutPoint[189]
 *                const double obj_PruneList_data[]
 *                const boolean_T obj_NanCutPoints[189]
 *                const double obj_ClassNames[25]
 *                const double obj_Cost[625]
 *                const double obj_ClassProbability[4725]
 *                const double Xin[300]
 * Return Type  : double
 */
double c_CompactClassificationTree_pre(const double obj_CutPredictorIndex[189],
  const double obj_Children[378], const double obj_CutPoint[189], const double
  obj_PruneList_data[], const boolean_T obj_NanCutPoints[189], const double
  obj_ClassNames[25], const double obj_Cost[625], const double
  obj_ClassProbability[4725], const double Xin[300])
{
  double unusedU4[25];
  double d;
  double ex;
  int i;
  int k;
  int m;
  boolean_T exitg1;
  m = 0;
  exitg1 = false;
  while (!(exitg1 || (obj_PruneList_data[m] <= 0.0))) {
    d = Xin[(int)obj_CutPredictorIndex[m] - 1];
    if (rtIsNaN(d) || obj_NanCutPoints[m]) {
      exitg1 = true;
    } else if (d < obj_CutPoint[m]) {
      m = (int)obj_Children[m << 1] - 1;
    } else {
      m = (int)obj_Children[(m << 1) + 1] - 1;
    }
  }

  for (i = 0; i < 25; i++) {
    d = 0.0;
    for (k = 0; k < 25; k++) {
      d += obj_ClassProbability[m + 189 * k] * obj_Cost[k + 25 * i];
    }

    unusedU4[i] = d;
  }

  if (!rtIsNaN(unusedU4[0])) {
    m = 1;
  } else {
    m = 0;
    k = 2;
    exitg1 = false;
    while ((!exitg1) && (k < 26)) {
      if (!rtIsNaN(unusedU4[k - 1])) {
        m = k;
        exitg1 = true;
      } else {
        k++;
      }
    }
  }

  if (m == 0) {
    m = 1;
  } else {
    ex = unusedU4[m - 1];
    i = m + 1;
    for (k = i; k < 26; k++) {
      d = unusedU4[k - 1];
      if (ex > d) {
        ex = d;
        m = k;
      }
    }
  }

  return obj_ClassNames[m - 1];
}

/*
 * File trailer for CompactClassificationTree.c
 *
 * [EOF]
 */
