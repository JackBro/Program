#include "stdafx.h"
#include "allInclude.h"

BOOL fenxi(){
	char str[1248],*str1,str2[1248],num[10];
	FILE *p;
	int were = 0;
	BOOL hadOne = false;
	if((p=fopen(downlaodPath,"r"))==NULL)
	{
		return FALSE;
	}
	while(1)
	{
		char data[120];
		fgets(str,1248,p);//��ȡ
		if((str1=strstr(str,"target=\"_blank\" title=\""))!=NULL)
		{
			str1+=23;
			strcpy(str2,str1);
			if((str1=strstr(str2,"�ٱ�"))==NULL){
				int size = strlen(str2),i,j=0;
				for(i=0;i<size&&i<100;i++)
				{
					if(str2[i]=='\"')break;
					data[j++]=str2[i];
				}
				data[j]='\0';
				//set_data(listHwnd,itoa(were+1,num,10),were,0);
				set_data(listHwnd,data,were,1);
				were++;
				//MessageBox(NULL,str,"",0);
			}
		}//="col end dealing" >
		if((str1=strstr(str,"col end dealing\" >"))!=NULL)
		{
			str1+=18;
			strcpy(str2,str1);
			int size = strlen(str2),i,j=0;
			for(i=0;i<size&&i<100;i++)
			{
				if(str2[i]>='0' && str2[i]<='9')
					data[j++]=str2[i];
				else break;
			}
			data[j]='\0';
			set_data(listHwnd,itoa(were+1,num,10),were,0);
			set_data(listHwnd,data,were,2);
			//MessageBox(NULL,data,"",0);
		}//��</i>
		if((str1=strstr(str,"��</i>"))!=NULL)
		{
			str1+=6;
			strcpy(str2,str1);
			int size = strlen(str2),i,j=0;
			for(i=0;i<size&&i<100;i++)
			{
				if(str2[i]>='0' && str2[i]<='9')
					data[j++]=str2[i];
				else break;
			}
			data[j]='\0';
			set_data(listHwnd,data,were,3);
		}//http://detail.tmall.com/  "http://item.taobao.com/
		if((str1=strstr(str,"http://detail.tmall.com/"))!=NULL || (str1=strstr(str,"http://item.taobao.com/"))!=NULL)
		{
			if(hadOne){
				hadOne = false;
				continue;
			}
			hadOne = true;
			int size = strlen(str1),i,j=0;
			for(i=0;i<size&&i<100;i++)
			{
				if(str1[i]=='\"')break;
				openUrl[urlLength][j++]=str1[i];
			}
			openUrl[urlLength][j]='\0';
			//MessageBox(NULL,openUrl[urlLength],"",0);
			urlLength++;
		}
		if(feof(p))
			break;
	}
	fclose(p);
	SetDlgItemText(mainHwnd,IDC_info,"�������");
}

/**
* ʹ��ϵͳAPI����
*/
DWORD WINAPI downThread(PVOID pMyPara){
	while(ListView_DeleteItem(listHwnd,0));//����б�
	urlLength = 0;
	SetDlgItemText(mainHwnd,IDC_info,"��ȡ�б��У����Ժ�...");
	int nResult = URLDownloadToFile(NULL,downloadUrl,downlaodPath,NULL,NULL);
	if (nResult == S_OK) // ��ʾ�ɹ�
	{
		SetDlgItemText(mainHwnd,IDC_info,"�б��ȡ�ɹ�������������...");
		fenxi();
		return TRUE;
	}
	else                 // ��ʾʧ��
	{
		SetDlgItemText(mainHwnd,IDC_info,"��ȡ�б�ʧ�ܣ����Ժ�����...");
	}
	return FALSE;
}
