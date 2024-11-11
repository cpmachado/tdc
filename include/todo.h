/* Copyright 2024 cpmachado */

#ifndef _TIME_H
#include <time.h>
#endif

enum TodoStatus { TODO, PROGRESS, DONE };

typedef struct Todo {
  enum TodoStatus status;
  struct tm deadline;
  char title[30];
  char description[140];
} Todo;
