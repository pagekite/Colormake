# colormake test
# License GNU GPL 3

CXXFLAGS=-Wall

all: src/test.o
	${CXX} ${CXXFLAGS} -o test test.o 

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f *.o 2 > /dev/null
	rm -f test test.exe 2 > /dev/null