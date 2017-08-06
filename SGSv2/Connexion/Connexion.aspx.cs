using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Input;
using System.Web.Security;

namespace SGSv2.Connexion
{
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null)
            {
                connecté.Visible = false;
                connexion.Visible = true;
                confirmReset.Visible = false;
            }
            else
            {
                connecté.Visible = true;
                connexion.Visible = false;
                confirmReset.Visible = false;
            }
        }

        protected void BtnConnexion_Click(object sender, EventArgs e)
        {
            if (TxtConnexion.Text == "" || txtMotDePasse.Text == "")
            {
               
            }
            else
            {
                var taConnexion = new MonDataSetTableAdapters.P_SELECT_ConnexionTableAdapter();

                var dtConnexion = new DataTable();

                Service.EnrcyptageService mdpUtil = new Service.EnrcyptageService();

                String motDePasseUtilEncripte= mdpUtil.getSha1Hash(txtMotDePasse.Text);
                dtConnexion = taConnexion.GetData(TxtConnexion.Text, motDePasseUtilEncripte);

                if (dtConnexion.Rows.Count > 0 )
                {
                    Session["utilisateur"] = dtConnexion.Rows[0]["NomPrenom"];
                    Session["typeUtilisateur"] = dtConnexion.Rows[0]["id_TYPUTIL"];
                    Session["idUtilisateur"] = dtConnexion.Rows[0]["id_UTIL"];
                    Session["mail"] = TxtConnexion.Text;

                    FormsAuthentication.RedirectFromLoginPage(Session["utilisateur"].ToString(), false);
                }
                else
                {
                    //Echec authentification
                }
            }
        }
        protected void btnDeconnexion_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session["idUtilisateur"] = null;
            Response.Redirect("~/Default.aspx");
        }

        protected void lnkResetPassword_Click(object sender, EventArgs e)
        {
            confirmReset.Visible = true;
        }
        protected void resetPasword_Click(object sender, EventArgs e)
        {
            MotDePasseOublier.Visible = true;
            

        }

        protected void BtnValiderNouveauMdp_Click(object sender, EventArgs e)
        {
            if(MdpOublier1.Text != "" && MdpOublier2.Text != "")
            {
                if(MdpOublier1.Text == MdpOublier2.Text )
                {
                    Service.MailService srv = new Service.MailService();
                    List<String> msgTo = new List<string>();
                    List<String> msgCC = new List<string>();
                    List<String> msgCCI = new List<string>();

                    Service.EnrcyptageService mdp = new Service.EnrcyptageService();
                    String motDePasse = MdpOublier1.Text;

                    if (Session["mail"].ToString() != "")
                    {
                        msgTo.Add(Session["mail"].ToString());

                        srv.envoyerCourriel("Changement du mot de passe", "Vous venez de changer votre code d'accès à l'application SGSv2. Votre nouveau mot de passe est : " + motDePasse, msgTo, msgCC, msgCCI);

                        String motDePasseEncrypte = mdp.getSha1Hash(motDePasse);

                        var taMdp = new MonDataSetTableAdapters.QueriesTableAdapter();

                        taMdp.P_UPDATE_mdpUTIL(Session["mail"].ToString(), motDePasseEncrypte);
                    }

                }

            }
            MotDePasseOublier.Visible = false;

        }

        protected void BtnAnnulerNouveauMdp_Click(object sender, EventArgs e)
        {
            MotDePasseOublier.Visible = false;
        }


        protected void lkOui_OnClick(object sender, EventArgs e)
        {
            Service.MailService srv = new Service.MailService();
            List<String> msgTo = new List<string>();
            List<String> msgCC = new List<string>();
            List<String> msgCCI = new List<string>();

            Service.EnrcyptageService mdp = new Service.EnrcyptageService();
            String motDePasse = mdp.generateRandomPassword();

            if (TxtConnexion.Text != "")
            {
                msgTo.Add(TxtConnexion.Text);

                srv.envoyerCourriel("SGSv2 - Mot de passe de l'application", "Vous venez de vous créer un compte sur l'application SGSv2. Votre mot de passe est : " + motDePasse, msgTo, msgCC, msgCCI);

                String motDePasseEncrypte = mdp.getSha1Hash(motDePasse);

                var taMdp = new MonDataSetTableAdapters.QueriesTableAdapter();
                taMdp.P_UPDATE_mdpUTIL(TxtConnexion.Text, motDePasseEncrypte);

            }
        }

        protected void lkNon_OnClick(object sender, EventArgs e)
        {
            confirmReset.Visible = false;
        }
    }
}