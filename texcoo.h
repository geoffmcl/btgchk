#ifndef BTG_TEXCOO_H
#define BTG_TEXCOO_H

#include <stdio.h>

#include "struct.h"

#define TEXCOO_PRECITION 0.0001

btg_texcoo *read_texcoo (FILE *f, btg_base *base, unsigned int ver, int index);
int write_texcoo (FILE *f, btg_texcoo *texcoo, unsigned int ver);
void free_texcoo (btg_texcoo *texcoo);

void remove_unused_texcoos (btg_texcoo *texcoo);
void check_same_texcoos (btg_texcoo *texcoo);
#endif