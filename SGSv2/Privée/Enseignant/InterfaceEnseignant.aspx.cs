using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.Privée.Enseignant
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || Session["typeUtilisateur"].Equals(3) || Session["typeUtilisateur"].Equals(4))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }
            else
            {
                if (gvListeEtu.Rows.Count > 0 && !IsPostBack){
                    gvListeEtu.SelectRow(0);
                    allContent.Visible = true;
                    if (Convert.ToInt32(gvListeEtu.DataKeys[gvListeEtu.SelectedIndex].Values["id_superviseur_STAGE"]) != Convert.ToInt32(Session["idUtilisateur"]))
                    {
                        btAnuller.Visible = false;
                        btDesoumettreSuperviseur.Visible = false;
                        btSauvegarder.Visible = false;
                        btSoumettre.Visible = false;
                        ButtonDesoumettreCahier.Visible = false;
                        tbHoraire.ReadOnly = true;
                        tbEnvLog.ReadOnly = true;
                        tbEnvMat.ReadOnly = true;
                        tbSynthese.ReadOnly = true;
                        TextBoxApprentissage.Enabled = false;
                        TextBoxDifficultes.Enabled = false;
                        TextBoxTache.Enabled = false;
                        GridViewComPR.Columns[5].Visible = false;
                    }

                    
                }
                
                if (gvListeEtu.Rows.Count == 0) { 
                    allContent.Visible = false;
                    gvSemaine.Visible = false;
                }
                
                
            }
            TextBoxApprentissage.Enabled = false;
            TextBoxDifficultes.Enabled = false;
            TextBoxTache.Enabled = false;
        }

        protected void gvListeEtu_SelectedIndexChanged(object sender, EventArgs eventArgs)
        {
            /* TODO GERER PAR ANNÉES POUR REGLER LE BUG (DANS LA PROCEDURE)*/
            if (gvListeEtu.Rows.Count != 0)
            {
                GridViewRow row = gvListeEtu.SelectedRow;
                String id = gvListeEtu.DataKeys[row.RowIndex].Value.ToString();
                Session["idEtu"] = gvListeEtu.DataKeys[row.RowIndex].Value;

                gvSemaine.DataBind();

                gvSemaine.SelectRow(0);

                databindinfo();
            }
        }
        protected void gvSemaine_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvSemaine.Rows.Count != 0)
            {
                GridViewRow row = gvSemaine.Rows[gvSemaine.SelectedIndex];
                String id = gvSemaine.DataKeys[row.RowIndex].Value.ToString();

                Session["id_semaine"] = gvSemaine.DataKeys[row.RowIndex].Value;

                databindinfo();
            }
        }

        protected void databindinfo()
        {
            DataView dvSql = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                if (drvSql["cahier_rempli"].ToString().Equals("True"))
                {
                    tbHoraire.Text = drvSql["horraire"].ToString();
                    tbEnvLog.Text = drvSql["environnement_logiciel"].ToString();
                    tbEnvMat.Text = drvSql["materiels"].ToString();
                    tbSynthese.Text = drvSql["synthese"].ToString();
                    ButtonDesoumettreCahier.Visible = true;

                    DataView dvSql5 = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
                    foreach (DataRowView drvSql5 in dvSql5)
                    {
                        TextBoxApprentissage.Text = drvSql5["apprentisage_semaine"].ToString();

                        TextBoxDifficultes.Text = drvSql5["difficultés-semaine"].ToString();

                        TextBoxTache.Text = drvSql5["tâche_semaine"].ToString();

                    }
                }
                else
                {
                    TextBoxApprentissage.Text = "";
                    TextBoxDifficultes.Text = "";
                    TextBoxTache.Text = "";
                    tbHoraire.Text = "";
                    tbEnvLog.Text = "";
                    tbEnvMat.Text = "";
                    tbSynthese.Text = "";
                    ButtonDesoumettreCahier.Visible = false;
                }
            }

            DataView dvSql3 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql3 in dvSql3)
            {
                tbCommentSuper.Text = drvSql3["commentaire_enseignant"].ToString();
            }
            tbHoraire.ReadOnly = true;
            tbEnvLog.ReadOnly = true;
            tbEnvMat.ReadOnly = true;
            tbSynthese.ReadOnly = true;
            DataView dvSql4 = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql4 in dvSql4)
            {
                if (drvSql4["commentaire_enseignant_soumis"].ToString().Equals("True"))
                {
                    tbCommentSuper.ReadOnly = true;
                    btAnuller.Visible = false;
                    btSauvegarder.Visible = false;
                    btSoumettre.Visible = false;
                    btDesoumettreSuperviseur.Visible = true;
                }
                else
                {
                    tbCommentSuper.ReadOnly = false;
                    btAnuller.Visible = true;
                    btSauvegarder.Visible = true;
                    btSoumettre.Visible = true;
                    btDesoumettreSuperviseur.Visible = false;
                }
            }
            var id = Session["idUtilisateur"];
            if (gvListeEtu.Rows.Count != 0)
            {
                var id2 = gvListeEtu.DataKeys[gvListeEtu.SelectedIndex].Values["id_superviseur_STAGE"];
                if (Convert.ToInt32(gvListeEtu.DataKeys[gvListeEtu.SelectedIndex].Values["id_superviseur_STAGE"]) != Convert.ToInt32(Session["idUtilisateur"]))
                {
                    btAnuller.Visible = false;
                    btDesoumettreSuperviseur.Visible = false;
                    btSauvegarder.Visible = false;
                    btSoumettre.Visible = false;
                    ButtonDesoumettreCahier.Visible = false;
                    tbHoraire.ReadOnly = true;
                    tbEnvLog.ReadOnly = true;
                    tbEnvMat.ReadOnly = true;
                    tbSynthese.ReadOnly = true;
                    TextBoxApprentissage.Enabled = false;
                    TextBoxDifficultes.Enabled = false;
                    TextBoxTache.Enabled = false;
                    GridViewComPR.Columns[5].Visible = false;
                }
            }else {
                allContent.Visible = false;
               gvSemaine.Visible = false;
            }
        }


        protected void btSoumettre_OnClick(object sender, EventArgs e)
        {
            if (tbCommentSuper.Text != "")
            {
                var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                var value = gvSemaine.SelectedValue.ToString();

                taCahier.P_INSERT_Commentaire_Sup_Soumis(tbCommentSuper.Text, Convert.ToInt32(value));

                var taMail = new MonDataSetTableAdapters.P_SELECT_Adresse_mail_Etudiant_By_SuperviseurTableAdapter();

                var dtMail = new DataTable();

                dtMail = taMail.GetData((int)Session["idEtu"]);

                Service.MailService srv = new Service.MailService();

                List<String> msgTo = new List<string>();
                List<String> msgCC = new List<string>();
                List<String> msgCCI = new List<string>();

                String mail = dtMail.Rows[0]["mail_UTIL"].ToString();

                msgTo.Add(mail);
                String numSemaine = "";
                int i = 0;
                DataView dvSql4 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView drvSql4 in dvSql4)
                {
                    if (i == gvSemaine.SelectedIndex)
                    {
                        numSemaine = drvSql4["numero_Semaine"].ToString();
                    }
                    i++;
                }
                srv.envoyerCourriel("Nouveau commentaire de votre enseignant", "Votre enseignant a mis un nouveau commentaire pour la semaine " + numSemaine + ". Il est disponible sur le site.", msgTo, msgCC, msgCCI);
                gvSemaine.DataBind();
            }
        }

        protected void btSauvegarder_OnClick(object sender, EventArgs e)
        {
            if (tbCommentSuper.Text != "")
            {
                var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                var value = gvSemaine.SelectedValue.ToString();

                taCahier.P_INSERT_Commentaire_Sup_Save(tbCommentSuper.Text, Convert.ToInt32(value));
                gvSemaine.DataBind();
            }
        }
        protected void btAnuller_OnClick(object sender, EventArgs e)
        {
            tbCommentSuper.Text = "";
        }

        protected void btDesoumettreSuperviseur_Click(object sender, EventArgs e)
        {

            var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
            var value = gvSemaine.SelectedValue.ToString();

            taCahier.P_UPDATE_Desoumettre_Commentaire_Superviseur(Convert.ToInt32(value));
            gvSemaine.DataBind();
            databindinfo();

        }

        protected void ButtonDesoumettreCahier_Click(object sender, EventArgs e)
        {
            var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
            var value = gvSemaine.SelectedValue.ToString();

            taCahier.P_UPDATE_Desoumet_Cahier(Convert.ToInt32(value));
                

                var taMail = new MonDataSetTableAdapters.P_SELECT_Adresse_mail_Etudiant_By_SuperviseurTableAdapter();

                var dtMail = new DataTable();

                dtMail = taMail.GetData((int)Session["idEtu"]);

                Service.MailService srv = new Service.MailService();

                List<String> msgTo = new List<string>();
                List<String> msgCC = new List<string>();
                List<String> msgCCI = new List<string>();

                String mail = dtMail.Rows[0]["mail_UTIL"].ToString();

                msgTo.Add(mail);
                var nbsemaine = gvSemaine.DataKeys[gvSemaine.SelectedIndex].Values["numero_Semaine"];
                srv.envoyerCourriel("Désoumission du cahier par votre enseignant", "Votre enseignant à désoumis votre cahier de la semaine " + nbsemaine, msgTo, msgCC, msgCCI);
                gvSemaine.DataBind();
                databindinfo();
            

        }

        protected void GridViewComPR_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Desoumettre")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewComPR.SelectRow(index);
                var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                var value = GridViewComPR.SelectedValue.ToString();

                taCahier.P_UPDATE_desoumission_CommentairePR(Convert.ToInt32(value));

                var taMail = new MonDataSetTableAdapters.P_SELECT_AdresseMail_By_PersonneRessourceIDTableAdapter();

                var dtMail = new DataTable();
                dtMail = taMail.GetData(Convert.ToInt32(GridViewComPR.DataKeys[index].Values["id_UTIL"]));
                Service.MailService srv = new Service.MailService();

                List<String> msgTo = new List<string>();
                List<String> msgCC = new List<string>();
                List<String> msgCCI = new List<string>();

                String mail = dtMail.Rows[0]["mail_UTIL"].ToString();

                msgTo.Add(mail);
                var nbsemaine = gvSemaine.DataKeys[gvSemaine.SelectedIndex].Values["numero_Semaine"];
                srv.envoyerCourriel("Désoumission de votre commentaire par le superviseur", "Le superviseur de " + Session["utilisateur"].ToString() + " à désoumis votre commentaire de la semaine " + nbsemaine +".", msgTo, msgCC, msgCCI);

                gvSemaine.DataBind();
                databindinfo();


            }
        }

        protected void bRecherche_Click(object sender, EventArgs e)
        {
           gvListeEtu.DataBind();
           gvSemaine.DataBind();
           gvListeEtu.SelectRow(0);
           if (gvListeEtu.Rows.Count != 0)
           {
               if (Convert.ToInt32(gvListeEtu.DataKeys[gvListeEtu.SelectedIndex].Values["id_superviseur_STAGE"]) != Convert.ToInt32(Session["idUtilisateur"]))
               {
                   allContent.Visible = true;
                   gvSemaine.Visible = true;
                   btAnuller.Visible = false;
                   btDesoumettreSuperviseur.Visible = false;
                   btSauvegarder.Visible = false;
                   btSoumettre.Visible = false;
                   ButtonDesoumettreCahier.Visible = false;
                   tbHoraire.ReadOnly = true;
                   tbEnvLog.ReadOnly = true;
                   tbEnvMat.ReadOnly = true;
                   tbSynthese.ReadOnly = true;
                   TextBoxApprentissage.Enabled = false;
                   TextBoxDifficultes.Enabled = false;
                   TextBoxTache.Enabled = false;
                   GridViewComPR.Columns[5].Visible = false;
               }
           }
           else 
           { 
               allContent.Visible = false;
               gvSemaine.Visible = false;
           }
        }
    }

}
