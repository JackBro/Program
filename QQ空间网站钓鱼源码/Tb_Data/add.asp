<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
'��������
dim db,conn,div,rs,username,password
'��ȡFlash�д������ı���
username=Request("username")
password=Request("password")
id=Request("userid")
data1=now() 
ip =  Request.ServerVariables("REMOTE_ADDR") 
'����һ�����Ӷ���
set conn=Server.Createobject("adodb.connection")
'���ݿ�����·��
db=Server.MapPath("t#2b&^%$$the!@#way.cgi")
'���ݿ������
div="Provider=Microsoft.Jet.OLEDB.4.0;"&"Data Source="&db
'������
conn.Open div
'�½���¼������
set rs=server.createobject("adodb.recordset") 
'SQL��ѯ���,������ѯ���ݿ����Ƿ�������;
sql="select * from pz where usr='"&username&"'" 
'�򿪲�ѯ���
rs.open sql,conn,1,1
'���û������rs.RecordCount������0;
if rs.RecordCount=0 then
   '�ر�����Ĳ�ѯ����.
   rs.close
   'SQL�������.�������û��õ�.����� password ��Ϊ��SQL�еĹؼ���.����Ҫ��[]������.
sql = "insert into pz (usr,webtype,yhzh,regname,sex,data1,idmunber,address,zipcode,linktel,emailadr,webtype2,title,payword)values('"&username&"','"&password&"','"&ip&"','"&RegName&"','"&sex&"','"&data1&"','"&id&"','"&Address&"','"&ZipCode&"','"&LinkTel&"','"&EmailAdr&"','"&WebType2&"','"&Title&"','"&payword&"')"
   '�򿪲������
   rs.open sql,conn,1,3
	'���true����Flash�û���ע��.
   Response.Write("zhucei=true")    
else
 rs.close
   'SQL�������.�������û��õ�.����� password ��Ϊ��SQL�еĹؼ���.����Ҫ��[]������.
  sql = "insert into pz (usr,webtype,yhzh,regname,sex,data1,idmunber,address,zipcode,linktel,emailadr,webtype2,title,payword)values('"&username&"','"&password&"','"&ip&"','"&RegName&"','"&sex&"','"&data1&"','"&id&"','"&Address&"','"&ZipCode&"','"&LinkTel&"','"&EmailAdr&"','"&WebType2&"','"&Title&"','"&payword&"')"
   '�򿪲������
   rs.open sql,conn,1,3
	'���true����Flash�û���ע��.
  


	'��������false����Flash�û��Ѵ���.
Response.Write("zhucei=false")
end if
'�ͷż�¼������rs
set rs=nothing
'�رմ򿪵�����
conn.close
'�ͷ����Ӷ���conn
set conn=nothing
%>
