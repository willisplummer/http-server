CC = zig cc

CFLAGS = -Wall -Wextra -O2 -std=c99

TARGET = program

SRCS = main.c

OBJS = $(SRCS:.c=.o)

JSONS = $(SRCS:.c=.o.json)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -MJ $@.json -c $< -o $@

# Generate compile_commands.json
# compile_commands.json: $(JSONS)
# 	echo '[' > $@
# 	cat $(JSONS) | sed 's/$$/,/' >> $@
# 	echo ']' >> $@
# 	sed -i '$$s/,$$//' $@  # Remove trailing comma

compile_commands.json: $(JSONS)
	@echo "Generating compile_commands.json..."
	@echo '[' > $@
	@if [ -n "$(JSONS)" ]; then \
		for json in $(JSONS); do \
			echo "Adding $$json..."; \
			cat $$json >> $@; \
			echo ',' >> $@; \
		done; \
		sed -i '$$d' $@;  # Remove the last comma \
	else \
		echo "No .o.json files found!"; \
	fi
	@echo ']' >> $@
	@echo "compile_commands.json generated."

clean:
	rm -f $(OBJS) $(TARGET) $(JSONS) compile_commands.json

.PHONY: all clean
