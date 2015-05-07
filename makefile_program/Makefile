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
LIB = $(addprefix -I, $(LIB_PATH)includes) $(addprefix -L, $(LIB_PATH))
INC = $(addprefix -I, $(INC_PATH))
LDFLAGS = $(LIB) $(LIB_NAMES)
EMPTY =

all: libfoo namemes $(NAME)

$(NAME): $(OBJ)
	@ $(CC) $^ $(LDFLAGS) $(LIB_SUPP) -o $@
	@ echo "\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m\n"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@ echo "\033[4;7mCompiling Objects:\033[0m "
	@ echo -n "\033[37;7m+\033[0m"
	@ mkdir -p $(OBJ_PATH) 2> /dev/null
	@ $(CC) $(CFLAGS) $(LIB) $(INC) -c $< -o $@

ifeq ($(LIB_PATH), $(EMPTY))
else
libfoo:
	@ make -C $(LIB_PATH)
endif

clean:
	@ rm -rf $(OBJ_PATH)
	@ echo "\033[4;7mCleaning:\033[0m [$(NAME)]\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m\n"
ifeq ($(LIB_NAMES), $(EMPTY))
else
	@ make clean -C $(LIB_PATH)
endif

fclean: clean
	@ rm -f $(NAME)
	@ echo "\033[4;7mFcleaning:\033[0m [$(NAME)]\033[0m\n\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m\n"
ifeq ($(LIB_NAMES), $(EMPTY))
else
	@ make fclean -C $(LIB_PATH)
endif

re: fclean all

namemes :
ifeq ($(LIB_NAMES), $(EMPTY))
	@ echo -n "\033[4;7mCompiling:\033[0m [$(NAME)]\n\n"
else
	@ echo -n "\033[4;7mCompiling:\033[0m [$(NAME)]\n\n"
endif

.PHONY: all clean fclean re libfoo