/* Copyright 2024 cpmachado */

/* HEADERS */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#include "todo.h"

#ifndef VERSION
#define VERSION "unknown"
#endif

/* FUNCTION DECLARATIONS */

void usage(void);

void version(void);

int32_t main(int32_t argc, char **argv) {
  int opt;
  struct tm deadline = {.tm_year = 94, .tm_mon = 8, .tm_mday = 2};
  Todo t = {TODO, deadline, "Something", "Something Description"};
  char buf[100];

  while ((opt = getopt(argc, argv, "hv")) != -1) {
    switch (opt) {
    case 'h':
      usage();
      exit(EXIT_SUCCESS);
    case 'v':
      version();
      exit(EXIT_SUCCESS);
    default:
      usage();
      exit(EXIT_FAILURE);
    }
  }

  strftime(buf, 100, "%Y-%m-%d", &t.deadline);
  printf("%d - %s - %s: %s\n", t.status, buf, t.title, t.description);

  return 0;
}

/* FUNCTION DEFINITIONS */

void usage(void) {
  fprintf(stdout, "tdc is a simple todo cli to manage todos.\n\n"
                  "Usage: tdc [OPTIONS]\n"
                  "Options:\n"
                  "   - h             -- display help and exit\n"
                  "   - v             -- display version and exit\n");
}

void version(void) {
  fprintf(stdout, "tdc-" VERSION " Copyright © 2024 "
                  ": cpmachado\n");
}
