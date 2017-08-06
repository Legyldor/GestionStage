using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Input;

namespace SGSv2.Privée.Entreprise
{
    public partial class EvaluationStagiaireSuperviseur : System.Web.UI.Page
    {
        protected int lastI;
        protected RadioButton rbExcellent;
        protected RadioButton rbTresBien;
        protected RadioButton rbBien;
        protected RadioButton rbMinimal;
        protected RadioButton rbInsuffisant;
        protected List<RadioButton> listRb;
        public List<TableRow> listTR;
        protected TextBox tbFinal;
        protected void Page_Load(object sender, EventArgs e)
        {

            pnlTab.Visible = false;
            if (Session["typeUtilisateur"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            if ((Session["typeUtilisateur"].ToString() == "1") || (Session["typeUtilisateur"].ToString() == "2") || (Session["typeUtilisateur"].ToString() == "4"))
            {
                if (Session["typeUtilisateur"].ToString() == "4")
                {
                    Response.Redirect("~/Privée/Entreprise/EvaluationStagiaire.aspx");
                }
                if (Session["typeUtilisateur"].ToString() == "1")
                {
                    chargementTable();
                    pnlTab.Visible = false;
                }
                if (Session["typeUtilisateur"].ToString() == "2")
                {
                    Response.Redirect("~/Privée/Entreprise/EvaluationStagiaireEnseignant.aspx");
                }
                
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            String commentaireTexte = tbCommentaire.Text;
            GridViewRow gvRow = gvEtudiant.SelectedRow;
            int idPR = int.Parse(gvEtudiant.SelectedValue.ToString());
            var adapter = new MonDataSetTableAdapters.QueriesTableAdapter();
            listTR = new List<TableRow>();
            for (int i = 2; i < tableEval.Rows.Count; i++)
            {
                listTR.Add(tableEval.Rows[i]);
            }

            if ((String)Session["update"] == "False")
            {
                for (int x = 0; x < listTR.Count; x++)
                {
                    int noteCritere;
                    int idCritere;
                    noteCritere = getNote(listTR[x], x);
                    idCritere = int.Parse(listTR[x].ID);
                    //ICIIIIIII
                    //Enregistre note du critere

                    adapter.P_INSERT_Evaluation(idPR, idCritere, noteCritere);
                }
            }
            if ((String)Session["update"] == "True")
            {
                for (int x = 0; x < listTR.Count; x++)
                {
                    int noteCritere;
                    int idCritere;
                    noteCritere = getNote(listTR[x], x);
                    idCritere = int.Parse(listTR[x].ID);
                    //ICIIIIIII
                    //Enregistre note du critere

                    adapter.P_UPDATE_Evaluation(idCritere, noteCritere);
                }
                Session["update"] = "False";
            }
            adapter.P_INSERT_CommentairePR(idPR, commentaireTexte);
        }

        protected void chargementTable()
        {
            var taCritere = new MonDataSetTableAdapters.P_SELECT_CritereTableAdapter();
            var dtCritere = new DataTable();
            dtCritere = taCritere.GetData();
            listTR = new List<TableRow>();
            for (int i = 0; i < dtCritere.Rows.Count; i++)
            {
                rbExcellent = new RadioButton();
                rbExcellent.ID = "rbExcellent" + i + 2;
                rbTresBien = new RadioButton();
                rbTresBien.ID = "rbTresBien" + i + 2;
                rbBien = new RadioButton();
                rbBien.ID = "rbBien" + i + 2;
                rbMinimal = new RadioButton();
                rbMinimal.ID = "rbMinimal" + i + 2;
                rbInsuffisant = new RadioButton();
                rbInsuffisant.ID = "rbInsuffisant" + i + 2;
                listRb = new List<RadioButton>();

                listRb.Add(rbExcellent);
                listRb.Add(rbTresBien);
                listRb.Add(rbBien);
                listRb.Add(rbMinimal);
                listRb.Add(rbInsuffisant);
                TableRow tRow = new TableRow();
                TableCell tCellCrit = new TableCell();

                tRow.ID = dtCritere.Rows[i]["id_CRIT"].ToString();
                tCellCrit.Text = dtCritere.Rows[i]["numCRIT"].ToString() + " - " + dtCritere.Rows[i]["descriptionCRIT"].ToString();
                tRow.Cells.Add(tCellCrit);

                for (int j = 0; j < listRb.Count; j++)
                {
                    listRb.ElementAt(j).GroupName = "group" + i.ToString();
                    TableCell tCellNote = new TableCell();
                    tCellNote.HorizontalAlign = HorizontalAlign.Center;
                    tCellNote.Controls.Add(listRb.ElementAt(j));
                    tRow.Cells.Add(tCellNote);
                }
                tableEval.Rows.Add(tRow);
                listTR.Add(tRow);
                lastI = i;
            }



        }
        protected void flushTable()
        {
            if (listTR != null)
            {
                for (int i = 0; i < listTR.Count; i++)
                {
                    tableEval.Rows.Remove(listTR.ElementAt(i));
                }
            }
        }
        protected int getNote(TableRow tableRow, int index)
        {
            int note = 0;
            if (((RadioButton)tableRow.FindControl("rbExcellent" + index + 2)).Checked)
            {
                note = 1;
            }
            if (((RadioButton)tableRow.FindControl("rbTresBien" + index + 2)).Checked)
            {
                note = 2;
            }
            if (((RadioButton)tableRow.FindControl("rbBien" + index + 2)).Checked)
            {
                note = 3;
            }
            if (((RadioButton)tableRow.FindControl("rbMinimal" + index + 2)).Checked)
            {
                note = 4;
            }
            if (((RadioButton)tableRow.FindControl("rbInsuffisant" + index + 2)).Checked)
            {
                note = 5;
            }
            return note;
        }
        protected void gvEtudiant_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["update"] = "False";
            flushTable();
            tbCommentaire.Text = "";
            GridViewRow gvRow = gvEtudiant.SelectedRow;
            int idPR = int.Parse(gvEtudiant.SelectedValue.ToString());
            chargementTable();
            pnlTab.Visible = true;
            //Remplissage form
            var taEval = new MonDataSetTableAdapters.P_SELECT_EvaluationTableAdapter();
            var dtEval = new DataTable();
            var taCom = new MonDataSetTableAdapters.P_SELECT_CommentairePR_EvaluationTableAdapter();
            var dtCom = new DataTable();
            dtEval = taEval.GetData(idPR);
            dtCom = taCom.GetData(idPR);

            if (dtEval.Rows.Count > 0)
            {
                int id_Crit;
                int note_Crit;

                for (int i = 0; i < dtEval.Rows.Count; i++)
                {
                    id_Crit = int.Parse(dtEval.Rows[i]["id_CRIT"].ToString());
                    note_Crit = int.Parse(dtEval.Rows[i]["id_COTEEVAL"].ToString());
                    setNote(id_Crit, note_Crit, i);
                }
            }
            if (dtCom.Rows.Count > 0)
            {
                tbCommentaire.Text = dtCom.Rows[0]["CommentaireEvaluation"].ToString();
            }
        }

        protected void setNote(int idCrit, int note, int index)
        {
            TableRow tableRow = (TableRow)tableEval.FindControl(idCrit.ToString());
            Session["update"] = "True";
            if (note == 1)
            {

                ((RadioButton)tableRow.FindControl("rbExcellent" + index + 2)).Checked = true;
            }
            if (note == 2)
            {

                ((RadioButton)tableRow.FindControl("rbTresBien" + index + 2)).Checked = true;
            }
            if (note == 3)
            {
                ((RadioButton)tableRow.FindControl("rbBien" + index + 2)).Checked = true;
            }
            if (note == 4)
            {
                ((RadioButton)tableRow.FindControl("rbMinimal" + index + 2)).Checked = true;
            }
            if (note == 5)
            {
                ((RadioButton)tableRow.FindControl("rbInsuffisant" + index + 2)).Checked = true;
            }
        }
    }
}