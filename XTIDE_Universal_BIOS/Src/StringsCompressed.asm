;;;======================================================================
;;;
;;; This file is generated by StringsCompress.pl from source in Strings.asm
;;; DO NOT EDIT DIRECTLY - See the makefile for how to rebuild this file.
;;; This file only needs to be rebuilt if Strings.asm is changed.
;;;
;;;======================================================================

%ifdef STRINGSCOMPRESSED_STRINGS

; Project name	:	XTIDE Universal BIOS
; Description	:	Strings and equates for BIOS messages.

;
; XTIDE Universal BIOS and Associated Tools
; Copyright (C) 2009-2010 by Tomi Tilli, 2011-2013 by XTIDE Universal BIOS Team.
;
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; Visit http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
;

%ifdef MODULE_STRINGS_COMPRESSED_PRECOMPRESS
%include "Display.inc"
%endif

; Section containing code
SECTION .text

; The following strings are used by DetectPrint_StartDetectWithMasterOrSlaveStringInCXandIdeVarsInCSBP
; To support an optimization in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szDetectStart:
g_szDetectMaster:		; db	"Master",NULL
                 		; db	 4dh,  61h,  73h,  74h,  65h,  72h,  00h    ; uncompressed
                 		  db	 53h,  67h,  79h,  7ah,  6bh, 0b8h          ; compressed

g_szDetectSlave:		; db	"Slave ",NULL
                		; db	 53h,  6ch,  61h,  76h,  65h,  20h,  00h    ; uncompressed
                		  db	 59h,  72h,  67h,  7ch,  6bh,  00h          ; compressed

g_szDetectOuter:		; db	"%s at %s: ",NULL
                		; db	 25h,  73h,  20h,  61h,  74h,  20h,  25h,  73h,  3ah,  20h,  00h    ; uncompressed
                		  db	 3dh,  20h,  67h, 0fah,  3dh,  40h,  00h                            ; compressed

%ifdef MODULE_SERIAL
g_szDetectCOM:			; db	"COM%c%s",NULL
              			; db	 43h,  4fh,  4dh,  25h,  63h,  25h,  73h,  00h    ; uncompressed
              			  db	 49h,  55h,  53h,  3ch,  1dh                      ; compressed

g_szDetectCOMAuto:		; db	" Detect",NULL
                  		; db	 20h,  44h,  65h,  74h,  65h,  63h,  74h,  00h    ; uncompressed
                  		  db	 20h,  4ah,  6bh,  7ah,  6bh,  69h, 0bah          ; compressed

g_szDetectCOMSmall:		; db	"/%u%u00",NULL					; IDE Master at COM1/9600:
                   		; db	 2fh,  25h,  75h,  25h,  75h,  30h,  30h,  00h    ; uncompressed
                   		  db	 2ah,  35h,  35h,  33h,  13h                      ; compressed

g_szDetectCOMLarge:		; db	"/%u.%uK",NULL					; IDE Master at COM1/19.2K:
                   		; db	 2fh,  25h,  75h,  2eh,  25h,  75h,  4bh,  00h    ; uncompressed
                   		  db	 2ah,  35h,  29h,  35h,  91h                      ; compressed

%endif
g_szDetectEnd:
g_szDetectPort:			; db	"%x",NULL						; IDE Master at 1F0h:
               			; db	 25h,  78h,  00h    ; uncompressed
               			  db	 17h                ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szDetectEnd-$$) & 0xff00) <> ((g_szDetectStart-$$) & 0xff00)
%error "g_szDetect* strings must start on the same 256 byte page, required by DetectPrint_StartDetectWithMasterOrSlaveStringInCXandIdeVarsInCSBP.  Please move this block up or down within Strings.asm"
%endif
%endif


; POST drive detection strings
g_szDashForZero:	; db	"- ",NULL	; Required by Display Library
                	; db	 2dh,  20h,  00h    ; uncompressed
                	  db	 28h,  00h          ; compressed

