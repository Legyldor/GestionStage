<%@ Page Title="Interface étudiant" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterfaceEtudiant.aspx.cs" Inherits="SGSv2.Privée.Etudiant.InterfaceEtudiant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div id="allContent" runat="server">
    <asp:GridView ID="gvSemaine" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataKeyNames="id_Semaine" OnSelectedIndexChanged="gvSemaine_SelectedIndexChanged" Width="100%" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_Semaine" HeaderText="id_Semaine" SortExpression="id_Semaine" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="numero_Semaine" HeaderText="No Semaine" SortExpression="numero_Semaine" />
            <asp:CheckBoxField DataField="cahier_rempli" HeaderText="Cahier" SortExpression="cahier_rempli" />
            <asp:CheckBoxField DataField="commentaire_enseignant_soumis" HeaderText="Commentaire enseignant" SortExpression="commentaire_enseignant_soumis" />
            <asp:CheckBoxField DataField="EstSoumisCOMPR" HeaderText="Commentaire Superviseur" SortExpression="EstSoumisCOMPR" ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <br />
    <div class="tab-control" data-effect="fade[slide]" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#_Semaine">Semaine</a></li>
            <li><a href="#_ComSup">Commentaire Superviseur</a></li>
            <li><a href="#_ComPS">Commentaire Personne ressource</a></li>
        </ul>
        <div class="frames">
            <div class="frame" id="_Semaine">

                <asp:Label ID="lbHoraire" runat="server" Text="Horaire :"></asp:Label><br />
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

                <asp:Button ID="btCahierSoum" runat="server" Text="Soumettre" OnClick="btCahierSoum_Click" />

                <asp:Button ID="btCahier" runat="server" Text="sauvegarder" OnClick="btCahier_OnClick" />

                <asp:Button ID="btCahierAnnul" runat="server" Text="Annuler" OnClick="btCahierAnnul_Click" />

            </div>
            <div class="frame" id="_ComSup">
                <asp:TextBox ID="tbCommentSuper" runat="server" Height="100px" Width="300px" Rows="1" TextMode="MultiLine" Enabled="False" Text=""></asp:TextBox>
            </div>
            <div class="frame" id="_ComPS">
                <asp:GridView ID="GridViewComPR" runat="server" AutoGenerateColumns="False" DataKeyNames="id_COMPR" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_COMPR" HeaderText="id_COMPR" InsertVisible="False" ReadOnly="True" SortExpression="id_COMPR" Visible="False" />
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
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Liste_Semaine" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_user" SessionField="idUtilisateur" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Cahier" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_PR" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Commentaire_Superviseur" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_Select_CahierSoumis" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_Semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Tache_Apprentissage_Difficultes_BY_Semaine" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_semaine" SessionField="id_semaine" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
        </div>
</asp:Content>
