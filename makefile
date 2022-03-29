rwildcard = $(foreach d,$(wildcard $(addsuffix *,$(1))),$(call rwildcard,$(d)/,$(2)) $(filter $(subst *,%,$(2)),$(d)))

CXX := 

SRC_DIR := src
OBJ_DIR := out
BIN_DIR := bin
INCLUDE_DIR := include

PNAME := gpx_converter
PROGRAM := $(BIN_DIR)/$(PNAME)

SRCS := $(call rwildcard, $(SRC_DIR)/, *.cpp *.c)
OBJS := $(SRCS:$(SRC_DIR)/%=$(OBJ_DIR)/%.o)

CDEBUG := -g -Og -DDEBUG
LDEBUG := -g
CRELEASE := -O3 -DRELEASE
LRELEASE := 

CPPFLAGS := -I$(INCLUDE_DIR) -MMD -MP
CFLAGS := -Wall
LDFLAGS := -Wall
LDLIBS := 

.PHONY: build rebuild clean

build: $(PROGRAM)

clean:
	del /s /y $(OBJ_DIR)
	del /s /y $(BIN_DIR)

rebuild: build | clean

# NOT FINISHED