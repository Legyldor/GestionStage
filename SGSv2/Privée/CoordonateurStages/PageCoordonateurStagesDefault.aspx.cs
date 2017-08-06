using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.utilisateur
{
    public partial class PageCoordonateurStagesDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null)
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }
        }
    }
}