g_szRomAt:			; db	LF,CR
          			; db	 0ah,  0dh    ; uncompressed
          			  db	 39h          ; compressed

	; db	"%s @ %x",LF,CR						; -=XTIDE ... =- @ Segment
	; db	 25h,  73h,  20h,  40h,  20h,  25h,  78h,  0ah,  0dh    ; uncompressed
	  db	 3dh,  20h, 0c6h,  37h,  39h                            ; compressed

	; db	"%s",LF,CR							; version string
	; db	 25h,  73h,  0ah,  0dh    ; uncompressed
	  db	 3dh,  39h                ; compressed

	; db	"Released under GNU GPL v2",LF,CR
	; db	 52h,  65h,  6ch,  65h,  61h,  73h,  65h,  64h,  20h,  75h,  6eh,  64h,  65h,  72h,  20h,  47h,  4eh,  55h,  20h,  47h,  50h,  4ch,  20h,  76h,  32h,  0ah,  0dh    ; uncompressed
	  db	 58h,  6bh,  72h,  6bh,  67h,  79h,  6bh, 0eah,  7bh,  74h,  6ah,  6bh, 0f8h,  4dh,  54h, 0dbh,  4dh,  56h, 0d2h,  7ch,  2ch,  39h                                  ; compressed

	; db	LF,CR,NULL
	; db	 0ah,  0dh,  00h    ; uncompressed
	  db	 19h                ; compressed

%ifdef MODULE_BOOT_MENU
g_szBootMenuTitle:	; db	"%s%c",LF,CR						; -=XTIDE ... =- and null (eaten)
                  	; db	 25h,  73h,  25h,  63h,  0ah,  0dh    ; uncompressed
                  	  db	 3dh,  3ch,  39h                      ; compressed

	; db	"%s",NULL							; version string
	; db	 25h,  73h,  00h    ; uncompressed
	  db	 1dh                ; compressed

%endif
g_szDriveName:		; db	"%z",LF,CR,NULL
              		; db	 25h,  7ah,  0ah,  0dh,  00h    ; uncompressed
              		  db	 3eh,  19h                      ; compressed



; Boot loader strings
g_szTryToBoot:			; db	"Booting %c",ANGLE_QUOTE_RIGHT,"%c",LF,CR,NULL
              			; db	 42h,  6fh,  6fh,  74h,  69h,  6eh,  67h,  20h,  25h,  63h, 0afh,  25h,  63h,  0ah,  0dh,  00h    ; uncompressed
              			  db	 48h,  75h,  75h,  7ah,  6fh,  74h, 0edh,  3ch,  24h,  3ch,  19h                                  ; compressed

g_szBootSectorNotFound:	; db	"Boot sector " 			; String fall through...
                       	; db	 42h,  6fh,  6fh,  74h,  20h,  73h,  65h,  63h,  74h,  6fh,  72h,  20h    ; uncompressed
                       	  db	 48h,  75h,  75h, 0fah,  79h,  6bh,  69h,  7ah,  75h, 0f8h                ; compressed

g_szNotFound:			; db	"not found",LF,CR,NULL
             			; db	 6eh,  6fh,  74h,  20h,  66h,  6fh,  75h,  6eh,  64h,  0ah,  0dh,  00h    ; uncompressed
             			  db	 74h,  75h, 0fah,  6ch,  75h,  7bh,  74h,  6ah,  19h                      ; compressed

g_szReadError:			; db	"Error %x!",LF,CR,NULL
              			; db	 45h,  72h,  72h,  6fh,  72h,  20h,  25h,  78h,  21h,  0ah,  0dh,  00h    ; uncompressed
              			  db	 4bh,  78h,  78h,  75h, 0f8h,  37h,  25h,  19h                            ; compressed



%ifdef MODULE_HOTKEYS
; Hotkey Bar strings
g_szFDD:				; db	"FDD [%c]",NULL			; "FDD [A]"
        				; db	 46h,  44h,  44h,  20h,  5bh,  25h,  63h,  5dh,  00h    ; uncompressed
        				  db	 4ch,  4ah, 0cah,  61h,  3ch, 0a3h                      ; compressed

