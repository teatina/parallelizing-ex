## @file Makefile
## @author Tina Eghdam Zamiri
## @date Sep 9, 2022
## @brief Makefile for compiling numerical integration model

CXX = g++
CXXFLAGS = -std=c++14

## build:	compile the code into an executable
build:	numerical_integration_paralelized.cpp ticktock.cc  
	${CXX} ${CXXFLAGS} -fopenmp -o $@ $<


## clean: Remove auto-generated files.
.PHONY: clean
clean:
	rm *.o

PHONY: help
help:	Makefile
	@sed -n 's/^##//p' $<

