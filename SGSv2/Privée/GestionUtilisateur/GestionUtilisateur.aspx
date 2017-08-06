<%@ Page Title="Gestion Utilisateur" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionUtilisateur.aspx.cs" Inherits="SGSv2.utilisateur.GestionUtilisateur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <h1 class="fg-white">Gestion des Utilisateurs</h1>
    <div>

        <!-- Menu accordéon pour la recherche --->
        <div class="accordion" data-role="accordion">
            <div class="accordion-frame">
                <a href="#" class="heading icon-search fg-blue"> Recherche</a>
                <div class="content">
                    <div style="display: inline-block">
                        Nom : 
                        <br />
                        Email : 
                    </div>
                    &nbsp;
                        <div style="display: inline-block">
                            <asp:TextBox ID="TextBoxNomRecherche" runat="server"></asp:TextBox>
                            <br />

                            <asp:TextBox ID="TextBoxEmailRecherche" runat="server"></asp:TextBox>
                        </div>
                    &nbsp;
                    <div style="display: inline-block">
                        Prenom : 
                        <br />
                        Telephone :
                    </div>
                    &nbsp;
                        <div style="display: inline-block">
                            <asp:TextBox ID="TextBoxPrenomRecherche" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBoxTelephoneRecherche" runat="server"></asp:TextBox>
                        </div>
                    &nbsp;
                    <div style="display: inline-block">
                        Groupe :
                        <br />
                        Actif :
                    </div>
                    &nbsp;
                       <div style="display: inline-block">
                           <asp:DropDownList ID="DropDownListGroupeRecherche" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_TYPUTIL" DataValueField="id_TYPUTIL"></asp:DropDownList>
                           <br />
                           <div class="input-control switch" accesskey="slide1">
                               <label>
                                   <asp:CheckBox ID="CheckBoxActifRecherche" Checked="true" runat="server" />
                                   <span class="check" accesskey="slide"></span>
                               </label>
                           </div>
                       </div>
                    <br />

                    <asp:Button ID="bRecherche" runat="server" Text="Rechercher" OnClick="bRecherche_OnClick" />
                </div>
            </div>
        </div>
    </div>



    <asp:GridView ID="gvRecherche" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_UTIL"
        DataSourceID="P_SELECT_LISTE_UtilisateurRechercheTab" ForeColor="#333333"
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_UTIL" HeaderText="id_UTIL" InsertVisible="False" ReadOnly="True" SortExpression="id_UTIL" Visible="False" />
            <asp:TemplateField HeaderText="Nom &amp; Prenom" SortExpression="NomPrenom">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nom_UTIL") %>'></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("prenom_UTIL") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NomPrenom") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nom_UTIL" HeaderText="nom_UTIL" SortExpression="nom_UTIL" Visible="False" />
            <asp:BoundField DataField="prenom_UTIL" HeaderText="prenom_UTIL" SortExpression="prenom_UTIL" Visible="False" />
            <asp:BoundField DataField="mail_UTIL" HeaderText="E-mail" SortExpression="mail_UTIL" />
            <asp:BoundField DataField="telephone_UTIL" HeaderText="Telephone" SortExpression="telephone_UTIL" />
            <asp:BoundField DataField="id_TYPUTIL" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:TemplateField HeaderText="Groupe" SortExpression="nom_TYPUTIL">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_TYPUTIL" DataValueField="id_TYPUTIL" selectedValue='<%# Bind("id_TYPUTIL") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nom_TYPUTIL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="actif_UTIL" HeaderText="Actif" SortExpression="actif_UTIL" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="P_SELECT_LISTE_UtilisateurRechercheTab" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Utilisateur" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Utilisateur" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Utilisateur" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Utilisateur" UpdateCommandType="StoredProcedure">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxNomRecherche" DefaultValue="  " Name="nom" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownListGroupeRecherche" DefaultValue="0" Name="idTYPE" PropertyName="SelectedValue" Type="Int16" />
            <asp:ControlParameter ControlID="TextBoxPrenomRecherche" DefaultValue=" " Name="prenom" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxEmailRecherche" DefaultValue=" " Name="mail" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxTelephoneRecherche" DefaultValue=" " Name="telephone" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CheckBoxActifRecherche" DefaultValue="true" Name="actif" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_LISTE_TYPUTIL" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue=" false" Name="afficherTous" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_LISTE_TYPUTIL" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="afficherTous" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="labelErreur" runat="server" Text="Les données fournies sont incorectes ou incomplètes" CssClass="fg-red" Visible="False"></asp:Label>
    <div id="btVisible" runat="server">
        <asp:Button class="default bg-green fg-white" ID="btAJVisible" runat="server" Text="Ajouter un utilisateur" OnClick="btAJVisible_OnClick" />
    </div>
    <div id="btInVisible">
        <asp:Button class="default bg-green fg-white" ID="btAJInVisible" Visible="false" runat="server" Text="Up" OnClick="btAJInVisible_OnClick" />
    </div>
   <div class="content" id="AjUtil" runat="server" >
        <h2 class="fg-white">Ajouter un utilisateur :</h2>
             Nom : <asp:TextBox ID="tbAjNom" runat="server"></asp:TextBox>
             Prenom : <asp:TextBox ID="tbAjPrenom" runat="server"></asp:TextBox>
             Groupe : <asp:DropDownList ID="ddlAjGroupe" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_TYPUTIL" DataValueField="id_TYPUTIL"></asp:DropDownList>
                           
                        <br />
             Email : <asp:TextBox ID="tbAjMail" runat="server"></asp:TextBox>
             Telephone : <asp:TextBox ID="tbAjTel" runat="server"></asp:TextBox>
             Actif :    <div class="input-control switch" accesskey="slide1">
                               <label>
                                   <asp:CheckBox ID="cbAjActif" Checked="true" runat="server" />
                                   <span class="check" accesskey="slide"></span>
                               </label>
                           </div>
                            
                            <br />
                           
        <asp:Button ID="btAjUtil" runat="server" Text="Ajouter l'utilisateur" OnClick="btAjUtil_OnClick" />
    </div>
    
</asp:Content>