g_szHDD:				; db	"HDD [%c]",NULL			; "HDD [C]"
        				; db	 48h,  44h,  44h,  20h,  5bh,  25h,  63h,  5dh,  00h    ; uncompressed
        				  db	 4eh,  4ah, 0cah,  61h,  3ch, 0a3h                      ; compressed

%ifdef MODULE_BOOT_MENU
g_szBootMenu:			; db	"BootMnu%c",NULL		; "BootMnu", location of %c doesn't matter
             			; db	 42h,  6fh,  6fh,  74h,  4dh,  6eh,  75h,  25h,  63h,  00h    ; uncompressed
             			  db	 48h,  75h,  75h,  7ah,  53h,  74h,  7bh,  1ch                ; compressed

%endif ; MODULE_BOOT_MENU
g_szHotkey:				; db	"%A%c%c%A%s%A ",NULL	; "C�HDD [A] ", "F2BootMnu " or "F8RomBoot "
           				; db	 25h,  41h,  25h,  63h,  25h,  63h,  25h,  41h,  25h,  73h,  25h,  41h,  20h,  00h    ; uncompressed
           				  db	 3bh,  3ch,  3ch,  3bh,  3dh,  3bh,  00h                                              ; compressed

%ifdef MODULE_SERIAL
g_szHotComDetect:		; db	"ComDtct%c",NULL		; "ComDtct", location of %c doesn't matter
                 		; db	 43h,  6fh,  6dh,  44h,  74h,  63h,  74h,  25h,  63h,  00h    ; uncompressed
                 		  db	 49h,  75h,  73h,  4ah,  7ah,  69h,  7ah,  1ch                ; compressed

%endif ; MODULE_SERIAL
%endif ; MODULE_HOTKEYS

%ifdef MODULE_BOOT_MENU
g_szRomBootDash:		; db	" -  "					; String fall through to g_szRomBoot
                		; db	 20h,  2dh,  20h,  20h    ; uncompressed
                		  db	 20h,  28h,  20h,  20h    ; compressed

%endif
%ifdef MODULE_HOTKEYS OR MODULE_BOOT_MENU
g_szRomBoot:			; db	"Rom%cBoot",NULL		; "RomBoot" or "Rom Boot"
            			; db	 52h,  6fh,  6dh,  25h,  63h,  42h,  6fh,  6fh,  74h,  00h    ; uncompressed
            			  db	 58h,  75h,  73h,  3ch,  48h,  75h,  75h, 0bah                ; compressed

%endif


%ifdef MODULE_BOOT_MENU
; Boot Menu Floppy Disk strings
;
; The following strings are used by BootMenuPrint_RefreshInformation
; To support optimizations in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szFddStart:
g_szFddUnknown:		; db	"Unknown",NULL
               		; db	 55h,  6eh,  6bh,  6eh,  6fh,  77h,  6eh,  00h    ; uncompressed
               		  db	 5bh,  74h,  71h,  74h,  75h,  7dh, 0b4h          ; compressed

g_szFddSizeOr:		; db	"5",ONE_QUARTER,QUOTATION_MARK," or 3",ONE_HALF,QUOTATION_MARK," DD",NULL
              		; db	 35h, 0ach,  22h,  20h,  6fh,  72h,  20h,  33h, 0abh,  22h,  20h,  44h,  44h,  00h    ; uncompressed
              		  db	 2eh,  21h,  26h,  20h,  75h, 0f8h,  2dh,  22h,  26h,  20h,  4ah,  8ah                ; compressed

g_szFddSize:		; db	"%s",QUOTATION_MARK,", %u kiB",NULL	; 3�", 1440 kiB
            		; db	 25h,  73h,  22h,  2ch,  20h,  25h,  75h,  20h,  6bh,  69h,  42h,  00h    ; uncompressed
            		  db	 3dh,  26h,  27h,  20h,  35h,  20h,  71h,  6fh,  88h                      ; compressed

g_szFddThreeHalf:	; db	"3",ONE_HALF,NULL
                 	; db	 33h, 0abh,  00h    ; uncompressed
                 	  db	 2dh,  02h          ; compressed

g_szFddEnd:
g_szFddFiveQuarter:	; db	"5",ONE_QUARTER,NULL
                   	; db	 35h, 0ach,  00h    ; uncompressed
                   	  db	 2eh,  01h          ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szFddStart-$$) & 0xff00) <> ((g_szFddEnd-$$) & 0xff00)
%error "g_szFdd* strings must start on the same 256 byte page, required by the BootMenuPrint_RefreshInformation routines for floppy drives.  Please move this block up or down within Strings.asm"
%endif
%endif


g_szAddressingModes:
g_szNORMAL:		; db	"NORMAL",NULL
           		; db	 4eh,  4fh,  52h,  4dh,  41h,  4ch,  00h    ; uncompressed
           		  db	 54h,  55h,  58h,  53h,  47h,  92h          ; compressed

g_szLARGE:		; db	"LARGE ",NULL
          		; db	 4ch,  41h,  52h,  47h,  45h,  20h,  00h    ; uncompressed
          		  db	 52h,  47h,  58h,  4dh,  4bh,  00h          ; compressed

g_szLBA:		; db	"LBA   ",NULL
        		; db	 4ch,  42h,  41h,  20h,  20h,  20h,  00h    ; uncompressed
        		  db	 52h,  48h, 0c7h,  20h,  00h                ; compressed

g_szAddressingModes_Displacement equ (g_szLARGE - g_szAddressingModes)
;
; Ensure that addressing modes are correctly spaced in memory
;
%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if g_szNORMAL <> g_szAddressingModes
%error "g_szAddressingModes Displacement Incorrect 1"
%endif
%if g_szLARGE <> g_szNORMAL + g_szAddressingModes_Displacement
%error "g_szAddressingModes Displacement Incorrect 2"
%endif
%if g_szLBA <> g_szLARGE + g_szAddressingModes_Displacement
%error "g_szAddressingModes Displacement Incorrect 3"
%endif
%endif


g_szDeviceTypeValues:
g_szDeviceTypeValues_16bit:		; db	" 16",NULL
                           		; db	 20h,  31h,  36h,  00h    ; uncompressed
                           		  db	 20h,  2bh,  0fh          ; compressed

g_szDeviceTypeValues_32bit:		; db	" 32",NULL
                           		; db	 20h,  33h,  32h,  00h    ; uncompressed
                           		  db	 20h,  2dh,  0ch          ; compressed

g_szDeviceTypeValues_8bit:		; db	"  8",NULL
                          		; db	 20h,  20h,  38h,  00h    ; uncompressed
                          		  db	 20h,  20h,  10h          ; compressed

g_szDeviceTypeValues_XTIDEr1:	; db	"D8 ",NULL	; Dual 8-bit
                             	; db	 44h,  38h,  20h,  00h    ; uncompressed
                             	  db	 4ah,  30h,  00h          ; compressed

g_szDeviceTypeValues_XTIDEr2:	; db	"X8 ",NULL	; A0<->A3 swapped 8-bit
                             	; db	 58h,  38h,  20h,  00h    ; uncompressed
                             	  db	 5eh,  30h,  00h          ; compressed

g_szDeviceTypeValues_XTCFpio8:	; db	"T8 ",NULL	; True 8-bit
                              	; db	 54h,  38h,  20h,  00h    ; uncompressed
                              	  db	 5ah,  30h,  00h          ; compressed

g_szDeviceTypeValues_XTCFdma:	; db	"8MA",NULL	; DMA 8-bit
                             	; db	 38h,  4dh,  41h,  00h    ; uncompressed
                             	  db	 30h,  53h,  87h          ; compressed

g_szDeviceTypeValues_XTCFmem:	; db	"M8 ",NULL	; Memory Mapped 8-bit
                             	; db	 4dh,  38h,  20h,  00h    ; uncompressed
                             	  db	 53h,  30h,  00h          ; compressed

g_szDeviceTypeValues_JrIde:		; db	"M8 ",NULL
                           		; db	 4dh,  38h,  20h,  00h    ; uncompressed
                           		  db	 53h,  30h,  00h          ; compressed

g_szDeviceTypeValues_ADP50L:	; db	"M8 ",NULL
                            	; db	 4dh,  38h,  20h,  00h    ; uncompressed
                            	  db	 53h,  30h,  00h          ; compressed

