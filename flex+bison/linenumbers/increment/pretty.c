#include <stdio.h>
#include "pretty.h"
 
void prettyEXP(EXP *e)
{ switch (e->kind) {
    case idK:
         printf("%s[%d]",e->val.idE,e->lineno);
         break;
    case intconstK:
         printf("%i[%d]",e->val.intconstE,e->lineno);
         break;
    case timesK:
         printf("(");
         prettyEXP(e->val.timesE.left);
         printf("*[%d]",e->lineno);
         prettyEXP(e->val.timesE.right);
         printf(")");
         break;
    case divK:
         printf("(");
         prettyEXP(e->val.divE.left);
         printf("/");
         prettyEXP(e->val.divE.right);
         printf(")");
         break;
    case plusK:
         printf("(");
         prettyEXP(e->val.plusE.left);
         printf("+[%d]",e->lineno);
         prettyEXP(e->val.plusE.right);
         printf(")");
         break;
    case minusK:
         printf("(");
         prettyEXP(e->val.minusE.left);
         printf("-[%d]",e->lineno);
         prettyEXP(e->val.minusE.right);
         printf(")");
         break;
  }
}
