.section .data
hello: .asciz "Hello world!\n"  // Текст для вывода

.section .text
.global _start

_start:
    mov x0, 1          // File descriptor (stdout)
    ldr x1, =hello     // Адрес строки
    mov x2, #13        // Длина строки (12 символов + '\n')
    mov x8, 64         // Системный вызов write
    svc 0              // Вызов системного вызова

    mov x8, 93         // Системный вызов exit
    mov x0, 0          // Код выхода
    svc 0              // Вызов системного вызова
