#ifndef TREE_H
#define TREE_H
 
typedef struct EXP {
	int lineno;
	enum {idK,intconstK,timesK,divK,plusK,minusK} kind;
	union {
		char *idE;
		int intconstE;
		struct {struct EXP *left; struct EXP *right;} timesE;
		struct {struct EXP *left; struct EXP *right;} divE;
		struct {struct EXP *left; struct EXP *right;} plusE;
		struct {struct EXP *left; struct EXP *right;} minusE;
	} val;
} EXP;
 
EXP *makeEXPid(char *id, int lineno);

EXP *makeEXPintconst(int intconst, int lineno);

EXP *makeEXPtimes(EXP *left, EXP *right, int lineno);

EXP *makeEXPdiv(EXP *left, EXP *right, int lineno);

EXP *makeEXPplus(EXP *left, EXP *right, int lineno);

EXP *makeEXPminus(EXP *left, EXP *right, int lineno);

#endif /* !TREE_H */
