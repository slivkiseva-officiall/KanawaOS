; i will not write org cuz it's library, not a file.

strcmp:
  ; strcmp is using push for args, so it will use bp  
  
  push bp
  mov bp, sp
.loop:
  cmp byte [bp - 4], [bp - 6]
  jne .done
  test word [bp - 4], 0
  jz .done
  add word [bp - 4], 1
  add word [bp - 6], 1
  jmp .loop

.done: