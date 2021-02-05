<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="firma.aspx.cs" Inherits="WebApplication1.firma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:GridView ID="gv_firma" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id_firma" DataSourceID="data_gv_firma">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id_firma" HeaderText="Id_firma" InsertVisible="False" ReadOnly="True" SortExpression="Id_firma" />
                <asp:BoundField DataField="Nazwa_firma_skrot" HeaderText="Nazwa_firma_skrot" SortExpression="Nazwa_firma_skrot" />
                <asp:BoundField DataField="Nip" HeaderText="Nip" SortExpression="Nip" />
                <asp:BoundField DataField="Kraj_firma" HeaderText="Kraj_firma" SortExpression="Kraj_firma" />
            </Columns>
        </asp:GridView>
    </p>
    <asp:SqlDataSource ID="data_gv_firma" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot], [Nip], [Kraj_firma] FROM [FIRMA]"></asp:SqlDataSource>
    <p>
        <asp:DetailsView ID="dv_firma" runat="server" AutoGenerateRows="False" DataKeyNames="Id_firma" DataSourceID="data_dv_firma" Height="50px" OnItemDeleted="dv_firma_ItemDeleted" OnItemInserted="dv_firma_ItemInserted" OnItemUpdated="dv_firma_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Id_firma" HeaderText="Id_firma" InsertVisible="False" ReadOnly="True" SortExpression="Id_firma" />
                <asp:BoundField DataField="Nazwa_firma" HeaderText="Nazwa_firma" SortExpression="Nazwa_firma" />
                <asp:BoundField DataField="Nazwa_firma_skrot" HeaderText="Nazwa_firma_skrot" SortExpression="Nazwa_firma_skrot" />
                <asp:BoundField DataField="Nip" HeaderText="Nip" SortExpression="Nip" />
                <asp:BoundField DataField="Adres_firma" HeaderText="Adres_firma" SortExpression="Adres_firma" />
                <asp:BoundField DataField="Kraj_firma" HeaderText="Kraj_firma" SortExpression="Kraj_firma" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="data_dv_firma" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [FIRMA] WHERE [Id_firma] = @Id_firma" InsertCommand="INSERT INTO [FIRMA] ([Nazwa_firma], [Nazwa_firma_skrot], [Nip], [Adres_firma], [Kraj_firma]) VALUES (@Nazwa_firma, @Nazwa_firma_skrot, @Nip, @Adres_firma, @Kraj_firma)" SelectCommand="SELECT * FROM [FIRMA] WHERE ([Id_firma] = @Id_firma)" UpdateCommand="UPDATE [FIRMA] SET [Nazwa_firma] = @Nazwa_firma, [Nazwa_firma_skrot] = @Nazwa_firma_skrot, [Nip] = @Nip, [Adres_firma] = @Adres_firma, [Kraj_firma] = @Kraj_firma WHERE [Id_firma] = @Id_firma">
        <DeleteParameters>
            <asp:Parameter Name="Id_firma" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nazwa_firma" Type="String" />
            <asp:Parameter Name="Nazwa_firma_skrot" Type="String" />
            <asp:Parameter Name="Nip" Type="String" />
            <asp:Parameter Name="Adres_firma" Type="String" />
            <asp:Parameter Name="Kraj_firma" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gv_firma" Name="Id_firma" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa_firma" Type="String" />
            <asp:Parameter Name="Nazwa_firma_skrot" Type="String" />
            <asp:Parameter Name="Nip" Type="String" />
            <asp:Parameter Name="Adres_firma" Type="String" />
            <asp:Parameter Name="Kraj_firma" Type="String" />
            <asp:Parameter Name="Id_firma" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
