;;    ===================================
;;    C - F O R M ( ASM )
;;    ASM FORMATTING GUIDE
;;    ELASTIC SOFTWORKS 2025
;;    ===================================


;; SPDX-License-Identifier: ACSL-1.4 OR FAFOL-0.1 OR Hippocratic-3.0
;; Multi-licensed under ACSL-1.4, FAFOL-0.1, and Hippocratic-3.0
;; See LICENSE.txt for full license texts



;; 				     --- C-FORM ETHOS ---
;;
;; C-FORM for assembly treats the source as a low-level textbook.
;; the style is designed to make hardware interaction, boot processes,
;; and other foundational concepts as clear as possible.

org 0x7c00
bits 16

section .text
	global _start

_start:
	
	;; code logic is separated into blocks by blank lines.
	;; labels always start at column 0.
	;; instructions on all lines

	xor ax, ax    ; SET AX TO ZERO
	mov ds, ax    ; INIT DATA SEG REGISTER
	mov es, ax    ; INIT EXTRA SEG REGISTER

	;; instructions and directives are indented with one tab.
	;; they are always lowercase.
	
	mov si, msg_loading
	call print_string
	
	;; single-line comments use a semicolon ';' and explain the
	;; immediate purpose of an instruction or magic number.
	;; constants defined with 'equ' are always UPPERCASE.
	
	jmp CODE_SEG:init_pm

;; ==================================
;;           --- FUNCS ---
;; ==================================

print_string:
	
	lodsb              ; MAKE SURE
	or al, al          ; THAT EACH INSTRUCTION
	jz .done           ; HAS A BRIEF COMMENT
	mov ah, 0x0E       ; THAT IS CORRECTLY ALIGNED
	int 0x10           ; ALL-CAPS FOR BRIEF COMMS
	jmp print_string   ; BOTTOM TEXT

;; end the dang file it's gotta end somewhere okay

;; ==================================
;;           --- EOF ---
;; ==================================

