
# makefile for AmericanOption.cpp under Borland C++

.autodepend
.silent

# Debug version
!ifdef DEBUG
    _D = _d
!endif

# Directories
BOOST_INCLUDE_DIR   = "$(BOOST_DIR)"
QL_INCLUDE_DIR      = "$(QL_DIR)"
QL_LIB_DIR          = "$(QL_DIR)\lib\Win32\Borland"
BCC_INCLUDE         = $(MAKEDIR)\..\include
BCC_LIBS            = $(MAKEDIR)\..\lib

#Warning W8057 : Parameter 'argc' is never used in function main(int,char * *)

# Options
CC_OPTS = -vi- -w-8057 \
    -I$(BOOST_INCLUDE_DIR) \
    -I$(QL_INCLUDE_DIR) \
    -I$(BCC_INCLUDE)

!ifdef DEBUG
CC_OPTS = $(CC_OPTS) -v -DQL_DEBUG
!else
CC_OPTS = $(CC_OPTS) -O2
!endif
!ifdef SAFE
CC_OPTS = $(CC_OPTS) -DQL_EXTRA_SAFETY_CHECKS
!endif

# Primary target:
AmericanOption$(_D).exe: AmericanOption.cpp
    bcc32 $(CC_OPTS) -L$(QL_LIB_DIR) -L$(BCC_LIBS) -o"AmericanOption$(_D).obj" -eAmericanOption$(_D).exe AmericanOption.cpp QuantLib$(_D).lib





# Clean up
clean::
    if exist *.obj   del /q *.obj
    if exist *.tds   del /q *.tds
    if exist *.exe   del /q *.exe
