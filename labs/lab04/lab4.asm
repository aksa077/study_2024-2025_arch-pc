.section .data
msg:    .asciz "Isaev Ramazan\n"  // Строка для вывода

.section .text
.global _start

_start:
    mov x0, 1          // File descriptor (stdout)
    ldr x1, =msg       // Адрес строки
    mov x2, 16         // Длина строки
    mov x8, 64         // Системный вызов write
    svc 0              // Вызов системного вызова

    mov x8, 93         // Системный вызов exit
    mov x0, 0          // Код выхода
    svc 0              // Вызов системного вызова
