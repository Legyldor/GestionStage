using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace SGSv2.utilisateur
{
    public partial class PageEntrepriseDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || Session["typeUtilisateur"].Equals(3) || Session["typeUtilisateur"].Equals(4))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }

        }

        protected void btnInser_Click(object sender, EventArgs e)
        {
            var adapter = new MonDataSetTableAdapters.QueriesTableAdapter();
            adapter.P_INSERT_Entreprise(
                txtBoxNom.Text,
                txtBoxAdr.Text,
                txtBoxVille.Text,
                txtBoxCodePost.Text,
                txtBoxTel.Text,
                txtBoxMail.Text,
                txtBoxFax.Text);
            txtBoxNom.Text = "";
            txtBoxAdr.Text = "";
            txtBoxVille.Text = "";
            txtBoxCodePost.Text = "";
            txtBoxTel.Text = "";
            txtBoxMail.Text = "";
            txtBoxFax.Text = "";
            Label4.Text = "";
            Label3.Text = "<script>invisible()</script>";
            btAJInVisible.Visible = false;
            GridViewEnt.DataBind();
        }

        protected void btAJVisible_OnClick(object sender, EventArgs e)
        {
            Label4.Text = "";
            Label3.Text = "<script>visible()</script>";
            btAJInVisible.Visible = true;
        }

        protected void btAJInVisible_OnClick(object sender, EventArgs e)
        {
            Label4.Text = "";
            Label3.Text = "<script>invisible()</script>";
            btAJInVisible.Visible = false;
        }

        //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewEnt, "Select$" + e.Row.RowIndex);
        //        e.Row.ToolTip = "Clique pour selectionner la ligne.";
        //    }
        //}

        //protected void OnSelectedIndexChanged(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow row in GridViewEnt.Rows)
        //    {
        //        if (row.RowIndex == GridViewEnt.SelectedIndex)
        //        {
        //            row.BackColor = ColorTranslator.FromHtml("#9f7373");
        //            row.ForeColor = ColorTranslator.FromHtml("#601616");
        //            row.ToolTip = string.Empty;
        //        }
        //        else
        //        {
        //            row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
        //            row.ToolTip = "Clique pour selectionner la ligne.";
        //        }
        //    }
        //}
    }
}