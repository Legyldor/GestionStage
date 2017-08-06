using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSv2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUtilisateur"] == null)
            {
                //Gestion des utilisateurs déconnectés
                lbConnectezVous.Text = "Connectez-vous !";
                //Interface invisible
                titreGestion.Visible = false;
                gestionUtil.Visible = false;
                gestionEntreprise.Visible = false;
                gestionStage.Visible = false;
                gestionCritere.Visible = false;
                titreEnseignant.Visible = false;
                interfEnseignant.Visible = false;
                titreEtudiant.Visible = false;
                interfEtudiant.Visible = false;
                titreEntreprise.Visible = false;
                InterfaceEntreprise.Visible = false;
                evalStagiaire.Visible = false;
            }
            else
            {
                //Gestion des utilisateur connecté, assignations des menus en fonction de leur type
                lbConnectezVous.Text = Session["utilisateur"].ToString();
                switch (int.Parse(Session["typeUtilisateur"].ToString()))
                {
                    case 1:
                        titreGestion.Visible = true;
                        gestionUtil.Visible = true;
                        gestionEntreprise.Visible = true;
                        gestionStage.Visible = true;
                        titreEnseignant.Visible = true;
                        interfEnseignant.Visible = true;
                        gestionCritere.Visible = true;
                        evalStagiaire.Visible = true;

                        titreEtudiant.Visible = false;
                        interfEtudiant.Visible = false;
                        titreEntreprise.Visible = false;
                        InterfaceEntreprise.Visible = false;
                        

                        break;
                    case 2:
                        titreGestion.Visible = true;
                        gestionEntreprise.Visible = true;
                        gestionStage.Visible = true;
                        titreEnseignant.Visible = true;
                        interfEnseignant.Visible = true;
                        titreEntreprise.Visible = true;
                        InterfaceEntreprise.Visible = true;
                        evalStagiaire.Visible = true;
                        gestionCritere.Visible = false;

                        gestionUtil.Visible = false;
                        titreEtudiant.Visible = false;
                        interfEtudiant.Visible = false;
                        break;
                    case 3:
                        titreEtudiant.Visible = true;
                        interfEtudiant.Visible = true;

                        gestionCritere.Visible = false;
                        titreGestion.Visible = false;
                        gestionEntreprise.Visible = false;
                        gestionStage.Visible = false;
                        titreEnseignant.Visible = false;
                        interfEnseignant.Visible = false;
                        gestionUtil.Visible = false;
                        titreEntreprise.Visible = false;
                        InterfaceEntreprise.Visible = false;
                        evalStagiaire.Visible = false;

                        break;
                    case 4:
                        titreEntreprise.Visible = true;
                        InterfaceEntreprise.Visible = true;
                        evalStagiaire.Visible = true;

                        gestionCritere.Visible = false;
                        titreEtudiant.Visible = false;
                        interfEtudiant.Visible = false;
                        titreGestion.Visible = false;
                        gestionEntreprise.Visible = false;
                        gestionStage.Visible = false;
                        titreEnseignant.Visible = false;
                        interfEnseignant.Visible = false;
                        gestionUtil.Visible = false;

                        break;
                }
            }
        }
    }
}