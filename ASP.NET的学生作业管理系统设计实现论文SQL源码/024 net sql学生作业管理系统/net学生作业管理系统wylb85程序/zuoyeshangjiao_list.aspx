<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zuoyeshangjiao_list.aspx.cs" Inherits="zuoyeshangjiao_list" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title><script language="javascript" src="js/Calendar.js"></script><LINK href="images/StyleSheet.css" type=text/css rel=stylesheet>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
            <tbody>
                <tr class="tr2">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">������ҵ�Ͻ��б�</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp; ��ҵ��ţ�<asp:TextBox ID=zuoyebianhao runat="server" style='border:solid 1px #000000; color:#666666' Width="80px"></asp:TextBox> ��ҵ���ƣ�<asp:TextBox ID=zuoyemingcheng runat="server" style='border:solid 1px #000000; color:#666666' Width="80px"></asp:TextBox> �Ͻ��ˣ�<asp:TextBox ID=shangjiaoren runat="server" style='border:solid 1px #000000; color:#666666' Width="80px"></asp:TextBox>
						&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="����" style='border:solid 1px #000000; color:#666666' /> &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="����EXCEL" style='border:solid 1px #000000; color:#666666' />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
                            <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PagerStyle Font-Bold="True" Font-Names="����" ForeColor="Blue" HorizontalAlign="Right"
                NextPageText="��һҳ" PrevPageText="��һҳ" />
                            <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="���">
                                    <HeaderStyle Width="50px" />
                                    <ItemTemplate>
                                    <%#Container.ItemIndex+1 %>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField=zuoyebianhao HeaderText='��ҵ���'></asp:BoundColumn><asp:BoundColumn DataField=zuoyemingcheng HeaderText='��ҵ����'></asp:BoundColumn><asp:BoundColumn DataField=zuoyeneirong HeaderText='��ҵ����'></asp:BoundColumn><asp:TemplateColumn HeaderText="����"><ItemTemplate><a href='<%#DataBinder.Eval(Container.DataItem, "fujian") %>' target='_blank'>����</a></ItemTemplate></asp:TemplateColumn><asp:BoundColumn DataField=shangjiaoren HeaderText='�Ͻ���'></asp:BoundColumn><asp:BoundColumn DataField=jiaoshipingyu HeaderText='��ʦ����'></asp:BoundColumn><asp:BoundColumn DataField=zuoyechengji HeaderText='��ҵ�ɼ�'></asp:BoundColumn>
                                
                                <asp:TemplateColumn HeaderText="����">
                               		<ItemTemplate>
                                    	<a href='zuoyeshangjiao_updtlb.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>����</a>
                                	</ItemTemplate>
								<HeaderStyle Width="50px" />
					
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="ɾ��">
                                	<ItemTemplate>
                                    	<a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=zuoyeshangjiao&npage=zuoyeshangjiao_list.aspx' onclick="return confirm('ȷ��Ҫɾ����')">ɾ��</a>
                               		</ItemTemplate>
								<HeaderStyle Width="50px" />
					
                                </asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="��ϸ"><ItemTemplate><a href='zuoyeshangjiao_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>��ϸ</a></ItemTemplate><HeaderStyle Width="50px" /></asp:TemplateColumn>
                            </Columns>
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Center" />
                        </asp:DataGrid></td>
                </tr>
                <tr class="tr1">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                       <a href="#" onclick="javascript:window.print();">��ӡ��ҳ</a></td>
                </tr>
            </tbody>
        </table>
    
    </div>
    </form>
</body>
</html>