g_szDeviceTypeValues_Serial:	; db	"SER",NULL
                            	; db	 53h,  45h,  52h,  00h    ; uncompressed
                            	  db	 59h,  4bh,  98h          ; compressed


g_szDeviceTypeValues_Displacement equ (g_szDeviceTypeValues_32bit - g_szDeviceTypeValues)
;
; Ensure that device type strings are correctly spaced in memory
;
%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if g_szDeviceTypeValues_16bit <> g_szDeviceTypeValues
%error "g_szDeviceTypeValues Displacement Incorrect 1"
%endif
%if g_szDeviceTypeValues_32bit <> g_szDeviceTypeValues_16bit + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 2"
%endif
%if g_szDeviceTypeValues_8bit <> g_szDeviceTypeValues_32bit + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 2"
%endif
%if g_szDeviceTypeValues_XTIDEr1 <> g_szDeviceTypeValues_8bit + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 3"
%endif
%if g_szDeviceTypeValues_XTIDEr2 <> g_szDeviceTypeValues_XTIDEr1 + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 4"
%endif
%if g_szDeviceTypeValues_XTCFpio8 <> g_szDeviceTypeValues_XTIDEr2 + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 5"
%endif
%if g_szDeviceTypeValues_XTCFdma <> g_szDeviceTypeValues_XTCFpio8 + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 6"
%endif
%if g_szDeviceTypeValues_XTCFmem <> g_szDeviceTypeValues_XTCFdma + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 7"
%endif
%if g_szDeviceTypeValues_JrIde <> g_szDeviceTypeValues_XTCFmem + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 8"
%endif
%if g_szDeviceTypeValues_ADP50L <> g_szDeviceTypeValues_JrIde + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 9"
%endif
%if g_szDeviceTypeValues_Serial <> g_szDeviceTypeValues_ADP50L + g_szDeviceTypeValues_Displacement
%error "g_szDeviceTypeValues Displacement Incorrect 10"
%endif
%endif


g_szSelectionTimeout:	; db	DOUBLE_BOTTOM_LEFT_CORNER,DOUBLE_LEFT_HORIZONTAL_TO_SINGLE_VERTICAL,"%ASelection in %2-u s",NULL
                     	; db	0c8h, 0b5h,  25h,  41h,  53h,  65h,  6ch,  65h,  63h,  74h,  69h,  6fh,  6eh,  20h,  69h,  6eh,  20h,  25h,  32h,  2dh,  75h,  20h,  73h,  00h    ; uncompressed
                     	  db	 31h,  32h,  3bh,  59h,  6bh,  72h,  6bh,  69h,  7ah,  6fh,  75h, 0f4h,  6fh, 0f4h,  3ah,  20h, 0b9h                                              ; compressed



; Boot Menu menuitem strings
;
; The following strings are used by BootMenuPrint_* routines.
; To support optimizations in that code, these strings must start on the same 256 byte page,
; which is checked at assembly time below.
;
g_szDriveNumSpace:		; db	" "							; leading space, used if drive number is less than 0fh
                  		; db	 20h    ; uncompressed
                  		  db	 20h    ; compressed

; must come immediately before g_szDriveNum!
g_szBootMenuPrintStart:
g_szDriveNum:			; db	"%x %s",NULL
             			; db	 25h,  78h,  20h,  25h,  73h,  00h    ; uncompressed
             			  db	 37h,  20h,  1dh                      ; compressed

g_szDriveNumBNSpace:	; db	" "							; leading space, used if drive number is less than 0fh
                    	; db	 20h    ; uncompressed
                    	  db	 20h    ; compressed

; must come immediately before g_szDriveNumBOOTNFO!
g_szDriveNumBOOTNFO:	; db	"%x %z",NULL
                    	; db	 25h,  78h,  20h,  25h,  7ah,  00h    ; uncompressed
                    	  db	 37h,  20h,  1eh                      ; compressed

