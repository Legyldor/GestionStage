using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace SGSv2.Privée.Entreprise
{
    public partial class GestionCriteres : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || !Session["typeUtilisateur"].Equals(1))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
                
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (tbNewCritere.Text != "" && tbNum.Text != "")
            {
                Boolean erreur = false;
                for(int i = 0; i<gdvCritere.Rows.Count;i++){
                    if(gdvCritere.Rows[i].Cells[1].Text == tbNum.Text){
                        erreur = true;
                    }
                }
                if (erreur == false)
                {
                    var adapter = new MonDataSetTableAdapters.QueriesTableAdapter();
                    adapter.P_INSERT_Critere(tbNewCritere.Text, int.Parse(tbNum.Text));
                    tbNum.Text = "";
                    tbNewCritere.Text = "";
                    gdvCritere.DataBind();
                }
                else
                {
                    tbNum.BorderWidth = 2;
                    tbNum.BorderColor = Color.Red;
                }
            }
            else
            {
                tbNewCritere.BorderWidth = 2;
                tbNewCritere.BorderColor = Color.Red;
                tbNum.BorderWidth = 2;
                tbNum.BorderColor = Color.Red;
            }
        }

        protected void tbNewCritere_TextChanged(object sender, EventArgs e)
        {
            tbNewCritere.BorderWidth = 1;
            tbNewCritere.BorderColor = Color.Black;
            tbNum.BorderWidth = 1;
            tbNum.BorderColor = Color.Black;
        }
    }
}