/* Copyright 2024 cpmachado */

/* HEADERS */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#ifndef VERSION
#define VERSION "unknown"
#endif

/* FUNCTION DECLARATIONS */

void usage(void);

void version(void);

int32_t main(int32_t argc, char **argv) {
  int opt;

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
