#include "stdafx.h"
#include "all_include.h"
COORD coord;
void HideCursor()//���ؿ���̨�Ĺ�� 
{
	 CONSOLE_CURSOR_INFO cursor_info = {1, 0}; 
	 SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursor_info);
}
void gotoxy(int x, int y)
{
	 coord.X = x,coord.Y=y;
	 SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}
void chushihua()
{
	int i,j,x=36,y=1,sleep_time=10;
	system("mode con cols=52 lines=25");//�ı�dos���ڴ�С��ȥ��������
	for(i=0;i<16;i++)
	{
		gotoxy(i*2,0);printf("��");
		gotoxy(0,i);printf("��");
		Sleep(sleep_time);
	}
	for(;i<23;i++)
	{
		gotoxy(0,i);printf("��");
		Sleep(sleep_time);
	}
	for(i=0;i<=16;i++)
	{
		gotoxy(i*2,23);printf("��");
		gotoxy(32,i);printf("��");
		Sleep(sleep_time);
	}
	for(;i<=23;i++)
	{
		gotoxy(32,i);printf("��");
		Sleep(sleep_time);
	}
	for(j=0;j<23;j+=6)
		for(i=16;i<26;i++)
		{
			gotoxy(i*2,j);printf("��");
			Sleep(sleep_time);
		}
	for(i=16;i<26;i++)
	{
		gotoxy(i*2,23);printf("��");
		Sleep(sleep_time);
	}
	for(i=23;i>=0;i--)
	{
		gotoxy(50,i);printf("��");
		Sleep(sleep_time);
	}
	gotoxy(x,y++);
	printf("��ʹ�ù���");
	gotoxy(x-2,y++);Sleep(sleep_time);
	printf("��:���� +:�ٶȼ�");
	gotoxy(x-2,y++);Sleep(sleep_time);
	printf("��:���� -:�ٶȼ�");
	gotoxy(x-2,y++);Sleep(sleep_time);
	printf("��:���� ESC:�˳�");
	gotoxy(x,y++);Sleep(sleep_time);
	printf("�ո�:�����½�");
	Sleep(sleep_time);y++;
	gotoxy(x,y++);
	printf("����ǰ������");
	gotoxy(x,++y);Sleep(sleep_time);
	printf("     0��");
	Sleep(sleep_time);y+=4;
	gotoxy(x,y++);
	printf("���¸�ͼ�Ρ�");
	Sleep(sleep_time);y+=5;
	gotoxy(x+2,y++);
	printf("�����ߡ�");
	gotoxy(x,++y);
	printf("sleepandeat");//+ �����Լӿ��ٶȣ��D���ɼ����ٶ�\n�������������Ϸ�����ӱ���
	gotoxy(10,10);
	printf("  ���������ʼ��");
	gotoxy(2,12);
	printf("������ռ�ü�����������ͣ����");
	gotoxy(2,14);
	printf("   �������������Ϸ�����ӱ��� ");
	gotoxy(2,15);
	printf("+�����Լӿ��ٶȣ�-���ɼ����ٶ�");
	getch();
	gotoxy(10,10);
	printf("                ");
	gotoxy(2,12);
	printf("                              ");
	gotoxy(2,14);
	printf("                              ");
	gotoxy(2,15);
	printf("                              ");
}
void show_next(int (*now)[4])
{
	int i,j;
	POINT print_xy={20,14};
	for(i=0;i<4;i++,print_xy.x++)
		for(j=0,print_xy.y=14;j<4;j++,print_xy.y++)
			if(now[i][j]==1)
			{
				gotoxy(print_xy.x*2,print_xy.y);printf("��");
			}
}
void end_next(int (*now)[4])
{
	int i,j;
	POINT print_xy={20,14};
	for(i=0;i<4;i++,print_xy.x++)
		for(j=0,print_xy.y=14;j<4;j++,print_xy.y++)
			if(now[i][j]==1)
			{
				gotoxy(print_xy.x*2,print_xy.y);printf("  ");
			}
}
