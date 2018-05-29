FLAGS=-O1
# list .s source files here
SRCFILES=main.s intadd.s intsub.s intmul.s

all:	intcalc

intcalc: $(SRCFILES) 
	gcc $(FLAGS) -g -o intcalc $^ 

clean: 
	rm -f *.o intcalc

