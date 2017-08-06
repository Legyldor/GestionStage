<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionCriteres.aspx.cs" Inherits="SGSv2.Privée.Entreprise.GestionCriteres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="panel">
            <div class="panel-header">
                Gestion des critères de notation du stagiaire
            </div>
            <div class="panel-content" style="color: white;">



                <asp:GridView ID="gdvCritere" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_CRIT" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="974px" RowHeaderColumn="id_CRIT">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_CRIT" HeaderText="id_CRIT" ReadOnly="True" SortExpression="id_CRIT" Visible="False" />
                        <asp:TemplateField HeaderText="N°" SortExpression="numCRIT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("numCRIT") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vous devez remplir tous les champs !">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("numCRIT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Critère d'évaluation" SortExpression="descriptionCRIT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descriptionCRIT") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Veuillez remplir tous les champs !">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("descriptionCRIT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:H2015_ProjetWeb_Groupe101_Equipe4ConnectionString %>" SelectCommand="P_SELECT_Critere" SelectCommandType="StoredProcedure" DeleteCommand="P_DELETE_CRITERE" DeleteCommandType="StoredProcedure" UpdateCommand="P_UPDATE_CRITERE" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_CRIT" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_CRIT" Type="Int32" />
                        <asp:Parameter Name="descriptionCRIT" Type="String" />
                        <asp:Parameter Name="numCRIT" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>



            </div>
    </div>
     <div class="panel">
            <div class="panel-header">
                Ajout de critère de notation du stagiaire
            </div>
            <div class="panel-content" style="color: white;">

                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="N° : "></asp:Label>
                <asp:TextBox ID="tbNum" runat="server" TextMode="Phone" Width="43px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="Label1" runat="server" Text="Nom du critère"></asp:Label>
&nbsp;:&nbsp;
                <asp:TextBox ID="tbNewCritere" runat="server" AutoPostBack="False" OnTextChanged="tbNewCritere_TextChanged" Width="176px" ></asp:TextBox>
                <br />
                &nbsp;
                <br />
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Ajouter" />
                <br />

            </div>
         </div>
</asp:Content>
