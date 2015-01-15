# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fgundlac <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/12/24 18:59:31 by fgundlac          #+#    #+#              #
#    Updated: 2014/10/10 14:06:34 by fgundlac         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		ex00
TYPE =		cpp
CFLAGS =	-Wall -Werror -Wextra

SRC =		\
			main.cpp \
			1.cpp \
			2.cpp \

ifeq ($(TYPE), cpp)
CC = 		g++
else
CC =		clang
endif


PATH_INC =	includes/
PATH_OBJ =	obj
PATH_SRC =	srcs

OBJ = $(patsubst %.$(TYPE), $(PATH_OBJ)/%.o, $(SRC))

all: $(NAME)

N := X
C = $(words $N)$(eval N := x $N)
T = $(shell ls -1 $(PATH_SRC) | wc -l)

ECHO = echo "\t`expr " [\`expr $C '*' 100 / $T\`" : '.*\(....\)$$'`%]"

$(NAME): namemes $(OBJ)
	@ $(CC) $(OBJ) $(CFLAGS) $(LFLAGS) -I $(PATH_INC) -o $(NAME)
	@ echo "\t\033[4m\033[95mD\033[93mo\033[32mn\033[96me \033[91m!\033[0m"

$(PATH_OBJ)/%.o: $(addprefix $(PATH_SRC)/, %.$(TYPE))
	@ $(ECHO)
	@ mkdir -p $(PATH_OBJ)
	@ $(CC) -c $^ -I $(PATH_INC) $(CFLAGS) -o $@

clean:
	@ rm -rf $(PATH_OBJ)
	@ echo "Cleaning $(NAME) \
\t\t\033[4m\033[95mD\033[93mo\033[32mn\033[96me \033[91m!\033[0m"

fclean: clean
	@ rm -rf $(NAME)
	@ echo "Full Cleaning $(NAME) \
\t\033[4m\033[95md\033[93mo\033[32mn\033[96me \033[91m!\033[0m"

namemes :
	@ echo Compiling $(NAME)

re: fclean all

.PHONY: clean fclean re
