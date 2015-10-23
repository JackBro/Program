/*
fox38��2013��1��19�ձ�д
�����������ͷ���Թ����У�������ͷ�ĵ���Ƭͨ�������ϴ����������ֱ���ʱ��
��jpgͼƬ���ֽ���ת��Ϊʮ�������ַ��ˣ�ֱ�Ӹ����ļ���׺�޷�ֱ�ӹۿ�ͼƬ�����⡣

��������Ҫ���ڽ��Ӵ������ֵ�����л�ȡ��JPGͼƬʮ�������ַ���ת��Ϊ�ֽ������Ա��ܹ�ֱ�ӹۿ���

ʮ�������ַ����ı���ŵ�in.txt�У��ó�����ת����ͼƬin.jpg

���������ĵ�Ϊ��in.txt��������ļ�Ϊ��in.jpg��
1��22���޸ģ��û�����������Ҫת�����ı��ļ����ƣ���Ҫ���Ϻ�׺��
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//ʮ�������ַ���ת��Ϊ�ֽ���

int main() {
	FILE *fin, *fout;

	char *infile = "in.txt";
	char *outfile = "in.jpg";
	int temp, high, low, iloc[1] = { 10 };
	long lLen, i;
	char  cIn[81], cOut[81];

	printf("Please insert the name of the file:");
	scanf("%s", cIn);
	printf("%s\n", cIn);


	fin = fopen(cIn, "r"); // ����ʽ�򿪣�Ĭ��Ϊ�ı�����
	fout = fopen(outfile, "wb"); // д��ʽ�򿪣��Զ�������ʽ	
	if ((fin == NULL) || (fout == NULL)) {
		printf("���ļ�ʧ��!\n");
		exit(1);
	}

	fseek(fin, sizeof(char), SEEK_END);
	lLen = ftell(fin);
	printf("�ļ�����Ϊ%d\n", lLen);
	fseek(fin, sizeof(char), SEEK_SET);

	for (i = 0; i<lLen; i = i + 3)
	{
		fseek(fin, i, SEEK_SET);
		high = fgetc(fin);
		//printf("high is :%d\n",high);
		if (high > 0x39)
			high -= 0x37;
		else
			high -= 0x30;

		fseek(fin, i + 1, SEEK_SET);
		low = fgetc(fin);
		//printf("low is :%d\n",low);
		if (low > 0x39)
			low -= 0x37;
		else
			low -= 0x30;
		temp = ((high << 4) | low);
		//printf("temp is :%d\n",temp);
		//fputc(temp,fout);
		if (10 == temp)
		{
			fwrite(&iloc, 1, 1, fout);
		}
		else
		{
			fputc(temp, fout);
		}

	}

	fclose(fin);
	fclose(fout);
	return 0;
}


//�ֽ���ת��Ϊʮ�������ַ���

void ByteToHexStr(const unsigned char* source, char* dest, int sourceLen)
{
	short i;
	unsigned char highByte, lowByte;
	for (i = 0; i < sourceLen; i++)
	{
		highByte = source[i] >> 4;
		lowByte = source[i] & 0x0f;
		highByte += 0x30;
		if (highByte > 0x39)
			dest[i * 2] = highByte + 0x07;
		else
			dest[i * 2] = highByte;
		lowByte += 0x30;
		if (lowByte > 0x39)
			dest[i * 2 + 1] = lowByte + 0x07;
		else
			dest[i * 2 + 1] = lowByte;
	}
	return;
}

//�ֽ���ת��Ϊʮ�������ַ�������һ��ʵ�ַ�ʽ

void Hex2Str(const char *sSrc, char *sDest, int nSrcLen)
{
	int  i;
	char szTmp[3];
	for (i = 0; i < nSrcLen; i++)
	{
		sprintf(szTmp, "%02X", (unsigned char)sSrc[i]);
		memcpy(&sDest[i * 2], szTmp, 2);
	}
	return;
}
//ʮ�������ַ���ת��Ϊ�ֽ���
void HexStrToByte(const char* source, unsigned char* dest, int sourceLen)
{
	short i;
	unsigned char highByte, lowByte;
	for (i = 0; i < sourceLen; i += 2)
	{
		highByte = toupper(source[i]);
		lowByte = toupper(source[i + 1]);
		if (highByte > 0x39)
			highByte -= 0x37;
		else
			highByte -= 0x30;
		if (lowByte > 0x39)
			lowByte -= 0x37;
		else
			lowByte -= 0x30;
		dest[i / 2] = (highByte << 4) | lowByte;
	}
	return;
}