#include <stdlib.h>
#include <stdio.h>
#include "tree.h"

EXP *makeEXPid(char *id, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = idK;
	e->val.idE = id;
	return e;
}

EXP *makeEXPintconst(int intconst, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = intconstK;
	e->val.intconstE = intconst;
	return e;
}

EXP *makeEXPtimes(EXP *left, EXP *right, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = timesK;
	e->val.timesE.left = left;
	e->val.timesE.right = right;
	return e;
}

EXP *makeEXPdiv(EXP *left, EXP *right, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = divK;
	e->val.divE.left = left;
	e->val.divE.right = right;
	return e; 
}

EXP *makeEXPplus(EXP *left, EXP *right, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = plusK;
	e->val.plusE.left = left;
	e->val.plusE.right = right;
	return e;
}

EXP *makeEXPminus(EXP *left, EXP *right, int lineno) {
	EXP *e = malloc(sizeof(EXP));
	e->lineno = lineno;
	e->kind = minusK;
	e->val.minusE.left = left;
	e->val.minusE.right = right;
	return e;
}
