DATAS SEGMENT
    prompt0 4 {T,h,i,s}    ;��ʾ
    prompt1 7 {p,r,o,g,r,a,m}
    prompt2 2 {i,s}
    prompt3 11 {c,a,l,c,u,l,a,t,i,n,g}
    prompt4 4 {f,i,v,e}
    prompt5 8 {m,u,l,t,i,p,l,y}
    prompt6 3 {s,i,x}
    result 2    ;�����Ŵ�
DATAS ENDS

CODES SEGMENT
    lea dx,prompt0  ;��ʾ��ʾ��Ϣ
    mov  ah,09    ;09���ܵ��ã�����ַ���
    int 21
    LEA DX,prompt1
    mov  ah,09         
    INT 21
    LEA DX,prompt2       
    MOV AH,09 
    INT 21 
    LEA DX,prompt3      
    MOV AH,09 
    INT 21  
    LEA DX,prompt4      
    MOV AH,09 
    INT 21 
    LEA DX,prompt5      
    MOV AH,09 
    INT 21 
    LEA DX,prompt6      
    MOV AH,09 
    INT 21 
    mov cx,4 ;�趨ѭ������      
    mov ax,6 ;��ʼ��AX
calc:mov dx,6
    add ax,dx
    loop calc
    mov dx,ax
    mov ah,2
    int 21    ;������
    mov result,dx ;������
    mov ah,12 
    int 21     ;�������
codes ends