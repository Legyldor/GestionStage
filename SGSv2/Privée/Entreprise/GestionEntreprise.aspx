<%@ Page Title="Gestion Entreprise" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Privée/Entreprise/GestionEntreprise.aspx.cs" Inherits="SGSv2.utilisateur.PageEntrepriseDefault" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">  
    <h1 class="fg-white">Gestion des Entreprises</h1>
   <div class="grid">
      <div class="row">
      <asp:GridView ID="GridViewEnt" runat="server" 
       AllowPaging="True" AllowSorting="True" 
       AutoGenerateColumns="False" CellPadding="4" 
       DataKeyNames="ID_ENT" DataSourceID="DB_Ent" 
       ForeColor="#333333" GridLines="None" Width="100%">

        <AlternatingRowStyle BackColor="White" />
        <Columns>

            <asp:BoundField DataField="id_ENT" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id_ENT" Visible="False" />
            <asp:BoundField DataField="nom_ENT" HeaderText="Nom" SortExpression="nom_ENT" />
            <asp:BoundField DataField="adresse_ENT" HeaderText="Adresse" SortExpression="adresse_ENT" />
            <asp:BoundField DataField="codepostal_ENT" HeaderText="Code Postal" SortExpression="codepostal_ENT" />
            <asp:BoundField DataField="ville_ENT" HeaderText="Ville" SortExpression="ville_ENT" />
            <asp:BoundField DataField="telephone_ENT" HeaderText="Télephone" SortExpression="telephone_ENT" />
            <asp:BoundField DataField="fax_ENT" HeaderText="Fax" SortExpression="fax_ENT" />
            <asp:BoundField DataField="mail_ENT" HeaderText="Mail" SortExpression="mail_ENT" />
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
          </div>
    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
   </div>
    <div id="btVisible">
        <asp:Button class="default bg-green fg-white" ID="btAJVisible" runat="server" Text="Ajouter une entreprise" OnClick="btAJVisible_OnClick"/>
    </div>
    <div id="btInVisible">
        <asp:Button class="default bg-green fg-white" ID="btAJInVisible" Visible="false" runat="server" Text="Up" OnClick="btAJInVisible_OnClick"/>
    </div>
    <div class="text size2" id="AjEnt">
        Nom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxNom" runat="server"></asp:TextBox>
        <br />
        Adresse&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxAdr" runat="server"></asp:TextBox>
        <br/>
        Code Postal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxCodePost" runat="server"></asp:TextBox>
        <br/>
        Ville&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxVille" runat="server"></asp:TextBox>
        <br/>
        Télephone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxTel" runat="server"></asp:TextBox>
        <br/>
        Fax&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxFax" runat="server"></asp:TextBox>
        <br/>
        Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxMail" runat="server"></asp:TextBox>
        <br/>
        <asp:button class="default bg-green fg-white" ID="btnInser" onclick="btnInser_Click" runat="server" text="Insérer"> </asp:button>
    </div>
    <script>
        invisible();
        function visible() {
            document.getElementById("AjEnt").style.display = "block";
            document.getElementById("btVisible").style.display = "none";
        }
        function invisible() {
            document.getElementById("AjEnt").style.display = "none";
            document.getElementById("btVisible").style.display = "block";
        }
    </script>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
      

    <asp:SqlDataSource ID="DB_Ent" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" DeleteCommand="P_DELETE_Entreprise" DeleteCommandType="StoredProcedure" InsertCommand="P_INSERT_Entreprise" InsertCommandType="StoredProcedure" SelectCommand="P_SELECT_LISTE_Entreprise_Details" SelectCommandType="StoredProcedure" UpdateCommand="P_UPDATE_Entreprise" UpdateCommandType="StoredProcedure">
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

