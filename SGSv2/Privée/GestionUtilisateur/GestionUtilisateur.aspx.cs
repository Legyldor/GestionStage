using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.utilisateur
{
    public partial class GestionUtilisateur : System.Web.UI.Page
    {
        protected bool slide = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            AjUtil.Visible = false;
            btVisible.Visible = true;
            btAJInVisible.Visible = false;
            if (Session["idUtilisateur"] == null || !Session["typeUtilisateur"].Equals(1))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }
            
        }

        protected void tbRecherche_TextChanged(object sender, EventArgs e)
        {
            gvRecherche.DataBind();
        }

        protected void bRecherche_OnClick(object sender, EventArgs e)
        {
            gvRecherche.DataBind();
        }

        protected void btAjUtil_OnClick(object sender, EventArgs e)
        {
            Service.MailService srv = new Service.MailService();
            List<String> msgTo = new List<string>();
            List<String> msgCC = new List<string>();
            List<String> msgCCI = new List<string>();

            Service.EnrcyptageService mdp = new Service.EnrcyptageService();
            String motDePasse = mdp.generateRandomPassword();
            var taMdp = new MonDataSetTableAdapters.QueriesTableAdapter();
            if (tbAjMail.Text != "")
            {
                msgTo.Add(tbAjMail.Text);
                String motDePasseEncrypte = mdp.getSha1Hash(motDePasse);
                taMdp.P_INSERT_Utilisateur(tbAjNom.Text, tbAjPrenom.Text, tbAjMail.Text, Convert.ToInt32(ddlAjGroupe.SelectedValue), motDePasseEncrypte, tbAjTel.Text,
               cbAjActif.Checked);
                srv.envoyerCourriel("SGSv2 - Mot de passe de l'application", "Vous venez de vous créer un compte sur l'application SGSv2. Votre mot de passe est : " + motDePasse, msgTo, msgCC, msgCCI);


                tbAjMail.Text="";
                tbAjNom.Text="";
                tbAjPrenom.Text="";
                tbAjTel.Text="";
                ddlAjGroupe.SelectedIndex = 0;
                AjUtil.Visible = false;
                btVisible.Visible = true;
                btAJInVisible.Visible = false;
                gvRecherche.DataBind();
            }
            else
            {
                labelErreur.Visible = true;
            }
        }

        protected void btAJVisible_OnClick(object sender, EventArgs e)
        {
            AjUtil.Visible = true;
            labelErreur.Visible = false;
            btVisible.Visible = false;
            btAJInVisible.Visible = true;
        }

        protected void btAJInVisible_OnClick(object sender, EventArgs e)
        {
            AjUtil.Visible = false;
            btVisible.Visible = true;
            btAJInVisible.Visible = false;
        }

    }
}