#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

FILE *t;

int main() {

  const char format0[] = "%S Sec";
  const char format1[] = "%M:%S Min";
  const char format2[] = "%H:%M:%S Hr";

  /* We will use this format for time *
   * By storing upper formats to it   */
  char format[20];

  /* We will store time in string here */
  char timestr[100];

  /* structure to store time */
  struct tm timer;

  /* some variables to calculate time */
  time_t diff;
  time_t t2;
  time_t t1 = time(NULL);

  while (1) {

    t2 = time(NULL);
    diff = t2 - t1;

    /* Calculate current time */
    gmtime_r(&diff, &timer);

    /* Select the format according to time */
    if (timer.tm_hour > 0)
      strcpy(format, format2);
    else if (timer.tm_min > 0)
      strcpy(format, format1);
    else
      strcpy(format, format0);

    /* Store time in ASCCI */
    strftime(timestr, 100, format, &timer);

    /* Write time to the file */
    FILE *f = fopen("/tmp/timer.txt", "w");
    fprintf(f, "%s\n", timestr);
    fclose(f);

    /* update polybar value */
    system("polybar-msg -p $(pidof polybar) hook timer 1");
    sleep(1);
  }
}
