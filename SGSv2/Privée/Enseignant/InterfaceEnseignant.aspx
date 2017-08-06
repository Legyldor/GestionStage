<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterfaceEnseignant.aspx.cs" Inherits="SGSv2.Privée.Enseignant.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
   <div id="div_accordion" runat="server" class="accordion" data-role="accordion">
            <div class="accordion-frame">
                <a href="#" class="heading icon-wrench fg-blue"> </a>
                <div class="content">
                    Toute les années : <asp:CheckBox ID="CheckBoxAllYear" runat="server" /> <br />
                    Toute les stages : <asp:CheckBox ID="CheckBoxAllStage" runat="server" /> <br />

                    <asp:Button ID="bRecherche" runat="server" Text="Rechercher" OnClick="bRecherche_Click" />
                
                </div>
             </div>
        </div>
    <div id="allContent" runat="server">
    <asp:GridView ID="gvListeEtu" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_etudiant_STAGE,id_superviseur_STAGE" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" OnSelectedIndexChanged="gvListeEtu_SelectedIndexChanged" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_etudiant_STAGE" HeaderText="id_etudiant_STAGE" SortExpression="id_etudiant_STAGE" Visible="False" />
            <asp:BoundField DataField="id_superviseur_STAGE" HeaderText="id_superviseur_STAGE" SortExpression="id_superviseur_STAGE" Visible="False" />
            <asp:BoundField DataField="NomPrenom" HeaderText="Nom Etudiant" ReadOnly="True" SortExpression="NomPrenom" />
            <asp:BoundField DataField="nom_ENT" HeaderText="Nom Entreprise" SortExpression="nom_ENT" />
            <asp:BoundField DataField="nb_Semaine_STAGE" HeaderText="Nombre de semaine" SortExpression="nb_Semaine_STAGE" />
            <asp:BoundField DataField="dateDebut_STAGE" HeaderText="Date de début" SortExpression="dateDebut_STAGE" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Etudiant_By_Enseignant" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_enseignant" SessionField="idUtilisateur" Type="Int32" />
            <asp:ControlParameter ControlID="CheckBoxAllYear" DefaultValue="false" Name="allyear" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="CheckBoxAllStage" DefaultValue="false" Name="allStage" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="gvSemaine" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Semaine,numero_Semaine" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvSemaine_SelectedIndexChanged" OnAllowSorting="True" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_Semaine" HeaderText="id_Semaine" InsertVisible="False" ReadOnly="True" SortExpression="id_Semaine" Visible="False" />
            <asp:BoundField DataField="numero_Semaine" HeaderText="Semaine" SortExpression="numero_Semaine" />
            <asp:CheckBoxField DataField="cahier_rempli" HeaderText="Cahier rempli" SortExpression="cahier_rempli" />
            <asp:CheckBoxField DataField="commentaire_enseignant_soumis" HeaderText="Commentaire enseignant " SortExpression="commentaire_enseignant_soumis" />
            <asp:CheckBoxField DataField="EstSoumisCOMPR" HeaderText="Commentaire personne ressource" ReadOnly="True" SortExpression="EstSoumisCOMPR" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Liste_Semaine" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_user" SessionField="idEtu" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <div class="tab-control" data-effect="fade[slide]" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#_ComSup">Commentaire Superviseur</a></li>
            <li><a href="#_ComPS">Commentaire Personne ressource</a></li>
            <li><a href="#_Semaine">Semaine</a></li>
        </ul>

        <div class="frames">
            
            <div class="frame" id="_ComSup">
                <asp:TextBox ID="tbCommentSuper" runat="server" Height="100px" Width="300px" Rows="1" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btDesoumettreSuperviseur"  runat="server" Text="Desoumettre" OnClick="btDesoumettreSuperviseur_Click"/>
                <asp:Button ID="btSoumettre"  runat="server" Text="Soumettre" OnClick="btSoumettre_OnClick"/>
                <asp:Button ID="btSauvegarder"  runat="server" Text="Sauvegarder" OnClick="btSauvegarder_OnClick"/>
                <asp:Button ID="btAnuller"  runat="server" Text="Annuler" OnClick="btAnuller_OnClick" />
            </div>
            <div class="frame" id="_ComPS">
                
                <asp:GridView ID="GridViewComPR" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewComPR_RowCommand" DataKeyNames="id_COMPR,id_UTIL" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_COMPR" HeaderText="id_COMPR" InsertVisible="False" ReadOnly="True" SortExpression="id_COMPR" Visible="False" />
            <asp:BoundField DataField="id_UTIL" HeaderText="id_UTIL" InsertVisible="False" ReadOnly="True" SortExpression="id_UTIL" Visible="False"/>
            <asp:BoundField DataField="NomPremom" HeaderText="Personne Ressource" ReadOnly="True" SortExpression="NomPremom" />
            <asp:CheckBoxField DataField="commentaireSoumis" HeaderText="Commentaire Soumis" SortExpression="commentaireSoumis" ReadOnly="True" />
            <asp:TemplateField HeaderText="Commentaire" SortExpression="commentaire">
                <EditItemTemplate>
                    <textarea id="TextArea1" name="S1"></textarea>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("commentaire") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonDesoumettre" runat="server" CausesValidation="False"
                            CommandName="Desoumettre" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                            Text="Desoumettre"></asp:LinkButton>
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
            <div class="frame" id="_Semaine">
                <asp:Label ID="lbHorraire" runat="server" Text="Horraire :"></asp:Label><br />
                <asp:TextBox ID="tbHoraire" runat="server" Height="32px" Width="300px"></asp:TextBox><br />

                <asp:Label ID="lbEnvLog" runat="server" Text="Environnement Logiciel :"></asp:Label><br />
                <asp:TextBox ID="tbEnvLog" runat="server" Height="32px" Width="300px"></asp:TextBox><br />

                <asp:Label ID="lbEnvMat" runat="server" Text="Environnement Materiel :"></asp:Label><br />
                <asp:TextBox ID="tbEnvMat" runat="server" Height="32px" Width="300px"></asp:TextBox><br />

                <asp:Label ID="lbSynthese" runat="server" Text="Synthèse :"></asp:Label><br />
                <asp:TextBox ID="tbSynthese" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />

                <asp:Label ID="LabelApprentissage" runat="server" Text="Apprentissage :"></asp:Label><br />
                <asp:TextBox ID="TextBoxApprentissage" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />


                <asp:Label ID="LabelDifficultes" runat="server" Text="Difficultés :"></asp:Label><br />
                <asp:TextBox ID="TextBoxDifficultes" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />

                <asp:Label ID="LabelTache" runat="server" Text="Tâche :"></asp:Label><br />
                <asp:TextBox ID="TextBoxTache" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox><br />
                <br />

                 <asp:Button ID="ButtonDesoumettreCahier"  runat="server" Text="Desoumettre" OnClick="ButtonDesoumettreCahier_Click"/>
                <br />
            </div>
        </div>
    </div>

    


    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Cahier" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_PR" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_Superviseur" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_Sup_Soumis" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_PR" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Tache_Apprentissage_Difficultes_BY_Semaine" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
