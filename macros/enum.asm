; Enumerate variables

MACRO enum_start
if _NARG >= 1
__enum__ = \1
else
__enum__ = 0
endc
if _NARG >= 2
__enumdir__ = \2
else
__enumdir__ = +1
endc
ENDM

MACRO enum
if strcmp("\1", "skip")
\1 = __enum__
endc
__enum__ = __enum__ + __enumdir__
ENDM

MACRO enum_set
__enum__ = \1
ENDM


; Enumerate constants

MACRO const_def
const_value = 0
ENDM

MACRO const
if strcmp("\1", "skip")
\1 EQU const_value
endc
const_value = const_value + 1
ENDM

MACRO shift_const
\1 EQU (1 << const_value)
const_value = const_value + 1
ENDM
