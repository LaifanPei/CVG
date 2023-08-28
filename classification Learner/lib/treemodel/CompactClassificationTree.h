/*
 * File: CompactClassificationTree.h
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

#ifndef COMPACTCLASSIFICATIONTREE_H
#define COMPACTCLASSIFICATIONTREE_H

/* Include Files */
#include "rtwtypes.h"
#include <stddef.h>
#include <stdlib.h>
#ifdef __cplusplus

extern "C" {

#endif

  /* Function Declarations */
  double c_CompactClassificationTree_pre(const double obj_CutPredictorIndex[189],
    const double obj_Children[378], const double obj_CutPoint[189], const double
    obj_PruneList_data[], const boolean_T obj_NanCutPoints[189], const double
    obj_ClassNames[25], const double obj_Cost[625], const double
    obj_ClassProbability[4725], const double Xin[300]);

#ifdef __cplusplus

}
#endif
#endif

/*
 * File trailer for CompactClassificationTree.h
 *
 * [EOF]
 */
