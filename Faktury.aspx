<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Faktury.aspx.cs" Inherits="WebApplication1.Platnosci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id_faktura" 
            DataSourceID="faktury_widok_1" >
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id_faktura" HeaderText="Id_faktura" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Id_faktura" />
                <asp:BoundField DataField="Nazwa_firma_skrot" HeaderText="Nazwa_firma_skrot" 
                    SortExpression="Nazwa_firma_skrot" />
                <asp:BoundField DataField="Rodzaj_wyd" HeaderText="Rodzaj_wyd" 
                    SortExpression="Rodzaj_wyd" />
                <asp:BoundField DataField="forma_platn" HeaderText="forma_platn" 
                    SortExpression="forma_platn" />
                <asp:BoundField DataField="Nr_faktury" HeaderText="Nr_faktury" 
                    SortExpression="Nr_faktury" />
                <asp:BoundField DataField="Data_wyst" HeaderText="Data_wyst" ReadOnly="True" 
                    SortExpression="Data_wyst" />
                <asp:BoundField DataField="Termin_platn" HeaderText="Termin_platn" 
                    ReadOnly="True" SortExpression="Termin_platn" />
                <asp:BoundField DataField="Kwota_brutto" HeaderText="Kwota_brutto" 
                    SortExpression="Kwota_brutto" />
                <asp:BoundField DataField="Waluta_faktura" HeaderText="Waluta_faktura" 
                    SortExpression="Waluta_faktura" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="Id_faktura" DataSourceID="fakutry_one_row" Height="50px" 
            Width="125px" OnItemUpdated="DetailsView1_ItemUpdated" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted">
            <Fields>
                <asp:BoundField DataField="Id_faktura" HeaderText="Id_faktura" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Id_faktura" />
                <asp:TemplateField HeaderText="Firma" SortExpression="Id_firma">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="firma_nazwa" 
                            DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" 
                            SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="firma_nazwa" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" 
                            SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="firma_nazwa" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="firma_nazwa" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="firma_nazwa" DataTextField="Nazwa_firma_skrot" DataValueField="Id_firma" Enabled="False" SelectedValue='<%# Bind("Id_firma") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="firma_nazwa" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT [Id_firma], [Nazwa_firma_skrot] FROM [FIRMA]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rodzaj_wyd" SortExpression="Id_rodzaj_wyd">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="rodzaj_wyd" DataTextField="Rodzaj_wyd" 
                            DataValueField="Id_rodzaj_wyd" SelectedValue='<%# Bind("Id_rodzaj_wyd") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="rodzaj_wyd" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" 
                            SelectCommand="SELECT * FROM [RODZAJ_WYDATKU]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="data_rw_ins_tpl" DataTextField="Rodzaj_wyd" DataValueField="Id_rodzaj_wyd" SelectedValue='<%# Bind("Id_rodzaj_wyd") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="data_rw_ins_tpl" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT * FROM [RODZAJ_WYDATKU]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="r_w_item_tpl" DataTextField="Rodzaj_wyd" DataValueField="Id_rodzaj_wyd" Enabled="False" SelectedValue='<%# Bind("Id_rodzaj_wyd") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="r_w_item_tpl" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT * FROM [RODZAJ_WYDATKU]"></asp:SqlDataSource>
                        <br />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Forma_platn" SortExpression="Id_forma_platn">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="forma_plat" 
                            DataTextField="forma_platn" DataValueField="Id_forma_platn" 
                            SelectedValue='<%# Bind("Id_forma_platn") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="forma_plat" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" 
                            SelectCommand="SELECT * FROM [FORMA_PLATNOSCI]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="forma_plat" DataTextField="forma_platn" DataValueField="Id_forma_platn" SelectedValue='<%# Bind("Id_forma_platn") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="forma_plat" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT * FROM [FORMA_PLATNOSCI]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="forma_plat" DataTextField="forma_platn" DataValueField="Id_forma_platn" Enabled="False" SelectedValue='<%# Bind("Id_forma_platn") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="forma_plat" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="SELECT * FROM [FORMA_PLATNOSCI]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Nr_faktury" HeaderText="Nr_faktury" 
                    SortExpression="Nr_faktury" />
                <asp:BoundField DataField="Data_wyst" HeaderText="Data_wyst" 
                    SortExpression="Data_wyst" />
                <asp:BoundField DataField="Termin_platn" HeaderText="Termin_platn" 
                    SortExpression="Termin_platn" />
                <asp:BoundField DataField="Kwota_netto" HeaderText="Kwota_netto" 
                    SortExpression="Kwota_netto" />
                <asp:BoundField DataField="Kwota_vat" HeaderText="Kwota_vat" 
                    SortExpression="Kwota_vat" />
                <asp:BoundField DataField="Kwota_brutto" HeaderText="Kwota_brutto" 
                    SortExpression="Kwota_brutto" />
                <asp:BoundField DataField="Data_wprowadzenia" HeaderText="Data_wprowadzenia" 
                    SortExpression="Data_wprowadzenia" />
                <asp:BoundField DataField="Informacje_dod" HeaderText="Informacje_dod" 
                    SortExpression="Informacje_dod" />
                <asp:BoundField DataField="Waluta_faktura" HeaderText="Waluta_faktura" 
                    SortExpression="Waluta_faktura" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="faktury_widok_1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" 
            DeleteCommand="DELETE FROM [FAKTURA] WHERE [Id_faktura] = @Id_faktura" 
            InsertCommand="INSERT INTO [FAKTURA] ([Id_rodzaj_wyd], [Id_forma_platn], [Id_firma], [Nr_faktury], [Data_wyst], [Termin_platn], [Kwota_netto], [Kwota_vat], [Kwota_brutto], [Data_wprowadzenia], [Informacje_dod], [Waluta_faktura]) VALUES (@Id_rodzaj_wyd, @Id_forma_platn, @Id_firma, @Nr_faktury, @Data_wyst, @Termin_platn, @Kwota_netto, @Kwota_vat, @Kwota_brutto, @Data_wprowadzenia, @Informacje_dod, @Waluta_faktura)" 
            SelectCommand="fakturaWidok1" SelectCommandType="StoredProcedure" 
            UpdateCommand="UPDATE [FAKTURA] SET [Id_rodzaj_wyd] = @Id_rodzaj_wyd, [Id_forma_platn] = @Id_forma_platn, [Id_firma] = @Id_firma, [Nr_faktury] = @Nr_faktury, [Data_wyst] = @Data_wyst, [Termin_platn] = @Termin_platn, [Kwota_netto] = @Kwota_netto, [Kwota_vat] = @Kwota_vat, [Kwota_brutto] = @Kwota_brutto, [Data_wprowadzenia] = @Data_wprowadzenia, [Informacje_dod] = @Informacje_dod, [Waluta_faktura] = @Waluta_faktura WHERE [Id_faktura] = @Id_faktura">
            <DeleteParameters>
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
                <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_faktury" Type="String" />
                <asp:Parameter Name="Data_wyst" Type="DateTime" />
                <asp:Parameter Name="Termin_platn" Type="DateTime" />
                <asp:Parameter Name="Kwota_netto" Type="Decimal" />
                <asp:Parameter Name="Kwota_vat" Type="Decimal" />
                <asp:Parameter Name="Kwota_brutto" Type="Decimal" />
                <asp:Parameter Name="Data_wprowadzenia" Type="DateTime" />
                <asp:Parameter Name="Informacje_dod" Type="String" />
                <asp:Parameter Name="Waluta_faktura" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
                <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_faktury" Type="String" />
                <asp:Parameter Name="Data_wyst" Type="DateTime" />
                <asp:Parameter Name="Termin_platn" Type="DateTime" />
                <asp:Parameter Name="Kwota_netto" Type="Decimal" />
                <asp:Parameter Name="Kwota_vat" Type="Decimal" />
                <asp:Parameter Name="Kwota_brutto" Type="Decimal" />
                <asp:Parameter Name="Data_wprowadzenia" Type="DateTime" />
                <asp:Parameter Name="Informacje_dod" Type="String" />
                <asp:Parameter Name="Waluta_faktura" Type="String" />
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
        <asp:SqlDataSource ID="fakutry_one_row" runat="server" 
        ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" 
        DeleteCommand="DELETE FROM [FAKTURA] WHERE [Id_faktura] = @Id_faktura" 
        InsertCommand="INSERT INTO [FAKTURA] ([Id_rodzaj_wyd], [Id_forma_platn], [Id_firma], [Nr_faktury], [Data_wyst], [Termin_platn], [Kwota_netto], [Kwota_vat], [Kwota_brutto], [Data_wprowadzenia], [Informacje_dod], [Waluta_faktura]) VALUES (@Id_rodzaj_wyd, @Id_forma_platn, @Id_firma, @Nr_faktury, @Data_wyst, @Termin_platn, @Kwota_netto, @Kwota_vat, @Kwota_brutto, @Data_wprowadzenia, @Informacje_dod, @Waluta_faktura)" 
        SelectCommand="SELECT * FROM [FAKTURA] WHERE ([Id_faktura] = @Id_faktura)" 
        UpdateCommand="UPDATE [FAKTURA] SET [Id_rodzaj_wyd] = @Id_rodzaj_wyd, [Id_forma_platn] = @Id_forma_platn, [Id_firma] = @Id_firma, [Nr_faktury] = @Nr_faktury, [Data_wyst] = @Data_wyst, [Termin_platn] = @Termin_platn, [Kwota_netto] = @Kwota_netto, [Kwota_vat] = @Kwota_vat, [Kwota_brutto] = @Kwota_brutto, [Data_wprowadzenia] = @Data_wprowadzenia, [Informacje_dod] = @Informacje_dod, [Waluta_faktura] = @Waluta_faktura WHERE [Id_faktura] = @Id_faktura">
            <DeleteParameters>
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
                <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_faktury" Type="String" />
                <asp:Parameter Name="Data_wyst" Type="DateTime" />
                <asp:Parameter Name="Termin_platn" Type="DateTime" />
                <asp:Parameter Name="Kwota_netto" Type="Decimal" />
                <asp:Parameter Name="Kwota_vat" Type="Decimal" />
                <asp:Parameter Name="Kwota_brutto" Type="Decimal" />
                <asp:Parameter Name="Data_wprowadzenia" Type="DateTime" />
                <asp:Parameter Name="Informacje_dod" Type="String" />
                <asp:Parameter Name="Waluta_faktura" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id_faktura" 
                    PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_rodzaj_wyd" Type="Decimal" />
                <asp:Parameter Name="Id_forma_platn" Type="Decimal" />
                <asp:Parameter Name="Id_firma" Type="Decimal" />
                <asp:Parameter Name="Nr_faktury" Type="String" />
                <asp:Parameter Name="Data_wyst" Type="DateTime" />
                <asp:Parameter Name="Termin_platn" Type="DateTime" />
                <asp:Parameter Name="Kwota_netto" Type="Decimal" />
                <asp:Parameter Name="Kwota_vat" Type="Decimal" />
                <asp:Parameter Name="Kwota_brutto" Type="Decimal" />
                <asp:Parameter Name="Data_wprowadzenia" Type="DateTime" />
                <asp:Parameter Name="Informacje_dod" Type="String" />
                <asp:Parameter Name="Waluta_faktura" Type="String" />
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
