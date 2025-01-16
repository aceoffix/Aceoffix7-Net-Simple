using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aceoffix7_Net_Simple
{
    public partial class Word : System.Web.UI.Page
    {
        public Aceoffix.AceoffixCtrl aceCtrl = new Aceoffix.AceoffixCtrl();
        protected void Page_Load(object sender, EventArgs e)

        {
            aceCtrl.SaveFilePage = "SaveFile.aspx";
            aceCtrl.WebOpen("doc/editword.docx", Aceoffix.OpenModeType.docNormalEdit, "Tom");
        }
    }
}