PHONY: all

all: infer_mnist
LIBS = -lm -lpng

infer_mnist: main.cpp lenet_mnist.o
	$(CXX) main.cpp lenet_mnist.o -o infer_mnist $(LIBS) $(CXXFLAGS) -fpack-struct=8 -fpermissive

clean:
	rm -rf infer_mnist

test:
	./infer_mnist ../tests/0_1009.png
