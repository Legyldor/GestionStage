<%@ Page Title="Connexion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="SGSv2.Connexion.Connexion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="grid" id="connexion" runat="server">
        <div class="row">
            <asp:Label ID="labelConnexion" runat="server" Text="Adresse mail :" CssClass="span4"></asp:Label>
            <asp:TextBox ID="TxtConnexion" runat="server" CssClass="span4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="span4" runat="server" ErrorMessage="veuillez entrer votre adresse courriel" ControlToValidate="TxtConnexion"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <asp:Label ID="labelMotDePasse" runat="server" Text="Mot de passe:" CssClass="span4"></asp:Label>
            <asp:TextBox ID="txtMotDePasse" runat="server" TextMode="Password" CssClass="span4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="span4" ErrorMessage="veuillez entrer votre mot de passe" ControlToValidate="txtMotDePasse"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <asp:LinkButton ID="lnkResetPassword" runat="server" OnClick="lnkResetPassword_Click" CausesValidation="false">J'ai oublié mon mot de passe</asp:LinkButton>
            <div class="grid" id="confirmReset" runat="server">
                <div class="row">
                    Sûr ?
                </div>
                <div class="row">
                    <asp:LinkButton CssClass="span6 text-alert bg-dark text-center" ID="lkOui" runat="server" OnClick="lkOui_OnClick" CausesValidation="false">Oui </asp:LinkButton>
                    
                    <asp:LinkButton CssClass="span6 bg-dark text-center" ID="lkNon" runat="server" OnClick="lkNon_OnClick" CausesValidation="false">Non </asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="row">

            <asp:Button ID="BtnConnexion" runat="server" Text="Se connecter" OnClick="BtnConnexion_Click" CssClass="default span2 offset5" />
        </div>
    </div>
    <div class="grid" id="connecté" runat="server">
        <div class="row">
            <asp:LinkButton CssClass="attention" ID="resetPasword" runat="server" OnClick="resetPasword_Click">Modifier mon mot de passe</asp:LinkButton>
        </div>
        <div class="row">
            <asp:Button ID="btnDeconnexion" runat="server" Text="Se Déconnecter" OnClick="btnDeconnexion_Click" CssClass="default span12 large-size alert" />
        </div>
    </div>
    <div id="MotDePasseOublier" class="grid" visible="false" runat="server">
        <div class="row">
            <asp:Label ID="labelMdpOublier" runat="server" CssClass="span6" Text="Nouveau mot de passe : "></asp:Label>
            <asp:TextBox ID="MdpOublier1" runat="server" CssClass="span6" TextMode="Password"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Label ID="ConfirmeMdpOublier" runat="server" CssClass="span6" Text="Confirmer votre nouveau mot de passe : "></asp:Label>
            <asp:TextBox ID="MdpOublier2" runat="server" CssClass="span6" TextMode="Password"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Button ID="BtnValiderNouveauMdp" CssClass="span6" runat="server" Text="Enregistrer" OnClick="BtnValiderNouveauMdp_Click" />
            <asp:Button ID="BtnAnnulerNouveauMdp" CssClass="span6" runat="server" Text="Annuler" OnClick="BtnAnnulerNouveauMdp_Click" />
        </div>
    </div>

</asp:Content>
