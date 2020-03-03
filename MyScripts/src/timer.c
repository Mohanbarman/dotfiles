#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

FILE *t;

int main() {

  const char format0[] = "%S";
  const char format1[] = "%M:%S";
  const char format2[] = "%H:%M:%S";

  char format[8];

  char timestr[100];
  struct tm timer;

  time_t t1 = 0;

  while (1) {
    t = fopen("/tmp/timer.txt", "w");
    gmtime_r(&t1, &timer);
    strftime(timestr, 100, format, &timer);

    if (timer.tm_hour > 0)
      strcpy(format, format2);
    else if (timer.tm_min > 0)
      strcpy(format, format1);
    else
      strcpy(format, format0);

    fprintf(t, "%s\n", timestr);
    fclose(t);

    system("polybar-msg -p $(pidof polybar) hook timer 1");
    sleep(1);
    t1 ++;
  }
}
