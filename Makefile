# all:test1.out

# test1.out: main.o add.o add2.o add3.o
# 	g++ -o $@ $^  #@----no output
#main.o:main.cpp add.h add2.h add3.h
# 	@g++ -c -o $@ $<
# add.o: add.cpp add.h
# 	@g++ -c -o $@ $<
# add2.o: add2.o add2.h
# 	@g++ -c -o $
# %.o: %.c %.h
# 	g++ -c -o $@ $<
# clean:
# 	rm *.o *.out
# target: dependences
#   what to do
# in what to do : $@ ----->target  $^ ----->dependences  $< ----->the first dependence


BUILD_PATH=./build_make/
SRC_PATH=./
LIB_SRCS_FILES=add.cpp
LIB_SRCS_FILES+=add2.cpp
LIB_SRCS_FILES+=add3.cpp

LIB_OBJ_FILES= $(LIB_SRCS_FILES:%.cpp=%.o)

LIB_OBJ=$(addprefix $(BUILD_PATH),$(LIB_OBJ_FILES))

OUT=test1.out

C_FLAGS="-O3"
LD_FLAGS=

all:$(OUT)
$(BUILD_PATH):
	mkdir $(BUILD_PATH)

$(OUT): $(BUILD_PATH) $(LIB_OBJ) $(SRC_PATH)main.cpp
	g++ $(C_FLAGS) $(LD_FLAGS) -o $@ $(LIB_OBJ) $(SRC_PATH)main.cpp
$(BUILD_PATH)%.o:$(SRC_PATH)%.cpp
	g++  $(C_FLAGS) -c -o $@ $^

clean:
	rm -r $(BUILD_PATH)
	rm $(OUT)
