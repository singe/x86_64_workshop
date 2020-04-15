int foo(char* a) {
  puts(a);
  return 0;
}

int main() {
  char* a = "Hello World!\n";
  return foo(a);
}