g_szFloppyDrv:			; db	"Floppy Drive %c",NULL
              			; db	 46h,  6ch,  6fh,  70h,  70h,  79h,  20h,  44h,  72h,  69h,  76h,  65h,  20h,  25h,  63h,  00h    ; uncompressed
              			  db	 4ch,  72h,  75h,  76h,  76h, 0ffh,  4ah,  78h,  6fh,  7ch, 0ebh,  1ch                            ; compressed

g_szBootMenuPrintEnd:
g_szForeignHD:			; db	"Foreign Hard Disk",NULL
              			; db	 46h,  6fh,  72h,  65h,  69h,  67h,  6eh,  20h,  48h,  61h,  72h,  64h,  20h,  44h,  69h,  73h,  6bh,  00h    ; uncompressed
              			  db	 4ch,  75h,  78h,  6bh,  6fh,  6dh, 0f4h,  4eh,  67h,  78h, 0eah,  4ah,  6fh,  79h, 0b1h                      ; compressed


%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if ((g_szBootMenuPrintStart-$$) & 0xff00) <> ((g_szBootMenuPrintEnd-$$) & 0xff00)
%error "g_szBootMenuPrint* strings must start on the same 256 byte page, required by the BootMenuPrint_* routines.  Please move this block up or down within Strings.asm"
%endif
%if g_szDriveNumSpace+1 != g_szDriveNum || g_szDriveNumBNSpace+1 != g_szDriveNumBOOTNFO
%error "g_szDriveNumSpace or g_szDriveNumBNSpace are out of position"
%endif
%endif


; Boot Menu information strings
g_szCapacity:			; db	"Capacity : %s",NULL
             			; db	 43h,  61h,  70h,  61h,  63h,  69h,  74h,  79h,  20h,  3ah,  20h,  25h,  73h,  00h    ; uncompressed
             			  db	 49h,  67h,  76h,  67h,  69h,  6fh,  7ah, 0ffh, 0c0h,  1dh                            ; compressed

g_szCapacityNum:		; db	"%5-u.%u %ciB",NULL
                		; db	 25h,  35h,  2dh,  75h,  2eh,  25h,  75h,  20h,  25h,  63h,  69h,  42h,  00h    ; uncompressed
                		  db	 36h,  29h,  35h,  20h,  3ch,  6fh,  88h                                        ; compressed

g_szInformation:		; db	"%s",LF,CR
                		; db	 25h,  73h,  0ah,  0dh    ; uncompressed
                		  db	 3dh,  39h                ; compressed

	; db	"Addr. ",SINGLE_VERTICAL,"Block",SINGLE_VERTICAL,"Bus",SINGLE_VERTICAL,"IRQ",SINGLE_VERTICAL,"Reset",LF,CR
	; db	 41h,  64h,  64h,  72h,  2eh,  20h, 0b3h,  42h,  6ch,  6fh,  63h,  6bh, 0b3h,  42h,  75h,  73h, 0b3h,  49h,  52h,  51h, 0b3h,  52h,  65h,  73h,  65h,  74h,  0ah,  0dh    ; uncompressed
	  db	 47h,  6ah,  6ah,  78h,  29h,  20h,  23h,  48h,  72h,  75h,  69h,  71h,  23h,  48h,  7bh,  79h,  23h,  4fh,  58h,  57h,  23h,  58h,  6bh,  79h,  6bh,  7ah,  39h          ; compressed

	; db	"%s",SINGLE_VERTICAL,"%5-u",SINGLE_VERTICAL,"%s",SINGLE_VERTICAL," %2-I",SINGLE_VERTICAL,"%5-x",NULL
	; db	 25h,  73h, 0b3h,  25h,  35h,  2dh,  75h, 0b3h,  25h,  73h, 0b3h,  20h,  25h,  32h,  2dh,  49h, 0b3h,  25h,  35h,  2dh,  78h,  00h    ; uncompressed
	  db	 3dh,  23h,  36h,  23h,  3dh,  23h,  20h,  34h,  23h,  18h                                                                            ; compressed


%endif ; MODULE_BOOT_MENU


