<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="formy_platnosci.aspx.cs" Inherits="WebApplication1.formy_platnosci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
    <asp:GridView ID="gv_f_p" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_forma_platn" DataSourceID="dane_f_p_gv">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id_forma_platn" HeaderText="Id_forma_platn" InsertVisible="False" ReadOnly="True" SortExpression="Id_forma_platn" />
            <asp:BoundField DataField="forma_platn" HeaderText="forma_platn" SortExpression="forma_platn" />
        </Columns>
    </asp:GridView>
</p>
<p>
    <asp:SqlDataSource ID="dane_f_p_gv" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [FORMA_PLATNOSCI] WHERE [Id_forma_platn] = @Id_forma_platn" InsertCommand="INSERT INTO [FORMA_PLATNOSCI] ([forma_platn]) VALUES (@forma_platn)" SelectCommand="SELECT * FROM [FORMA_PLATNOSCI]" UpdateCommand="UPDATE [FORMA_PLATNOSCI] SET [forma_platn] = @forma_platn WHERE [Id_forma_platn] = @Id_forma_platn">
        <DeleteParameters>
            <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="forma_platn" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="forma_platn" Type="String" />
            <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
    <asp:DetailsView ID="dv_f_p" runat="server" AutoGenerateRows="False" DataKeyNames="Id_forma_platn" DataSourceID="dane_f_p_dv" Height="50px" Width="125px" OnItemDeleted="dv_f_p_ItemDeleted" OnItemInserted="dv_f_p_ItemInserted" OnItemUpdated="dv_f_p_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id_forma_platn" HeaderText="Id_forma_platn" InsertVisible="False" ReadOnly="True" SortExpression="Id_forma_platn" />
            <asp:BoundField DataField="forma_platn" HeaderText="forma_platn" SortExpression="forma_platn" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dane_f_p_dv" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [FORMA_PLATNOSCI] WHERE [Id_forma_platn] = @Id_forma_platn" InsertCommand="INSERT INTO [FORMA_PLATNOSCI] ([forma_platn]) VALUES (@forma_platn)" SelectCommand="SELECT * FROM [FORMA_PLATNOSCI] WHERE ([Id_forma_platn] = @Id_forma_platn)" UpdateCommand="UPDATE [FORMA_PLATNOSCI] SET [forma_platn] = @forma_platn WHERE [Id_forma_platn] = @Id_forma_platn">
        <DeleteParameters>
            <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="forma_platn" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gv_f_p" Name="Id_forma_platn" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="forma_platn" Type="String" />
            <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
