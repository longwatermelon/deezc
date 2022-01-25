#ifndef ERRORS_H
#define ERRORS_H

#include "node.h"
#include "scope.h"
#include "asm.h"

void errors_asm_check_function_call(struct Node *def, struct Node *call, struct Asm *as);
void errors_asm_check_function_return(struct Node *def, struct Asm *as);
// Always call this function before inserting the new function definition into scope, or else it won't work properly
void errors_asm_check_function_def(struct Node *def, struct Asm *as);

void errors_asm_check_variable_def(struct Node *def, struct Asm *as);
void errors_asm_check_assignment(struct Node *assignment, struct Asm *as);

void errors_asm_check_init_list(struct Node *list, struct Asm *as);

void errors_asm_nonexistent_variable(struct Asm *as, struct Node *var);

void errors_print_lines(struct Asm *as, size_t line);
void errors_print_line(struct Asm *as, size_t line);

#endif