;------------------------------------------------------------------------------------------
;
; Tables for StringsCompress.pl
;
; Items can be added and removed from this table as needed, with the following rules:
;  * Formats follow the special characters.  But other than that, order makes no difference.
;  * Some of the formats require "even" and "odd" numbering.  Even tells the code that
;    it is a "number-" format, otherwise it doesn't interpret a number first.  The easiest
;    way to maintain this is to move one of the "n/a" items to/from the front of the format
;    list to maintain the even/odd.
;  * Values do not need to remain consistent across versions.  This table is only used
;    internally to this file.
;  * There can only be 32 of these (0-31).
;  * Keeping the list short is good - this translates to a table in the compressed version.
;    An error will be reported if a character or format is no longer being used by any
;    strings above.
;  * Please keep items sequential for ease of further editing.
;
;$translate{ord(' ')} = 0;    [StringsCompress Processed]
;$translate{172}      = 1;     # ONE_QUARTER    [StringsCompress Processed]
;$translate{171}      = 2;     # ONE_HALF    [StringsCompress Processed]
;$translate{179}      = 3;     # SINGLE_VERTICAL    [StringsCompress Processed]
;$translate{175}      = 4;     # ANGLE_QUOTE_RIGHT    [StringsCompress Processed]
;$translate{ord('!')} = 5;    [StringsCompress Processed]
;$translate{ord('"')} = 6;    [StringsCompress Processed]
;$translate{ord(',')} = 7;    [StringsCompress Processed]
;$translate{ord('-')} = 8;    [StringsCompress Processed]
;$translate{ord('.')} = 9;    [StringsCompress Processed]
;$translate{ord('/')} = 10;    [StringsCompress Processed]
;$translate{ord('1')} = 11;    [StringsCompress Processed]
;$translate{ord('2')} = 12;    [StringsCompress Processed]
;$translate{ord('3')} = 13;    [StringsCompress Processed]
;$translate{ord('5')} = 14;    [StringsCompress Processed]
;$translate{ord('6')} = 15;    [StringsCompress Processed]
;$translate{ord('8')} = 16;    [StringsCompress Processed]
;$translate{200}      = 17;    # DOUBLE_BOTTOM_LEFT_CORNER    [StringsCompress Processed]
;$translate{181}      = 18;    # DOUBLE_LEFT_HORIZONTAL_TO_SINGLE_VERTICAL    [StringsCompress Processed]
;$translate{ord('0')} = 19;    [StringsCompress Processed]
;
; Formats begin immediately after the last Translated character (they are in the same table)
;
;$format_begin = 20;    [StringsCompress Processed]
;
;$format{"2-I"} = 20;        # must be even    [StringsCompress Processed]
;$format{"u"}   = 21;        # must be odd    [StringsCompress Processed]
;$format{"5-u"} = 22;        # must be even    [StringsCompress Processed]
;$format{"x"}   = 23;        # must be odd    [StringsCompress Processed]
;$format{"5-x"} = 24;        # must be even    [StringsCompress Processed]
;$format{"nl"}  = 25;        # n/a    [StringsCompress Processed]
;$format{"2-u"} = 26;        # must be even    [StringsCompress Processed]
;$format{"A"}   = 27;        # n/a    [StringsCompress Processed]
;$format{"c"}   = 28;        # n/a    [StringsCompress Processed]
;$format{"s"}   = 29;        # n/a, normal string from DS    [StringsCompress Processed]
;$format{"z"}   = 30;        # n/a, boot string from BDA    [StringsCompress Processed]
;
; NOTE: The last $format cannot exceed 31 (stored in a 5-bit quantity).
;
; Starting point for the "normal" range, typically around 0x40 to cover upper and lower case
; letters.  If lower case 'z' is not used, 0x3a can be a good choice as it adds ':' to the
; front end.
;
;$normal_base = 0x3a;    [StringsCompress Processed]
;
; End of StringsCompress.pl information
;
;;; end of input stream

%endif ; STRINGSCOMPRESSED_STRINGS

%ifdef STRINGSCOMPRESSED_TABLES

StringsCompressed_NormalBase     equ   58

StringsCompressed_FormatsBegin   equ   20

