CXX=g++
ODIR = ./obj
THRIFT = /usr/bin/thrift

SAI_PREFIX = /usr
SAI_HEADER_DIR ?= $(SAI_PREFIX)/include/sai
SAI_LIBRARY_DIR ?= $(SAI_PREFIX)/lib
SAI_HEADERS = $(SAI_HEADER_DIR)/sai*.h

LIBS = -lthrift -lpthread
LDFLAGS = -L$(SAI_LIBRARY_DIR) -Wl,-rpath=$(SAI_LIBRARY_DIR)
CPPFLAGS = -I$(SAI_HEADER_DIR) -I. -std=c++11
ifeq ($(DEBUG),1)
CPPFLAGS += -O0 -ggdb
endif

ifneq (, $(wildcard /usr/local/bin/ctypesgen))
CTYPESGEN = /usr/local/bin/ctypesgen
else
CTYPESGEN = /usr/local/bin/ctypesgen.py
endif

ifeq ($(platform),vs)
LIBS += -lsaivs -lsaimeta -lsaimetadata -lzmq
else
LIBS += -lsai
endif


CPP_SOURCES = 	gen-cpp/sai_constants.cpp \
				gen-cpp/sai_constants.h \
				gen-cpp/sai_rpc.cpp \
				gen-cpp/sai_rpc.h \
				gen-cpp/sai_types.cpp \
				gen-cpp/sai_types.h

PY_SOURCES = 	gen-py/__init__.py \
				gen-py/switch_sai/constants.py \
				gen-py/switch_sai/__init__.py \
				gen-py/switch_sai/switch_sai_rpc.py \
				gen-py/switch_sai/switch_sai_rpc-remote \
				gen-py/switch_sai/ttypes.py

SAI_PY_HEADERS = gen-py/sai/sai_headers.py

MKDIR_P = mkdir -p
INSTALL := /usr/bin/install

all: directories $(ODIR)/librpcserver.a clientlib saiserver

directories:
	$(MKDIR_P) $(ODIR)

meta:
	make -C  ../../meta

$(CPP_SOURCES): generated/sai.thrift
	$(THRIFT) -o ./ --gen cpp -r $^

$(PY_SOURCES): generated/sai.thrift
	$(THRIFT) -o ./ --gen py -r $^

$(SAI_PY_HEADERS): $(SAI_HEADERS) $(PY_SOURCES)
	$(CTYPESGEN) -I/usr/include -I$(SAI_HEADER_DIR) --include /usr/include/linux/limits.h $^ -o $@

$(ODIR)/%.o: gen-cpp/%.cpp meta
	$(CXX) $(CPPFLAGS) -c $< -o $@  -I../../meta

$(ODIR)/sai_rpc_server.o: sai_rpc_frontend.cpp
	$(CXX) $(CPPFLAGS) -c $^ -o $@ $(CPPFLAGS) -I./gen-cpp -I../../meta -I../../inc -I../../experimental

$(ODIR)/saiserver.o: saiserver.cpp $(CPP_SOURCES) directories
	$(CXX) $(CPPFLAGS) -c saiserver.cpp  -o $@ $(CPPFLAGS) $(CDEFS) -I./gen-cpp -I../../inc

$(ODIR)/librpcserver.a: $(ODIR)/sai_rpc.o $(ODIR)/sai_types.o $(ODIR)/sai_constants.o $(ODIR)/sai_rpc_server.o
	ar rcs $(ODIR)/librpcserver.a $^

clientlib: $(PY_SOURCES) $(SAI_PY_HEADERS)
	python setup.py sdist

saiserver: $(ODIR)/saiserver.o $(ODIR)/librpcserver.a
	$(CXX) $(LDFLAGS) $(ODIR)/sai_rpc_server.o $(ODIR)/saiserver.o -o $@ \
		   $(ODIR)/librpcserver.a $(LIBS)

install-lib: $(ODIR)/librpcserver.a
	$(INSTALL) -D $(ODIR)/librpcserver.a $(DESTDIR)/usr/lib/librpcserver.a
	$(INSTALL) -D saiserver $(DESTDIR)/usr/sbin/saiserver
	$(INSTALL) -D ./switch_sai_rpc_server.h $(DESTDIR)/usr/include/switch_sai_rpc_server.h

install-pylib: clientlib
	cp generated/sai_adapter.py gen-py/sai/
	python setup.py install --prefix $(DESTDIR)/usr/local$(prefix)

install: install-lib install-pylib

clean:
	make -C ../../meta clean
	rm -rf $(ODIR) src dist build saiserver MANIFEST gen-cpp gen-py
