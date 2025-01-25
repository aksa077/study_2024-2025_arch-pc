.section .data
    msg: .asciz "Введите строку:\n"  // Сообщение для вывода строки
    buf: .space 80                  // Буфер для ввода строки

.section .text
.global _start

_start:
    // Вывод строки на экран
    mov x8, 64               // syscall: write
    mov x0, 1                // stdout
    ldr x1, =msg             // Адрес строки
    mov x2, #16              // Длина строки
    svc 0                    // Вызов системного вызова

    // Ожидание ввода строки
    mov x8, 63               // syscall: read
    mov x0, 0                // stdin
    ldr x1, =buf             // Адрес буфера
    mov x2, #80              // Размер буфера
    svc 0                    // Вызов системного вызова

    // Завершение программы
    mov x8, 93               // syscall: exit
    mov x0, 0                // Код возврата
    svc 0                    // Вызов системного вызова