StringsCompressed_TranslatesAndFormats:
        db     32  ; 0
        db     172  ; 1
        db     171  ; 2
        db     179  ; 3
        db     175  ; 4
        db     33  ; 5
        db     34  ; 6
        db     44  ; 7
        db     45  ; 8
        db     46  ; 9
        db     47  ; 10
        db     49  ; 11
        db     50  ; 12
        db     51  ; 13
        db     53  ; 14
        db     54  ; 15
        db     56  ; 16
        db     200  ; 17
        db     181  ; 18
        db     48  ; 19
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_I)    ; 20
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_u)    ; 21
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_u)    ; 22
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_x)    ; 23
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_x)    ; 24
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_nl)    ; 25
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_u)    ; 26
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_A)    ; 27
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_c)    ; 28
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_s)    ; 29
        db     (DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_z)    ; 30

%ifndef CHECK_FOR_UNUSED_ENTRYPOINTS
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_2_I || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_I > 255
%error "DisplayFormatCompressed_Format_2_I is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_u > 255
%error "DisplayFormatCompressed_Format_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_5_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_u > 255
%error "DisplayFormatCompressed_Format_5_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_x || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_x > 255
%error "DisplayFormatCompressed_Format_x is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_5_x || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_5_x > 255
%error "DisplayFormatCompressed_Format_5_x is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_nl || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_nl > 255
%error "DisplayFormatCompressed_Format_nl is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_2_u || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_2_u > 255
%error "DisplayFormatCompressed_Format_2_u is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_A || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_A > 255
%error "DisplayFormatCompressed_Format_A is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_c || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_c > 255
%error "DisplayFormatCompressed_Format_c is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_s || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_s > 255
%error "DisplayFormatCompressed_Format_s is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%if DisplayFormatCompressed_BaseFormatOffset < DisplayFormatCompressed_Format_z || DisplayFormatCompressed_BaseFormatOffset - DisplayFormatCompressed_Format_z > 255
%error "DisplayFormatCompressed_Format_z is out of range of DisplayFormatCompressed_BaseFormatOffset"
%endif
%endif

;; translated usage stats
;; 33:1
;; 32:35
;; 181:1
;; 53:2
;; 48:2
;; 200:1
;; 46:3
;; 179:8
;; 44:1
;; 50:2
;; 51:3
;; 47:2
;; 172:2
;; 34:3
;; 49:1
;; 56:8
;; 45:2
;; 175:1
;; 171:2
;; 54:1
;; total translated: 20

;; format usage stats
;; A:4
;; 2-u:1
;; 5-u:2
;; x:5
;; s:14
;; 5-x:1
;; nl:12
;; 2-I:1
;; u:6
;; c:13
;; z:2
;; total format: 11

;; alphabet usage stats
;; 58,::2
;; 59,;:
;; 60,<:
;; 61,=:
;; 62,>:
;; 63,?:
;; 64,@:1
;; 65,A:5
;; 66,B:9
;; 67,C:3
;; 68,D:11
;; 69,E:3
;; 70,F:3
;; 71,G:3
;; 72,H:2
;; 73,I:1
;; 74,J:
;; 75,K:1
;; 76,L:4
;; 77,M:8
;; 78,N:2
;; 79,O:2
;; 80,P:1
;; 81,Q:1
;; 82,R:7
;; 83,S:3
;; 84,T:1
;; 85,U:2
;; 86,V:
;; 87,W:
;; 88,X:1
;; 89,Y:
;; 90,Z:
;; 91,[:2
;; 92,\:
;; 93,]:2
;; 94,^:
;; 95,_:
;; 96,`:
;; 97,a:7
;; 98,b:
;; 99,c:6
;; 100,d:6
;; 101,e:15
;; 102,f:1
;; 103,g:2
;; 104,h:
;; 105,i:9
;; 106,j:
;; 107,k:4
;; 108,l:5
;; 109,m:2
;; 110,n:11
;; 111,o:20
;; 112,p:3
;; 113,q:
;; 114,r:11
;; 115,s:7
;; 116,t:15
;; 117,u:4
;; 118,v:3
;; 119,w:1
;; 120,x:
;; 121,y:2
;; alphabet used count: 45
%endif ; STRINGSCOMPRESSED_TABLES

