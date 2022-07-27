DIR_SRC := src
DIR_INC := inc
DIR_BIN := bin
DIR_OBJ := obj
APP := SC2Saver
CC := gcc
CC_RES := windres
CFLAGS := -std=c11 -Wall -Wextra -Wpedantic
RESFLAGS := -O coff
DFLAGS := -g -DDEBUG
SFX_DBG := _dbg

FLAGS := $(CFLAGS) -I"$(DIR_INC)"
EXEC := $(DIR_BIN)/$(APP)
EXEC_DBG := $(EXEC)$(SFX_DBG)
DIR_BUILD := $(DIR_BIN) $(DIR_OBJ)
FILE_MAIN := $(DIR_SRC)/main.c

SRC := $(shell find -regex ".*\/$(DIR_SRC)\/.*\.c")
SRC := $(subst ./,,$(SRC))
SRC := $(subst $(FILE_MAIN),,$(SRC))
OBJ := $(patsubst $(DIR_SRC)/%.c,$(DIR_OBJ)/%.o,$(SRC))
OBJ_DBG := $(patsubst %.o,%(SFX_DBG).o,$(OBJ))
RES := $(shell find -regex ".*\/$(DIR_SRC)\/.*\.rc")
RES := $(subst ./,,$(RES))
RES := $(patsubst $(DIR_SRC)/%.rc,$(DIR_OBJ)/%.res,$(RES))
RES_DBG := $(patsubst %.res,%(SFX_DBG).res,$(RES))

.phony: all run debug rundbg clean test
all: $(EXEC)
run: $(EXEC)
	./$<
alldbg: FLAGS += $(DFLAGS)
clean: FORCE
	rm -rf $(DIR_BUILD)
test:
	@echo $(RES)
FORCE:
$(DIR_BUILD):
	mkdir $@
$(DIR_OBJ)/%.o $(DIR_OBJ)/%(SFX_DBG).o: $(DIR_SRC)/%.c | $(DIR_OBJ)
	$(CC) $(FLAGS) -c -o $@ $<
$(DIR_OBJ)/%.res $(DIR_OBJ)/%(SFX_DBT).res: $(DIR_SRC)/%.rc | $(DIR_OBJ)
	$(CC_RES) $(RESFLAGS) -o $@ $<
$(EXEC): $(FILE_MAIN) $(OBJ) $(RES) | $(DIR_BIN)
	$(CC) $(FLAGS) -o $@ $^
$(EXEC_DBG): $(FILE_MAIN) $(OBJ_DBG) $(RES_DBG) | $(DIR_BIN)
	$(CC) $(FLAGS) -o $@ $^
