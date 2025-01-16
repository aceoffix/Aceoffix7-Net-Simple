# Aceoffix7-Net-Simple

**Latest Version：7.0.0.1**

### 1. Introduction

The Aceoffix7-Net-Simple project demonstrates how to use the Aceoffix 7.0 product under the ASP.NET framework. Note that this project only supports classic ASP.NET and does not include ASP.NET Core, .NET 5, or any subsequent versions. This project showcases the simplest way to open, edit and save Word files online.

### 2. Project environmental prerequisites

​    Visual Studio 2019 or later versions.

### 3. Steps for running the project

- Use "git clone" or directly download the project's compressed package to your local machine and then decompress it.

- Download the Aceoffix client program.

  [aceclientsetup_7.0.0.1.exe](https://github.com/aceoffix/aceoffix-client/releases/download/v7.0.0.1/aceclientsetup_7.0.0.1.exe)

- Copy the program downloaded in the previous step to the "bin" folder of the current project.

- Open this project using Visual Studio. Then right-click on the project folder, and click "Manage NuGet Packages -> Browse" in sequence. Enter "Acesoft.AceoffixNet" in the search box and install the latest version.

- Run this project and visit the index.html page to see the sample effect.

### 4. Trial license key

- Aceoffix Standard V7.0 is 4ZDGS-FDZDK-WK18-YSJET

- Aceoffix Enterprise V7.0 is QA2JS-8C0PT-IKKJ-VTCC6

- Aceoffix Ultimate V7.0 is 9GRX9-VFFED-6NSN-ACVR1


### 5. How to integrate AceoffixV7 into your web project

- Download the Aceoffix client program.


​    [aceclientsetup_7.0.0.1.exe](https://github.com/aceoffix/aceoffix-client/releases/download/v7.0.0.1/aceclientsetup_7.0.0.1.exe)

- Copy the program downloaded in the previous step to the "bin" folder of the your web project.

- Open this project using Visual Studio. Then right-click on the project folder, and click "Manage NuGet Packages -> Browse" in sequence. Enter "Acesoft.AceoffixNet" in the search box and install the latest version.

- Add the following code to the `<handlers>` tag in your `Web.config` file.

```xml
  <system.webServer>
	<handlers>
		<add name="aceserver" path="/server.ace" verb="*" type="Aceoffix.AceServer.ServerHandler" />
		<add name="aceclient" path="/aceclient" verb="GET" type="Aceoffix.AceServer.ServerHandler" />
		<add name="aceoffix" path="/aceoffix.js" verb="GET" type="Aceoffix.AceServer.ServerHandler" />
	</handlers>
</system.webServer>
```

-  Add the following code to the parent page of the page which you want to edit Office document. Write the following code in the <head> tag.

  ```javascript
  <script type="text/javascript" src="aceoffix.js"></script>
  ```

>  Note: The path of aceoffix.js is relative to the root of your website.

​     Write the following link to pop up an Acebrowser window to edit Office document. We assume that the page which contains Aceoffix control is    Word.aspx.

```html
<a href="javascript:AceBrowser.openWindow('Word.aspx', 'width=1200px;height=800px;');" >Open Word File</a>
```

- Then, write the following server code in Word.aspx.cs.

```c#
 public Aceoffix.AceoffixCtrl aceCtrl = new Aceoffix.AceoffixCtrl();
 protected void Page_Load(object sender, EventArgs e)
 {
    aceCtrl.SaveFilePage = "SaveFile.aspx";
    aceCtrl.WebOpen("doc/editword.docx", Aceoffix.OpenModeType.docNormalEdit, "Tom");
 }
```

- 
  Add a new web page called SaveFile.aspx if your user wants to save document.


```c#
 protected void Page_Load(object sender, EventArgs e)
 {
   // This page is used to receive the file saved by AceoffixCtrl.
   Aceoffix.FileSaver fs = new Aceoffix.FileSaver();
   fs.SaveToFile(Server.MapPath("doc/") + fs.FileName);
   fs.Close();
 }
```

-  Please continue with the front-end code for the Word.aspx.


```aspx
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
```

-  When publish the project and access index.html page, follow the prompts to install the Aceoffix V7 client. Once the registration dialog box appears, please enter the license key of Aceoffix V7 to complete the registration.

