NAME =			a.out

SRC_NAME =		\
				main.c \

CC =			gcc

CFLAGS =		-Wall -Werror -Wextra

#LIB_NAMES =		-lfoo
#LIB_PATH =		./libfoo/

#LIB_SUPP =		-lm

SRC_PATH = 		./srcs/
INC_PATH = 		./includes/
OBJ_PATH =		./obj/

OBJ_NAME = $(SRC_NAME:.c=.o)
SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))
LIB = $(addprefix -L, $(LIB_PATH))
INC = $(addprefix -I, $(INC_PATH))
LDFLAGS = $(LIB) $(LIB_NAMES)
EMPTY =

ifeq ($(LIB_PATH), $(EMPTY))
else
libfoo:
	@ make -C $(LIB_PATH)
endif

all: namemes libfoo $(NAME)

$(NAME): $(OBJ)
	@ $(CC) $(LDFLAGS) $(LIB_SUPP) $^ -o $@
	@ echo "\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@ echo -n "\033[37;7m+\033[0m"
	@ mkdir -p $(OBJ_PATH) 2> /dev/null
	@ $(CC) $(CFLAGS) $(LIB) $(INC) -o $@ -c $<

clean:
	@ rm -rf $(OBJ_PATH)
	@ echo "Cleaning [$(NAME)]\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m"
ifeq ($(LIB_NAMES), $(EMPTY))
else
	@ make clean -C $(LIB_PATH)
endif

fclean: clean
	@ rm -f $(NAME)
	@ echo "Fcleaning [$(NAME)]\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m"
ifeq ($(LIB_NAMES), $(EMPTY))
else
	@ make fclean -C $(LIB_PATH)
endif

re: fclean all

namemes :
	@ echo -n "Compiling [$(NAME)]: "

.PHONY: all clean fclean re libfoo