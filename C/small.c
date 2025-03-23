#include <stdio.h>
#include <stdbool.h>

int a;

bool foo(){
  return (a == 0);
}

int main(){
  a = 4;
  printf("%b", foo());
}
