/*
 * File: treemodel_initialize.c
 *
 * MATLAB Coder version            : 5.1
 * C/C++ source code generated on  : 26-Aug-2023 00:15:47
 */

/* Include Files */
#include "treemodel_initialize.h"
#include "rt_nonfinite.h"
#include "treemodel_data.h"

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : void
 */
void treemodel_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_treemodel = true;
}

/*
 * File trailer for treemodel_initialize.c
 *
 * [EOF]
 */
