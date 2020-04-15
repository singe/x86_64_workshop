int foo(int a) {
  int b = a;
  b++;
  return b;
}

int main() {
  int a = 0;
  return foo(a);
}
