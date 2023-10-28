ARCH := $(shell uname -m)
OS := $(shell uname -s)

ifeq ($(OS), Darwin)
    TARGET = mac
else ifeq ($(OS), Linux)
    TARGET = linux
else
    $(error Unsupported operating system: $(OS))
endif