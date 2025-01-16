<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Word.aspx.cs" Inherits="Aceoffix7_Net_Simple.Word" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Edit Word Demo</title>
</head>
<body>
    <script type="text/javascript">
        function SaveDoc() {
            aceoffixctrl.WebSave();
        }

        function OnAceoffixCtrlInit() {
            aceoffixctrl.AddCustomToolButton("Save", "SaveDoc()", 1);
        }
    </script>
	<div style="width:auto;height:98vh;">
           <%=aceCtrl.GetHtml() %>
    </div>
</body>
</html>