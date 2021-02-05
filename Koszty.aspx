<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Koszty.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div style="width: 137px; height: 42px">
            <asp:Label ID="mies_pocz_lbl" runat="server" Text="miesiąc początkowy"></asp:Label>
            <br />
            <asp:DropDownList ID="drop_m_p" runat="server" style="margin-bottom: 0">
                <asp:ListItem Value="1">styczeń</asp:ListItem>
                <asp:ListItem Value="2">luty</asp:ListItem>
                <asp:ListItem Value="3">marzec</asp:ListItem>
                <asp:ListItem Value="4">kwiecień</asp:ListItem>
                <asp:ListItem Value="5">maj</asp:ListItem>
                <asp:ListItem Value="6">czerwiec</asp:ListItem>
                <asp:ListItem Value="7">lipiec</asp:ListItem>
                <asp:ListItem Value="8">sierpień</asp:ListItem>
                <asp:ListItem Value="9">wrzesień</asp:ListItem>
                <asp:ListItem Value="10">październik</asp:ListItem>
                <asp:ListItem Value="11">listopad</asp:ListItem>
                <asp:ListItem Value="12">grudzień</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div style="width: 137px; height: 42px">
        <asp:Label ID="mies_kon_lbl" runat="server" Text="miesiąc końcowy"></asp:Label>
        <br />
        <asp:DropDownList ID="drop_m_k" runat="server" style="margin-bottom: 0">
             <asp:ListItem Value="1">styczeń</asp:ListItem>
                <asp:ListItem Value="2">luty</asp:ListItem>
                <asp:ListItem Value="3">marzec</asp:ListItem>
                <asp:ListItem Value="4">kwiecień</asp:ListItem>
                <asp:ListItem Value="5">maj</asp:ListItem>
                <asp:ListItem Value="6">czerwiec</asp:ListItem>
                <asp:ListItem Value="7">lipiec</asp:ListItem>
                <asp:ListItem Value="8">sierpień</asp:ListItem>
                <asp:ListItem Value="9">wrzesień</asp:ListItem>
                <asp:ListItem Value="10">październik</asp:ListItem>
                <asp:ListItem Value="11">listopad</asp:ListItem>
                <asp:ListItem Value="12">grudzień</asp:ListItem>
        </asp:DropDownList>
        <div style="width: 137px; height: 42px">
            <asp:Label ID="rok_lbl" runat="server" Text="Rok"></asp:Label>
            <asp:TextBox ID="rok_input" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Wyszukaj" Width="138px" />
        </div>
        <br />
        <br />
        <br />
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="gv_koszty" runat="server" AutoGenerateColumns="False" DataSourceID="data_koszty" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Rodzaj_wyd" HeaderText="Rodzaj_wyd" SortExpression="Rodzaj_wyd" />
                <asp:BoundField DataField="Rok" HeaderText="Rok" SortExpression="Rok" />
                <asp:BoundField DataField="Miesiąc" HeaderText="Miesiąc" SortExpression="Miesiąc" />
                <asp:BoundField DataField="Suma_netto" HeaderText="Suma_netto" SortExpression="Suma_netto" />
                <asp:BoundField DataField="Waluta_faktura" HeaderText="Waluta_faktura" SortExpression="Waluta_faktura" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="data_koszty" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT Rodzaj_wyd, Rok, Miesiąc, Suma_netto, Waluta_faktura FROM dbo.koszty_rodz(@rok, @mies_pocz, @mies_koniec) AS koszty_rodz_1">
            <SelectParameters>
                <asp:ControlParameter ControlID="rok_input" DefaultValue="2021" Name="rok" PropertyName="Text" />
                <asp:ControlParameter ControlID="drop_m_p" DefaultValue="1" Name="mies_pocz" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="drop_m_k" DefaultValue="12" Name="mies_koniec" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
