<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="konta_bankowe.aspx.cs" Inherits="WebApplication1.konta_bankowe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:GridView ID="gv_k_b" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id_konto_odb" DataSourceID="data_gv_k_b" OnPageIndexChanged="Page_Load" OnSelectedIndexChanged="Page_Load">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id_konto_odb" HeaderText="Id_konto_odb" InsertVisible="False" ReadOnly="True" SortExpression="Id_konto_odb" />
                <asp:BoundField DataField="Nazwa_firma" HeaderText="Nazwa_firma" SortExpression="Nazwa_firma" />
                <asp:BoundField DataField="Nip" HeaderText="Nip" SortExpression="Nip" />
                <asp:BoundField DataField="Waluta_konto" HeaderText="Waluta_konto" SortExpression="Waluta_konto" />
                <asp:BoundField DataField="Nr konta" HeaderText="Nr konta" ReadOnly="True" SortExpression="Nr konta" />
                <asp:BoundField DataField="Swift" HeaderText="Swift" SortExpression="Swift" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="data_gv_k_b" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT kb.Id_konto_odb, fi.Nazwa_firma, kb.Waluta_konto, dbo.Nr_konta_format(kb.Nr_konta_odb) AS [Nr konta], kb.Swift, fi.Nip FROM KONTO_BANKOWE AS kb INNER JOIN FIRMA AS fi ON fi.Id_firma = kb.Id_firma WHERE (kb.Typ = 1)"></asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="dv_k_b" runat="server" AutoGenerateRows="False" DataKeyNames="Id_konto_odb" DataSourceID="data_dv_k_b" Height="50px" Width="125px" OnItemDeleted="dv_k_b_ItemDeleted" OnItemInserted="dv_k_b_ItemInserted" OnItemUpdated="dv_k_b_ItemUpdated">
            <Fields>
                <asp:BoundField DataField="Id_konto_odb" HeaderText="Id_konto_odb" InsertVisible="False" ReadOnly="True" SortExpression="Id_konto_odb" />
                <asp:TemplateField HeaderText="Firma" SortExpression="Id_firma">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="data_firma_templ" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="data_firma_templ" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="data_firma_templ" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="data_firma_templ" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="data_firma_templ" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" Enabled="False" SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="data_firma_templ" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Nr_konta_odb" HeaderText="Nr_konta_odb" SortExpression="Nr_konta_odb" />
                <asp:BoundField DataField="Swift" HeaderText="Swift" SortExpression="Swift" />
                <asp:BoundField DataField="Waluta_konto" HeaderText="Waluta_konto" SortExpression="Waluta_konto" />
                <asp:CheckBoxField DataField="Typ" HeaderText="Typ" SortExpression="Typ" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <asp:SqlDataSource ID="data_dv_k_b" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [KONTO_BANKOWE] WHERE [Id_konto_odb] = @Id_konto_odb" InsertCommand="INSERT INTO [KONTO_BANKOWE] ([Id_firma], [Nr_konta_odb], [Swift], [Waluta_konto], [Typ]) VALUES (@Id_firma, @Nr_konta_odb, @Swift, @Waluta_konto, @Typ)" SelectCommand="SELECT * FROM [KONTO_BANKOWE] WHERE ([Id_konto_odb] = @Id_konto_odb)" UpdateCommand="UPDATE [KONTO_BANKOWE] SET [Id_firma] = @Id_firma, [Nr_konta_odb] = @Nr_konta_odb, [Swift] = @Swift, [Waluta_konto] = @Waluta_konto, [Typ] = @Typ WHERE [Id_konto_odb] = @Id_konto_odb" >
            <DeleteParameters>
                <asp:Parameter Name="Id_konto_odb" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_konta_odb" Type="String" />
                <asp:Parameter Name="Swift" Type="String" />
                <asp:Parameter Name="Waluta_konto" Type="String" />
                <asp:Parameter Name="Typ" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_k_b" Name="Id_konto_odb" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_konta_odb" Type="String" />
                <asp:Parameter Name="Swift" Type="String" />
                <asp:Parameter Name="Waluta_konto" Type="String" />
                <asp:Parameter Name="Typ" Type="Boolean" />
                <asp:Parameter Name="Id_konto_odb" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
