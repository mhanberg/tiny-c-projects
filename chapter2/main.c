#include <stdio.h>
#include <time.h>

int moon_phase(int year, int month, int day) {
  int d, g, e;

  d = day;
  if (month == 2)
    d += 31;
  else if (month > 2)
    d += 59 + (month - 3) * 30.6 + 0.5;
  g = (year - 1900) % 19;
  e = (11 * g + 29) % 30;
  if (e == 25 || e == 24)
    ++e;
  return ((((e + d) * 6 + 5) % 177) / 22 & 7);
}

int main(int argc, char *argv[]) {
  time_t now;
  struct tm *clock;
  int hour;

  time(&now);
  clock = localtime(&now);
  hour = clock->tm_hour;

  printf("Good ");

  if (hour < 12) {
    printf("morning");
  } else if (hour < 17) {
    printf("afternoon");
  } else {
    printf("evening");
  }
  if (argc > 1) {
    printf(", %s!\n", argv[1]);
  } else {
    puts(", unknown traveler!");
  }

  char time_string[64];
  strftime(time_string, 64, "Today is %A, %B, %d, %Y at %r%n", clock);

  printf("%s", time_string);
  char *phase[8] = {
      "waxing crescent", "at first quarter", "waxing gibbous",  "full",
      "waning gibbous",  "at last quarter",  "waning crescent", "new"};

  int mp = moon_phase(clock->tm_year + 1900, clock->tm_mon, clock->tm_mday);

  printf("The moon is %s\n", phase[mp]);

  return (0);
}
