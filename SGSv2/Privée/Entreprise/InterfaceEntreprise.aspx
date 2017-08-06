<%@ Page Title="Interface Entreprise" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterfaceEntreprise.aspx.cs" Inherits="SGSv2.Privée.Entreprise.InterfaceEntreprise" %>

<asp:Content ID="Content4" ContentPlaceHolderID="maincontent" runat="server">

    <h1 class="fg-white">Entreprise</h1>

    <!-- Menu accordéon pour les réglages --->
    <div id="div_accordion" runat="server" class="accordion" data-role="accordion">
        <div class="accordion-frame">
            <a href="#" class="heading icon-wrench fg-blue"></a>
            <div class="content">
                Toute les années :
                <asp:CheckBox ID="CheckBoxAllYear" runat="server" />
                <br />

                <asp:Button ID="bRecherche" runat="server" Text="Rechercher" OnClick="bRecherche_Click" />

            </div>
        </div>
    </div>

    <div id="allcontent" runat="server">
        <asp:GridView ID="GridViewEtudiant" runat="server" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridViewEtudiant_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_UTIL" DataSourceID="SqlDataSourceEtudiant" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id_UTIL" HeaderText="id_UTIL" InsertVisible="False" ReadOnly="True" SortExpression="id_UTIL" Visible="False" />
                <asp:BoundField DataField="NomPrenom" HeaderText="Etudiant" ReadOnly="True" SortExpression="NomPrenom" />
                <asp:BoundField DataField="nb_Semaine_STAGE" HeaderText="Nombre de semaines" SortExpression="nb_Semaine_STAGE" />
                <asp:BoundField DataField="dateDebut_STAGE" HeaderText="Date de début de stage" SortExpression="dateDebut_STAGE" />
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

        <asp:SqlDataSource ID="SqlDataSourceEtudiant" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_LISTE_Etudiants_Entreprise" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_UTIL" SessionField="idUtilisateur" Type="Int32" />
                <asp:ControlParameter ControlID="CheckBoxAllYear" DefaultValue="false" Name="bit_AllYear" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewSemaine" OnSelectedIndexChanged="GridViewSemaine_SelectedIndexChanged" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Semaine,numero_Semaine" DataSourceID="SqlDataSourceSemainesEtudiant" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id_Semaine" HeaderText="id_Semaine" InsertVisible="False" ReadOnly="True" SortExpression="id_Semaine" Visible="False" />
                <asp:BoundField DataField="numero_Semaine" HeaderText="Semaine" SortExpression="numero_Semaine" />
                <asp:CheckBoxField DataField="cahier_rempli" HeaderText="Cahier" SortExpression="cahier_rempli" />
                <asp:CheckBoxField DataField="commentaire_enseignant_soumis" HeaderText="Commentaire Superviseur" SortExpression="commentaire_enseignant_soumis" />
                <asp:CheckBoxField DataField="EstSoumisCOMPR" HeaderText="Commentaire Personne Ressource" ReadOnly="True" SortExpression="EstSoumisCOMPR" />
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
        <asp:SqlDataSource ID="SqlDataSourceSemainesEtudiant" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Liste_Semaine" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_user" SessionField="idEtu" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCahierSoumis" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Cahier" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSourceVerifCommentaire" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_PR_Verif" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_UTIL" SessionField="idUtilisateur" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Tache_Apprentissage_Difficultes_BY_Semaine" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="tab-control" data-effect="fade[slide]" data-role="tab-control">
            <ul class="tabs">
                <li class="active"><a href="#_ComPS">Commentaire Personne ressource</a></li>
                <li><a href="#_Semaine">Semaine</a></li>

            </ul>
            <div class="frames">

                <div class="frame" id="_Semaine">
                    <asp:Label ID="lbHoraire" runat="server" Text="Horaire :" Enabled="False"></asp:Label><br />
                    <asp:TextBox ID="tbHoraire" runat="server" Height="32px" Width="300px" Enabled="False"></asp:TextBox><br />

                    <asp:Label ID="lbEnvLog" runat="server" Text="Environnement Logiciel :" Enabled="False"></asp:Label><br />
                    <asp:TextBox ID="tbEnvLog" runat="server" Height="32px" Width="300px" Enabled="False"></asp:TextBox><br />

                    <asp:Label ID="lbEnvMat" runat="server" Text="Environnement Materiel :" Enabled="False"></asp:Label><br />
                    <asp:TextBox ID="tbEnvMat" runat="server" Height="32px" Width="300px" Enabled="False"></asp:TextBox><br />

                    <asp:Label ID="lbSynthese" runat="server" Text="Synthèse :" Enabled="False"></asp:Label><br />
                    <asp:TextBox ID="tbSynthese" runat="server" Height="100px" Width="300px" TextMode="MultiLine" Enabled="False"></asp:TextBox><br />

                    <asp:Label ID="LabelApprentissage" runat="server" Text="Apprentissage :"></asp:Label><br />
                    <asp:TextBox ID="TextBoxApprentissage" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />
                    <br />

                    <asp:Label ID="LabelDifficultes" runat="server" Text="Difficultés :"></asp:Label><br />
                    <asp:TextBox ID="TextBoxDifficultes" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />

                    <asp:Label ID="LabelTache" runat="server" Text="Tâche :"></asp:Label><br />
                    <asp:TextBox ID="TextBoxTache" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />
                </div>
                <div class="frame" id="_ComPS">
                    <asp:TextBox ID="tbCommentPersRes" runat="server" Height="100px" Width="300px" Rows="1" TextMode="MultiLine" Enabled="True"></asp:TextBox>

                    <asp:Button ID="btComSoum" runat="server" Text="Soumettre" OnClick="btComSoum_Click" />

                    <asp:Button ID="btComSave" runat="server" Text="Sauvegarder" OnClick="btComSave_Click" />

                    <asp:Button ID="btComAnnul" runat="server" Text="Annuler" OnClick="btComAnnul_Click" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
