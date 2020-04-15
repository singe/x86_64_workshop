int main() {
  char both[3];
  char a[2] = "a";
  char b[2] = "b";

  both[0] = a[0];
  both[1] = b[0];
  both[2] = '\0';

  puts(both);
  return 0;
}
