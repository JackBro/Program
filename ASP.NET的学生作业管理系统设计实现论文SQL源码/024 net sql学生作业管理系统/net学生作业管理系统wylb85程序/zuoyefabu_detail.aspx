<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zuoyefabu_detail.aspx.cs" Inherits="zuoyefabu_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title><LINK href="images/StyleSheet.css" type=text/css rel=stylesheet>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
            cellpadding="4" cellspacing="0" width="70%">
            <tr bgcolor="#4296e7">
                <td colspan="4">
                    <div align="center">
                        <font color="#ffffff">��ҵ������ϸ</font></div>
                </td>
            </tr>
            <tr>
                <td width='11%'>��ҵ��ţ�</td><td width='39%'><%=nzuoyebianhao%></td><td width='11%'>��ҵ���ƣ�</td><td width='39%'><%=nzuoyemingcheng%></td></tr><tr><td width='11%'>����Ҫ��</td><td width='39%'><%=nneirongyaoqiu%></td><td width='11%'>������</td><td width='39%'><a href="<%=nfujian%>">�������</a></td></tr><tr><td width='11%'>�Ͻ����ޣ�</td><td width='39%'><%=nshangjiaoqixian%></td><td width='11%'>�����ˣ�</td><td width='39%'><%=nfaburen%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� style='border:solid 1px #000000; color:#666666' onClick="javascript:history.back()" /></td></tr>
            
            
            
            <tr bgcolor="#4296e7">
                <td colspan="4">&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

