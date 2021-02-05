<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rodzaj_wydatku.aspx.cs" Inherits="WebApplication1.rodzaj_wydatku" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
    <asp:GridView ID="gv_r_w" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_rodzaj_wyd" DataSourceID="data_gv_r_w" OnPageIndexChanged="Page_Load" OnSelectedIndexChanged="gv_r_w_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id_rodzaj_wyd" HeaderText="Id_rodzaj_wyd" InsertVisible="False" ReadOnly="True" SortExpression="Id_rodzaj_wyd" />
            <asp:BoundField DataField="Rodzaj_wyd" HeaderText="Rodzaj_wyd" SortExpression="Rodzaj_wyd" />
        </Columns>
    </asp:GridView>
</p>
<p>
    <asp:SqlDataSource ID="data_gv_r_w" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [RODZAJ_WYDATKU] WHERE [Id_rodzaj_wyd] = @Id_rodzaj_wyd" InsertCommand="INSERT INTO [RODZAJ_WYDATKU] ([Rodzaj_wyd]) VALUES (@Rodzaj_wyd)" SelectCommand="SELECT * FROM [RODZAJ_WYDATKU]" UpdateCommand="UPDATE [RODZAJ_WYDATKU] SET [Rodzaj_wyd] = @Rodzaj_wyd WHERE [Id_rodzaj_wyd] = @Id_rodzaj_wyd">
        <DeleteParameters>
            <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Rodzaj_wyd" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Rodzaj_wyd" Type="String" />
            <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
<p>
    <asp:DetailsView ID="dv_r_w" runat="server" AutoGenerateRows="False" DataKeyNames="Id_rodzaj_wyd" DataSourceID="data_dv_r_w" Height="50px" OnDataBound="gv_r_w_SelectedIndexChanged" Width="125px" OnItemDeleted="dv_r_w_ItemDeleted" OnItemInserted="dv_r_w_ItemInserted" OnItemUpdated="dv_r_w_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id_rodzaj_wyd" HeaderText="Id_rodzaj_wyd" InsertVisible="False" ReadOnly="True" SortExpression="Id_rodzaj_wyd" />
            <asp:BoundField DataField="Rodzaj_wyd" HeaderText="Rodzaj_wyd" SortExpression="Rodzaj_wyd" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</p>
<p>
    <asp:SqlDataSource ID="data_dv_r_w" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [RODZAJ_WYDATKU] WHERE [Id_rodzaj_wyd] = @Id_rodzaj_wyd" InsertCommand="INSERT INTO [RODZAJ_WYDATKU] ([Rodzaj_wyd]) VALUES (@Rodzaj_wyd)" SelectCommand="SELECT * FROM [RODZAJ_WYDATKU] WHERE ([Id_rodzaj_wyd] = @Id_rodzaj_wyd)" UpdateCommand="UPDATE [RODZAJ_WYDATKU] SET [Rodzaj_wyd] = @Rodzaj_wyd WHERE [Id_rodzaj_wyd] = @Id_rodzaj_wyd">
        <DeleteParameters>
            <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Rodzaj_wyd" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gv_r_w" Name="Id_rodzaj_wyd" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Rodzaj_wyd" Type="String" />
            <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
<p>

</asp:Content>
