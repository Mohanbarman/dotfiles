#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>


int main(int argc, char **argv) {

  if (argc < 2 || argc > 2) {
    fprintf(stderr, "usage : toogle-timer <pid of timer>\n");
    exit(1);
  }

  pid_t pid = atoi(argv[1]);

  char path[100];
  sprintf(path, "/proc/%i/status", pid);

  FILE *status = fopen(path, "r");

  char *line = NULL;
  size_t len;

  for (int i = 0; i < 3; i ++)
    getline(&line, &len, status);

  if (strstr(line, "stopped")) {
    printf("continuing..\n");
    execlp("kill", "kill", "-CONT", argv[1], NULL);
  }

  if (strstr(line, "sleeping")) {
    printf("stopping..\n");
    execlp("kill", "kill", "-STOP", argv[1], NULL);
  }
}
