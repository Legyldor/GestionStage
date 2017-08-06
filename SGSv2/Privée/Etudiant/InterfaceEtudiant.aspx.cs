using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2.Privée.Etudiant
{
    public partial class InterfaceEtudiant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null || !Session["typeUtilisateur"].Equals(3))
            {
                Response.Redirect("~/Connexion/Connexion.aspx");
            }
            else
            {
                switch (int.Parse(Session["typeUtilisateur"].ToString()))
                {
                    case 1:
                        tbSynthese.ReadOnly = true;
                        tbEnvMat.ReadOnly = true;
                        tbEnvLog.ReadOnly = true;
                        tbHoraire.ReadOnly = true;
                        tbCommentSuper.ReadOnly = true;
                        break;
                    case 2:
                        tbSynthese.ReadOnly = true;
                        tbEnvMat.ReadOnly = true;
                        tbEnvLog.ReadOnly = true;
                        tbHoraire.ReadOnly = true;
                        tbCommentSuper.ReadOnly = true;
                        break;
                    case 3:
                        tbCommentSuper.ReadOnly = true;
                        break;
                    case 4:
                        tbSynthese.ReadOnly = true;
                        tbEnvMat.ReadOnly = true;
                        tbEnvLog.ReadOnly = true;
                        tbHoraire.ReadOnly = true;
                        tbCommentSuper.ReadOnly = true;
                        break;
                }
                if(gvSemaine.Rows.Count>0 && !IsPostBack){
                    gvSemaine.SelectRow(0);
                }
                if (gvSemaine.Rows.Count < 0 )
                {
                    allContent.Visible = false;
                }
            }
        }
        protected void gvSemaine_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            gvSemaine.SelectedIndex = e.NewSelectedIndex;
        }

        protected void btCahier_OnClick(object sender, EventArgs e)
        {
            if (tbHoraire.Text != "" )
            {
                if (tbEnvLog.Text != "")
                {
                    if (tbEnvMat.Text != "")
                    {
                        if (tbSynthese.Text != "")
                        {
                            var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                            int value = Convert.ToInt32(gvSemaine.SelectedValue.ToString());

                            taCahier.P_INSERT_Cahier_SansSoumission(value, tbHoraire.Text, tbEnvLog.Text, tbEnvMat.Text, tbSynthese.Text);
                            tbHoraire.Text = "";
                            tbEnvLog.Text = "";
                            tbEnvMat.Text = "";
                            tbSynthese.Text = "";

                            if (TextBoxTache.Text != "")
                            {
                                var taTache = new MonDataSetTableAdapters.QueriesTableAdapter();
                                GridViewRow row = gvSemaine.SelectedRow;
                                int idSemaine = Convert.ToInt32(gvSemaine.DataKeys[row.RowIndex].Value);
                                taTache.P_INSERT_Tache_By_Semaine(idSemaine, TextBoxTache.Text);
                                TextBoxTache.Text = "";
                                
                            }

                            if (TextBoxDifficultes.Text != "")
                            {
                                var taDifficultes = new MonDataSetTableAdapters.QueriesTableAdapter();
                                GridViewRow row = gvSemaine.SelectedRow;
                                int idSemaine = Convert.ToInt32(gvSemaine.DataKeys[row.RowIndex].Value);
                                taDifficultes.P_INSERT_Difficultes_By_Semaine(idSemaine, TextBoxDifficultes.Text);
                                TextBoxDifficultes.Text = "";
                               
                            }

                            if (TextBoxApprentissage.Text != "")
                            {
                                var taApprentissage = new MonDataSetTableAdapters.QueriesTableAdapter();
                                GridViewRow row = gvSemaine.SelectedRow;
                                int idSemaine = Convert.ToInt32(gvSemaine.DataKeys[row.RowIndex].Value);
                                taApprentissage.P_INSERT_Apprentissage_By_Semaine(idSemaine, TextBoxApprentissage.Text);
                                TextBoxApprentissage.Text = "";
                                
                            }
                            gvSemaine.DataBind();
                            databindinfo();
                        }
                    }
                }
            }
            gvSemaine.DataBind();
        }

        protected void btCahierAnnul_Click(object sender, EventArgs e)
        {
            tbHoraire.Text = "";
            tbEnvLog.Text = "";
            tbEnvMat.Text = "";
            tbSynthese.Text = "";
        }

        protected void btCahierSoum_Click(object sender, EventArgs e)
        {
            if (tbHoraire.Text != "")
            {
                if (tbEnvLog.Text != "")
                {
                    if (tbEnvMat.Text != "")
                    {
                        if (tbSynthese.Text != "")
                        {
                           var taCahier = new MonDataSetTableAdapters.QueriesTableAdapter();
                           var taMail = new MonDataSetTableAdapters.P_SELECT_Adresse_mail_by_IDTableAdapter();
                           var dtMail = new DataTable();


                            dtMail = taMail.GetData((int)Session["idUtilisateur"]);

                            GridViewRow row = gvSemaine.SelectedRow;
                            int idSemaine = Convert.ToInt32(gvSemaine.DataKeys[row.RowIndex].Value);
                            taCahier.P_INSERT_Cahier(idSemaine, tbHoraire.Text, tbEnvLog.Text, tbEnvMat.Text, tbSynthese.Text);

                            Service.MailService srv = new Service.MailService();

                           List<String> msgTo = new List<string>();
                           List<String> msgCC = new List<string>();
                           List<String> msgCCI = new List<string>();

                           String mail = dtMail.Rows[0]["mail_UTIL"].ToString();

                           msgTo.Add(mail);
                           String numSemaine = "";
                           int i = 0;
                           DataView dvSql4 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                           foreach (DataRowView drvSql4 in dvSql4)
                           {
                               if (i == gvSemaine.SelectedIndex)
                               {
                                   numSemaine = drvSql4["numero_Semaine"].ToString();
                               }
                               i++;
                           }
                           srv.envoyerCourriel("Nouvelles données dans le cahier de " + Session["utilisateur"], "L'étudiant " + Session["utilisateur"] + " à ajouter des données pour la semaine "+ numSemaine + ".", msgTo, msgCC, msgCCI);
                           gvSemaine.DataBind();
                           databindinfo();
                        }
                    }
                }
            }
           
        }

        protected void gvSemaine_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSemaine.SelectedRow;
            String id = gvSemaine.DataKeys[row.RowIndex].Value.ToString();
            Session["id_semaine"] = id;
            databindinfo();

        }

        public void databindinfo()
        {
            DataView dvSql = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                tbHoraire.Text = drvSql["horraire"].ToString();
                tbEnvLog.Text = drvSql["environnement_logiciel"].ToString();
                tbEnvMat.Text = drvSql["materiels"].ToString();
                tbSynthese.Text = drvSql["synthese"].ToString();
            }

            GridViewComPR.DataBind();

            DataView dvSql3 = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql3 in dvSql3)
            {
                if (drvSql3["commentaire_enseignant_soumis"].ToString().Equals("True"))
                {
                    tbCommentSuper.Text = drvSql3["commentaire_enseignant"].ToString();
                }
                else
                {
                    tbCommentSuper.Text = "";
                }
            }
            DataView dvSql4 = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql4 in dvSql4)
            {

                if (drvSql4["cahier_rempli"].ToString().Equals("True"))
                {
                    tbHoraire.ReadOnly = true;
                    tbEnvLog.ReadOnly = true;
                    tbEnvMat.ReadOnly = true;
                    tbSynthese.ReadOnly = true;
                    btCahierSoum.Enabled = false;
                    btCahierAnnul.Enabled = false;
                    btCahier.Enabled = false;

                    TextBoxApprentissage.Enabled = false;
                    TextBoxDifficultes.Enabled = false;
                    TextBoxTache.Enabled = false;
                    
                }
                else
                {
                    tbHoraire.ReadOnly = false;
                    tbEnvLog.ReadOnly = false;
                    tbEnvMat.ReadOnly = false;
                    tbSynthese.ReadOnly = false;
                    btCahierSoum.Enabled = true;
                    btCahierAnnul.Enabled = true;
                    btCahier.Enabled = true;

                    TextBoxApprentissage.Enabled = true;
                    TextBoxDifficultes.Enabled = true;
                    TextBoxTache.Enabled = true;
                }
            }

            DataView dvSql5 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql5 in dvSql5)
            {
                TextBoxApprentissage.Text = drvSql5["apprentisage_semaine"].ToString();

                TextBoxDifficultes.Text = drvSql5["difficultés-semaine"].ToString();

                TextBoxTache.Text = drvSql5["tâche_semaine"].ToString();

            }
        }
    }
}