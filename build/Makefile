SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)
EXECUTABLES = $(OBJECTS:.o=)

# Generic rule
# $< is the first dependency name
# $@ is the target filename
%.o: %.s
	as $< -o $@

default: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
	  ld -dynamic-linker /lib/ld-musl-x86_64.so.1 -lc $$exe.o -o $$exe ; \
	done

.PHONY: clean
clean:
	rm *.o
	for exe in $(EXECUTABLES) ; do \
	  rm $$exe ; \
	done

