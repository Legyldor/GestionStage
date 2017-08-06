<%@ Page Title="Gestion Stage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionStage.aspx.cs" Inherits="SGSv2.Stage.GestionStage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">  
    <h1 class="fg-white">Gestion des Stages</h1>

    <!-- Menu accordéon pour les réglages --->
        <div id="div_accordion" runat="server" class="accordion" data-role="accordion">
            <div class="accordion-frame">
                <a href="#" class="heading icon-wrench fg-blue"> </a>
                <div class="content">
                   Tout les stages : <asp:CheckBox ID="CheckBoxAllStage" runat="server" Checked="false" /> <br />
                    Toute les années : <asp:CheckBox ID="CheckBoxAllYear" runat="server" /> <br />

                    <asp:Button ID="bRecherche" runat="server" Text="Rechercher" OnClick="bRecherche_Click" />
                
                </div>
             </div>
        </div>
    
    <div>
        <asp:GridView ID="gridViewStage" runat="server" AllowPaging="True"
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="DB_Stage" ForeColor="#333333" GridLines="None"
            DataKeyNames="ID_STAGE" Width="100%" OnDataBound="gridViewStage_DataBound" OnSelectedIndexChanged="gridViewStage_OnSelectedIndexChanged" OnRowDataBound="gridViewStage_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id_STAGE" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id_STAGE" Visible="False" />
                
                <asp:BoundField DataField="nb_semaine_STAGE" HeaderText="Nombre de semaine" SortExpression="nb_semaine_STAGE" />

                <asp:BoundField DataField="dateDebut_STAGE" HeaderText="Date de début" SortExpression="dateDebut_STAGE" />

                <asp:TemplateField HeaderText="Superviseur" SortExpression="NomPrenomSuperviseur">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropListSuperviseur" runat="server" DataSourceID="DB_Superviseur" DataTextField="NomPrenom" DataValueField="id_UTIL" selectedValue='<%# Bind("id_UTIL") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("NomPrenomSuperviseur") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id_UTIL" HeaderText="id_sup" SortExpression="id_UTIL" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:TemplateField HeaderText="Entreprise" SortExpression="nom_ENT">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DB_Entreprise" DataTextField="nom_ENT" DataValueField="id_ENT" selectedValue='<%# Bind("id_ENT") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("nom_ENT") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id_ENT" HeaderText="id_ENT" SortExpression="id_ENT" Visible="False" />
                <asp:TemplateField HeaderText="Etudiant" SortExpression="NomPrenomEtudiant">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropListEtudiant" runat="server" DataSourceID="DB_Etudiant" DataTextField="NomPrenom" DataValueField="id_UTIL" selectedValue='<%# Bind("id_UTIL1") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NomPrenomEtudiant") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id_UTIL1" HeaderText="id_etu" InsertVisible="False" ReadOnly="True" SortExpression="id_UTIL1" Visible="False" />
                <asp:BoundField DataField="description_STAGE" HeaderText="Description" SortExpression="description_STAGE" />
                
                
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Mettre à jour"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Annuler"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Modifier" Visible='<%# commandFieldEditIsVisible((int)Eval("id_UTIL")) %>'></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Supprimer" Visible='<%# commandFieldDeleteIsVisible((int)Eval("id_UTIL")) %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                 </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </div>
     <div id="btVisible">
        <asp:Button class="default bg-green fg-white" ID="btAJVisible" runat="server" Text="Ajouter un stage" OnClick="btAJVisible_OnClick"/>
        <asp:Button class="default bg-green fg-white" ID="btAJPR" runat="server" Text="Ajouter une personne ressource" OnClick="btAJPR_OnClick"/>
        <asp:button class="default bg-green fg-white" ID="BtnAjouterUnUtilisateur" OnClick="btnAjoutUtil" runat="server" text="Ajouter un utlisateur"> </asp:button> <br />
   
     </div>
    <div id="btInVisible">
        <asp:Button class="default bg-green fg-white" ID="btAJInVisible" Visible="false" runat="server" Text="Up" OnClick="btAJInVisible_OnClick"/>
    </div>
    <div runat="server" class="text size2" id="AjoutUtilisateur">
        <br />
        <asp:Label ID="LabNameUtil" runat="server" Text="Nom :"></asp:Label>
        <asp:TextBox ID="TBNameUtil" runat="server"></asp:TextBox> &nbsp;<asp:Label ID="LbPrenomUtil" runat="server" Text="Prénom :"></asp:Label>
        <asp:TextBox ID="TbPrenomUtil" runat="server"></asp:TextBox> <br />

        <asp:Label ID="LbMail" runat="server" Text="Mail :"></asp:Label>
        <asp:TextBox ID="TbMailUtil" runat="server"></asp:TextBox> <br />

        <asp:Label ID="LbTéléphonne" runat="server" Text="Téléphonne :"></asp:Label>
        <asp:TextBox ID="Tbtéléphonne" runat="server"></asp:TextBox> <br />
        <br />
        
        <asp:Button class="default bg-green fg-white" ID="BtnRetour" Visible="true" runat="server" Text="Retour" OnClick="BtnRetour_Click" />
        <asp:Button class="default bg-green fg-white" ID="BtnValider" Visible="true" runat="server" Text="Créer" OnClick="BtnValider_Click" />
        <br />
    </div>

    <div class="text size2" id="AjStage">
    Superviseur
        <asp:DropDownList ID="DDLSup" runat="server" DataSourceID="DB_Superviseur" DataTextField="NomPrenom" DataValueField="id_UTIL"></asp:DropDownList>
    <br />
    Etudiant
        <asp:DropDownList ID="DDLEtu" runat="server" DataSourceID="DB_Etudiant" DataTextField="NomPrenom" DataValueField="id_UTIL"></asp:DropDownList>
        <br />
        Entreprise
        <asp:DropDownList ID="DDLEntr" runat="server" DataSourceID="DB_Entreprise" DataTextField="nom_ENT" DataValueField="id_ENT">
        </asp:DropDownList>
        <asp:button class="mini bg-green fg-white" onclick="loadGestionEntreprise" runat="server" text="+"> </asp:button>
        <br />
    <br />
    Début de stage
        <br />

        <div class="input-control text" data-role="datepicker"
            data-effect='slide'
            data-format='yyyy/mm/dd'
            data-locale='fr'
            style="width:100%" >
    
            <input type="text" id="tbDate" runat="server" />
            <button class="btn-date" type="button"></button>
        </div>

        <br />
    Nombre de semaines
    
    <asp:TextBox ID="txtNombreSemaine" runat="server"  TextMode="Number"></asp:TextBox><br />
    Description
        
    <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
        <br/>
        
        <asp:button  ID="btnInser" onclick="btnInser_Click" runat="server" text="Insérer"> </asp:button>
       </div>
    <div class="text size2" id="AjPersonneR">
    Utilisateur :
        <br />

        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="DBUtilisateurEntreprise" DataTextField="NomPrenom" DataValueField="id_UTIL">
        </asp:DropDownList>

        <br/>
        
        <asp:button class="default bg-green fg-white" ID="Button1" onclick="ButtonInserPR_Click" runat="server" text="Insérer"> </asp:button>
        </div>
    <script>
        invisible();
        invisible2();
        function visible() {
            document.getElementById("AjStage").style.display = "block";
            document.getElementById("btVisible").style.display = "none";
        }
        function invisible() {
            document.getElementById("AjStage").style.display = "none";
            document.getElementById("btVisible").style.display = "block";
        }

        function visible2() {
            document.getElementById("AjPersonneR").style.display = "block";
            document.getElementById("btVisible").style.display = "none";

        }

        function invisible2() {
            document.getElementById("AjPersonneR").style.display = "none";
            document.getElementById("btVisible").style.display = "block";

        }
    </script>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="DB_Stage" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Stage" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Stage" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Stage" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Stage" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_Stage" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_etudiant" Type="Int32" />
                <asp:Parameter Name="id_superviseur" Type="Int32" />
                <asp:Parameter DbType="Date" Name="annee" />
                <asp:Parameter Name="nbSemaine" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="id_ENT" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_enseignant" SessionField="idUtilisateur" Type="Int32" />
                <asp:ControlParameter ControlID="CheckBoxAllYear" DefaultValue="false" Name="bit_AllYear" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="CheckBoxAllStage" DefaultValue="false" Name="bit_ToutStages" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_STAGE" Type="Int32" />
                <asp:Parameter Name="id_UTIL1" Type="Int32" />
                <asp:Parameter Name="id_UTIL" Type="Int32" />
                <asp:Parameter Name="dateDebut_STAGE" DbType="Date" />
                <asp:Parameter Name="nb_semaine_STAGE" Type="Int32" />
                <asp:Parameter Name="description_STAGE" Type="String" />
                <asp:Parameter Name="id_ENT" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    <div id="gvpr">
        <h1 class="fg-white">Personnes Ressources</h1>
    <asp:GridView ID="gridViewPersonneRessource" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="#333333" GridLines="None" DataKeyNames="id_PERSRES" DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_PERSRES" HeaderText="id_PERSRES" InsertVisible="False" ReadOnly="True" SortExpression="id_PERSRES" Visible="False" />
            <asp:TemplateField HeaderText="Nom, Prenom" SortExpression="NomPrenom">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DBUtilisateurEntreprise" DataTextField="NomPrenom" DataValueField="id_UTIL" SelectedValue='<%# Bind("id_UTIL") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NomPrenom") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_PersonneRessource" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_PersonneRessource" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_PersonneRessource_BY_Stage" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_PersonneRessource" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_PERSRES" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_STAGE" Type="Int32" />
            <asp:Parameter Name="id_UTIL" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idStage" SessionField="idStage" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_PERSRES" Type="Int32" />
            <asp:Parameter Name="id_UTIL" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DB_Superviseur" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Utilisateur" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Utilisateur" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Superviseurs" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Utilisateur" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_UTIL" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nom_UTIL" Type="String" />
            <asp:Parameter Name="prenom_UTIL" Type="String" />
            <asp:Parameter Name="mail_UTIL" Type="String" />
            <asp:Parameter Name="id_TYPUTIL" Type="Int32" />
            <asp:Parameter Name="mdp_UTIL" Type="String" />
            <asp:Parameter Name="telephone_UTIL" Type="String" />
            <asp:Parameter Name="actif_UTIL" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_UTIL" Type="Int32" />
            <asp:Parameter Name="nom_UTIL" Type="String" />
            <asp:Parameter Name="prenom_UTIL" Type="String" />
            <asp:Parameter Name="mail_UTIL" Type="String" />
            <asp:Parameter Name="id_TYPUTIL" Type="Int32" />
            <asp:Parameter Name="actif_UTIL" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DBUtilisateurEntreprise" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Liste_UtilisateurEntreprise" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="DB_Etudiant" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Utilisateur" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Utilisateur" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Etudiants" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Utilisateur" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_UTIL" Type="Int32" />
            <asp:Parameter Name="id_TYPUTIL" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nom_UTIL" Type="String" />
            <asp:Parameter Name="prenom_UTIL" Type="String" />
            <asp:Parameter Name="mail_UTIL" Type="String" />
            <asp:Parameter Name="id_TYPUTIL" Type="Int32" />
            <asp:Parameter Name="mdp_UTIL" Type="String" />
            <asp:Parameter Name="telephone_UTIL" Type="String" />
            <asp:Parameter Name="actif_UTIL" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_UTIL" Type="Int32" />
            <asp:Parameter Name="nom_UTIL" Type="String" />
            <asp:Parameter Name="prenom_UTIL" Type="String" />
            <asp:Parameter Name="mail_UTIL" Type="String" />
            <asp:Parameter Name="telephone_UTIL" Type="String" />
            <asp:Parameter Name="id_TYPUTIL" Type="Int32" />
            <asp:Parameter Name="actif_UTIL" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DB_Entreprise" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Entreprise" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Entreprise" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Entreprise" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Entreprise" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_ENT" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nom_ENT" Type="String" />
            <asp:Parameter Name="adresse_ENT" Type="String" />
            <asp:Parameter Name="ville_ENT" Type="String" />
            <asp:Parameter Name="codepostal_ENT" Type="String" />
            <asp:Parameter Name="telephone_ENT" Type="String" />
            <asp:Parameter Name="mail_ENT" Type="String" />
            <asp:Parameter Name="fax_ENT" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_ENT" Type="Int32" />
            <asp:Parameter Name="nom_ENT" Type="String" />
            <asp:Parameter Name="adresse_ENT" Type="String" />
            <asp:Parameter Name="ville_ENT" Type="String" />
            <asp:Parameter Name="codepostal_ENT" Type="String" />
            <asp:Parameter Name="telephone_ENT" Type="String" />
            <asp:Parameter Name="mail_ENT" Type="String" />
            <asp:Parameter Name="fax_ENT" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>


