using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.Stage
{
    public partial class GestionStage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || Session["typeUtilisateur"].Equals(3) || Session["typeUtilisateur"].Equals(4))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }
            else
            {
                AjoutUtilisateur.Visible = false;
                switch (int.Parse(Session["typeUtilisateur"].ToString()))
                {
                    case 1:

                        break;
                    case 2:
                        btAJVisible.Visible = false;

                        break;
                    case 3:

                        break;
                    case 4:

                        break;
                }

            }

        }

        protected void btnInser_Click(object sender, EventArgs e)
        {

            var adapter = new MonDataSetTableAdapters.QueriesTableAdapter();
            adapter.P_INSERT_Stage(
                Convert.ToInt32(DDLEtu.SelectedValue),
                Convert.ToInt32(DDLSup.SelectedValue),
                Convert.ToDateTime(tbDate.Value),
                Convert.ToInt32(txtNombreSemaine.Text),
                txtDesc.Text,
                Convert.ToInt32(DDLEntr.SelectedValue));
            txtDesc.Text = "";
            Label4.Text = "";
            Label3.Text = "<script>invisible()</script>";
            btAJInVisible.Visible = false;
            gridViewStage.DataBind();
        }

        protected void loadGestionEntreprise(object sender, EventArgs e)
        {
            Response.Redirect("../Entreprise/GestionEntreprise.aspx");
        }

        protected void btAJVisible_OnClick(object sender, EventArgs e)
        {
            Label4.Text = "";
            Label3.Text = "<script>visible()</script>";
            btAJInVisible.Visible = true;
        }

        protected void btAJInVisible_OnClick(object sender, EventArgs e)
        {
            Label4.Text = "<script>invisible2()</script>";
            Label3.Text = "<script>invisible()</script>";

            btAJInVisible.Visible = false;
        }

        protected void bRecherche_Click(object sender, EventArgs e)
        {
            gridViewStage.DataBind();
        }

        protected void gridViewStage_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (int.Parse(Session["typeUtilisateur"].ToString()) == 2)
            {            
                DropDownList dropListSuperviseur = (DropDownList)e.Row.FindControl("dropListSuperviseur");
                DropDownList dropListEtudiant = (DropDownList)e.Row.FindControl("dropListEtudiant");
                if (dropListSuperviseur != null){
                    dropListSuperviseur.Enabled = false;
                }
                if (dropListEtudiant != null)
                {
                    dropListEtudiant.Enabled = false;
                }
            }
            
        }

        protected bool commandFieldEditIsVisible(int id_superviseur)
        {
            if (int.Parse(Session["typeUtilisateur"].ToString()) == 2)
            {
                if ((id_superviseur) != (int.Parse(Session["idUtilisateur"].ToString())))
                {
                    return false;
                }
            }
            return true;
        }
        protected bool commandFieldDeleteIsVisible(int id_superviseur)
        {
            if (int.Parse(Session["typeUtilisateur"].ToString()) == 2)
            {
                return false;
            }
            return true;
        }


        protected void gridViewStage_OnSelectedIndexChanged(object sender, EventArgs e)
        {
           
            GridViewRow row = gridViewStage.SelectedRow;
            String id = gridViewStage.DataKeys[row.RowIndex].Value.ToString();
            Session["idStage"] = gridViewStage.DataKeys[row.RowIndex].Value;

        }

        protected void btAJPR_OnClick(object sender, EventArgs e)
        {
            Label4.Text = "";
            Label3.Text = "<script>visible2()</script>";
            btAJInVisible.Visible = true;
            BtnAjouterUnUtilisateur.Visible = true;


        }

        protected void ButtonInserPR_Click(object sender, EventArgs e)
        {
            var adapter = new MonDataSetTableAdapters.QueriesTableAdapter();
            adapter.P_INSERT_PersonneRessource(Convert.ToInt32(gridViewStage.DataKeys[gridViewStage.SelectedRow.RowIndex].Value), Convert.ToInt32(DropDownList5.SelectedValue));
            Label3.Text = "<script>invisible2()</script>";
            btAJInVisible.Visible = false;
            gridViewPersonneRessource.DataBind();
        }

        protected void gridViewStage_DataBound(object sender, EventArgs e)
        {
            
            gridViewStage.SelectedIndex = 0;
            if (gridViewStage.Rows.Count != 0)
            {
                GridViewRow row = gridViewStage.SelectedRow;
                String id = gridViewStage.DataKeys[row.RowIndex].Value.ToString();
                Session["idStage"] = gridViewStage.DataKeys[row.RowIndex].Value;
            }
        }

        protected void btnAjoutUtil(object sender, EventArgs e)
        {
            AjoutUtilisateur.Visible = true;


        }

        protected void BtnRetour_Click(object sender, EventArgs e)
        {
            AjoutUtilisateur.Visible = false;

        }

        protected void BtnValider_Click(object sender, EventArgs e)
        {
            var taUtil = new MonDataSetTableAdapters.QueriesTableAdapter();

             Service.MailService srv = new Service.MailService();
               List<String> msgTo = new List<string>();
               List<String> msgCC = new List<string>();
               List<String> msgCCI = new List<string>();

            Service.EnrcyptageService mdp = new Service.EnrcyptageService();

            String motDePasse = mdp.generateRandomPassword();

            String MotDePasseEncrypter = mdp.getSha1Hash(motDePasse);

            msgTo.Add(TbMailUtil.Text);

            taUtil.P_INSERT_Utilisateur_PersonneRessource((int)gridViewStage.DataKeys[gridViewStage.SelectedRow.RowIndex].Value, TBNameUtil.Text, TbPrenomUtil.Text, TbMailUtil.Text, 4, MotDePasseEncrypter, Tbtéléphonne.Text, true);

            srv.envoyerCourriel("Bienvenue sur le service SGSv2", "Votre mot de passe pour vous connectez est : " + motDePasse, msgTo,msgCC, msgCCI);

        }
    }
}