using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.Privée.Entreprise
{
    public partial class InterfaceEntreprise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || Session["typeUtilisateur"].Equals(3) ) 
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
                
            }
            else
            {
                if (GridViewEtudiant.Rows.Count > 0 && !IsPostBack)
                {
                    GridViewEtudiant.SelectRow(0);
                }
                if (GridViewEtudiant.Rows.Count < 0)
                {
                   allcontent.Visible = false;
                }
            }

            TextBoxApprentissage.Enabled = false;
            TextBoxDifficultes.Enabled = false;
            TextBoxTache.Enabled = false;
        }

        protected void btComSoum_Click(object sender, EventArgs e)
        {
            if (tbCommentPersRes.Text != "")
            {
                var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                var value = GridViewSemaine.SelectedValue.ToString();

                taCahier.P_INSERT_Commentaire_PR_Soumis(Convert.ToInt32(value), Convert.ToInt32(Session["idUtilisateur"]), tbCommentPersRes.Text);

                var taMail = new MonDataSetTableAdapters.P_SELECT_Adresse_mail_Etudiant_By_IDTableAdapter();

                var dtMail = new DataTable();

                dtMail = taMail.GetData(Convert.ToInt32(GridViewEtudiant.DataKeys[GridViewEtudiant.SelectedIndex].Values["id_UTIL"]));

                Service.MailService srv = new Service.MailService();

                List<String> msgTo = new List<string>();
                List<String> msgCC = new List<string>();
                List<String> msgCCI = new List<string>();

                String mail = dtMail.Rows[0]["mail_UTIL"].ToString();

                msgTo.Add(mail);
                var nbsemaine = GridViewSemaine.DataKeys[GridViewSemaine.SelectedIndex].Values["numero_Semaine"];
                srv.envoyerCourriel("Soumission d'un commentaire par une personne ressource", "Une personne ressource ( " + Session["utilisateur"] + " ) a soumis un commentaire de la semaine " + nbsemaine, msgTo, msgCC, msgCCI);

                GridViewSemaine.DataBind();
            }
        }

        protected void btComSave_Click(object sender, EventArgs e)
        {
            if (tbCommentPersRes.Text != "")
            {
                var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                var value = GridViewSemaine.SelectedValue.ToString();

                taCahier.P_INSERT_Commentaire_PR_Save(Convert.ToInt32(value), Convert.ToInt32(Session["idUtilisateur"]), tbCommentPersRes.Text);
                GridViewSemaine.DataBind();
            }
        }

        protected void btComAnnul_Click(object sender, EventArgs e)
        {
            tbCommentPersRes.Text = "";
        }

        protected void GridViewEtudiant_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewEtudiant.SelectedRow;
            String id = GridViewEtudiant.DataKeys[row.RowIndex].Value.ToString();
            Session["idEtu"] = GridViewEtudiant.DataKeys[row.RowIndex].Value;

            GridViewSemaine.DataBind();

            GridViewSemaine.SelectRow(0);

            GridViewRow row2 = GridViewSemaine.Rows[GridViewSemaine.SelectedIndex];
            String id2 = GridViewSemaine.DataKeys[row2.RowIndex].Value.ToString();

            DataView dvSql = (DataView)SqlDataSourceCahierSoumis.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                if (drvSql["cahier_rempli"].ToString().Equals("True"))
                {
                    tbHoraire.Text = drvSql["horraire"].ToString();
                    tbEnvLog.Text = drvSql["environnement_logiciel"].ToString();
                    tbEnvMat.Text = drvSql["materiels"].ToString();
                    tbSynthese.Text = drvSql["synthese"].ToString();
                }
                else
                {
                    tbHoraire.Text = "";
                    tbEnvLog.Text = "";
                    tbEnvMat.Text = "";
                    tbSynthese.Text = "";
                }
            }
            
                        DataView dvSql4 = (DataView)SqlDataSourceVerifCommentaire.Select(DataSourceSelectArguments.Empty);
                        foreach (DataRowView drvSql4 in dvSql4)
                        {
                            tbCommentPersRes.Text = drvSql4["commentaire"].ToString();

                            if (drvSql4["commentaireSoumis"].ToString().Equals("True"))
                            {
                                btComSoum.Enabled = false;
                                btComSave.Enabled = false;
                                btComAnnul.Enabled = false;
                                tbCommentPersRes.ReadOnly = true;
                            }
                            else
                            {
                                btComSoum.Enabled = true;
                                btComSave.Enabled = true;
                                btComAnnul.Enabled = true;
                                tbCommentPersRes.ReadOnly = false;
                            }
                        }
        }

        protected void GridViewSemaine_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow  row = GridViewSemaine.Rows[GridViewSemaine.SelectedIndex];
            String id = GridViewSemaine.DataKeys[row.RowIndex].Value.ToString();

            Session["id_semaine"] = GridViewSemaine.DataKeys[row.RowIndex].Value;

            DataView dvSql = (DataView)SqlDataSourceCahierSoumis.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                if (drvSql["cahier_rempli"].ToString().Equals("True"))
                {
                    tbHoraire.Text = drvSql["horraire"].ToString();
                    tbEnvLog.Text = drvSql["environnement_logiciel"].ToString();
                    tbEnvMat.Text = drvSql["materiels"].ToString();
                    tbSynthese.Text = drvSql["synthese"].ToString();

                    DataView dvSql5 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
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
                }
            }


            DataView dvSql4 = (DataView)SqlDataSourceVerifCommentaire.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql4 in dvSql4)
            {
                tbCommentPersRes.Text = drvSql4["commentaire"].ToString();

                if (drvSql4["commentaireSoumis"].ToString().Equals("True"))
                {
                    btComSoum.Enabled = false;
                    btComSave.Enabled = false;
                    btComAnnul.Enabled = false;
                    tbCommentPersRes.ReadOnly = true;
                }
                else
                {
                    btComSoum.Enabled = true;
                    btComSave.Enabled = true;
                    btComAnnul.Enabled = true;
                    tbCommentPersRes.ReadOnly = false;
                }
            }

            
        }

        protected void bRecherche_Click(object sender, EventArgs e)
        {

        }
    }
}