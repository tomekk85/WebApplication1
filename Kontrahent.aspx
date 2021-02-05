<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kontrahent.aspx.cs" Inherits="WebApplication1.Kontrahent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="data_fry_kontr">
            <Columns>
                <asp:BoundField DataField="Id_firma" HeaderText="Id_firma" SortExpression="Id_firma" />
                <asp:BoundField DataField="Id_faktura" HeaderText="Id_faktura" SortExpression="Id_faktura" />
                <asp:BoundField DataField="Nazwa_firma_skrot" HeaderText="Nazwa_firma_skrot" SortExpression="Nazwa_firma_skrot" />
                <asp:BoundField DataField="Data_wplaty" HeaderText="Data_wplaty" ReadOnly="True" SortExpression="Data_wplaty" />
                <asp:BoundField DataField="Nr konta" HeaderText="Nr konta" ReadOnly="True" SortExpression="Nr konta" />
                <asp:BoundField DataField="Nr_faktury" HeaderText="Nr_faktury" SortExpression="Nr_faktury" />
                <asp:BoundField DataField="Data_wyst" HeaderText="Data_wyst" ReadOnly="True" SortExpression="Data_wyst" />
                <asp:BoundField DataField="Termin_platn" HeaderText="Termin_platn" ReadOnly="True" SortExpression="Termin_platn" />
                <asp:BoundField DataField="Kwota_brutto" HeaderText="Kwota_brutto" ReadOnly="True" SortExpression="Kwota_brutto" />
                <asp:BoundField DataField="Waluta_faktura" HeaderText="Waluta_faktura" SortExpression="Waluta_faktura" />
                <asp:BoundField DataField="Wplata" HeaderText="Wplata" ReadOnly="True" SortExpression="Wplata" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Wybierz kontrahenta"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="data_kontrahent" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma">
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Wyszukaj" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="data_fry_kontr" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT fp.Id_firma, fp.Id_faktura, fp.Nazwa_firma_skrot, ISNULL(dbo.data_formatuj(bp.Data_platn), '-') AS Data_wplaty, ISNULL(dbo.Nr_konta_format(bp.Nr_konta_odb), '-') AS [Nr konta], fp.Nr_faktury, dbo.data_formatuj(fp.Data_wyst) AS Data_wyst, dbo.data_formatuj(fp.Termin_platn) AS Termin_platn, dbo.kwota_formatuj(fp.Kwota_brutto) AS Kwota_brutto, fp.Waluta_faktura, ISNULL(dbo.kwota_formatuj(bp.Kwota_platn), '-') AS Wplata FROM dbo.fakturaPolaczone() AS fp FULL OUTER JOIN dbo.bankPlatnosci() AS bp ON bp.Id_faktura = fp.Id_faktura WHERE (fp.Id_firma = @Id_firma) ORDER BY bp.Data_platn DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Id_firma" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="data_kontrahent" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
