/* Copyright 2024 cpmachado */

enum TodoStatus { TODO, PROGRESS, DONE };

typedef struct Todo {
  enum TodoStatus status;
  struct tm deadline;
  char title[30];
  char description[140];
} Todo;
