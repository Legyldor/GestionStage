<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluationStagiaireSuperviseur.aspx.cs" Inherits="SGSv2.Privée.Entreprise.EvaluationStagiaireEnseignant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    
        <div class="panel">
            <div class="panel-header">
                Evaluation du stagiaire par l'entreprise
            </div>
            <div class="panel-content" style="color: white;">

                <asp:CheckBox ID="cbPrevYears" runat="server" TextAlign="Right" Text="Afficher les stages des années précédentes" AutoPostBack="True" />


                <asp:GridView HeaderStyle-CssClass="gridview-header" CssClass="gridview" ID="gvEtudiant" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_PERSRES" DataMember="DefaultView" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="970px" OnSelectedIndexChanged="gvEtudiant_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_PERSRES" HeaderText="id_PERSRES" InsertVisible="False" ReadOnly="True" SortExpression="id_PERSRES" Visible="False" />
                        <asp:BoundField DataField="NomPrenom" HeaderText="Nom, Prénom" ReadOnly="True" SortExpression="NomPrenom" />
                        <asp:BoundField DataField="dateDebut_STAGE" HeaderText="Date de début de stage" SortExpression="dateDebut_STAGE" />
                        <asp:BoundField DataField="nb_semaine_STAGE" HeaderText="Nombre de semaines" SortExpression="nb_semaine_STAGE" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Stagiaires_Ens" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbPrevYears" DefaultValue="False" Name="anneePrec" PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>




                <br />
                <br />
               

                <asp:Panel ID="pnlTab" runat="server">
                        <asp:Table ID="tableEval" runat="server" CssClass="bg-gray" CellPadding="5">
                            <asp:TableHeaderRow runat="server">
                                <asp:TableHeaderCell><u>Critère</u></asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="5"><u>Evaluation</u></asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>Excellent
                                </asp:TableCell>
                                <asp:TableCell>Très Bien
                                </asp:TableCell>
                                <asp:TableCell>Bien
                                </asp:TableCell>
                                <asp:TableCell>Minimal
                                </asp:TableCell>
                                <asp:TableCell>Insuffisant
                                </asp:TableCell>
                            </asp:TableRow>


                        </asp:Table>
                <br />
                Commentaires :<br />
                <asp:TextBox ID="tbCommentaire" runat="server" TextMode="MultiLine" Width="100%" Height="100"></asp:TextBox>
                <br />
                <br />
                </asp:Panel>
            </div>
        </div>
</asp:Content>

