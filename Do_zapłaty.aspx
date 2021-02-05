<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Do_zapłaty.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:GridView ID="gv_do_zap" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="Id_faktura" DataSourceID="data_do_zap">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="data_do_zap" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" SelectCommand="CREATE TABLE #bank_platnosci
	(
	ID_firma INT
	,Id_faktura INT
	,Kwota_platn INT
	,Nr_konta VARCHAR(MAX)
                 )

INSERT INTO #bank_platnosci

SELECT 
		kb.Id_firma
		,pl.Id_faktura
		,SUM(pl.Kwota_platn)
		,kb.Nr_konta_odb
FROM 
	PLATNOSC AS pl
	INNER JOIN KONTO_BANKOWE AS kb
	ON kb.Id_konto_odb = pl.Id_konto_odb
GROUP BY
	pl.Id_faktura, kb.Nr_konta_odb,kb.Id_firma
;

CREATE TABLE #faktura_polaczone
	(
		Id_firma INT
		,Id_faktura INT
		,Nazwa_firma_skrot VARCHAR(10)
		,forma_platn VARCHAR(10)
		,Nr_faktury VARCHAR(35)
		,Data_wyst DATETIME
		,Termin_platn DATETIME
		,Kwota_brutto DECIMAL(9,2)
		,Waluta_faktura VARCHAR(3)
	)

INSERT INTO #faktura_polaczone
SELECT  fa.Id_firma
		,fa.Id_faktura
		,fi.Nazwa_firma_skrot
		,fp.forma_platn
		,fa.Nr_faktury
		,fa.Data_wyst
		,fa.Termin_platn
		,fa.Kwota_brutto
		,fa.Waluta_faktura
FROM
	dbo.FAKTURA AS fa
	INNER JOIN dbo.RODZAJ_WYDATKU AS rw
	ON rw.Id_rodzaj_wyd = fa.Id_rodzaj_wyd
	INNER JOIN dbo.FORMA_PLATNOSCI AS fp
	ON fp.Id_forma_platn = fa.Id_forma_platn
	INNER JOIN dbo.FIRMA AS fi
	ON fi.Id_firma = fa.Id_firma

SELECT
		fp.Id_faktura
		,fp.Nazwa_firma_skrot
		,fp.forma_platn
		,fp.Nr_faktury
		,[dbo].[data_formatuj](fp.Data_wyst) AS [Data_wyst]
		,[dbo].[data_formatuj](fp.Termin_platn) AS [Termin_platn]
		,[dbo].[kwota_formatuj](fp.Kwota_brutto) AS [Kwota_brutto]
		,fp.Waluta_faktura
		,ISNULL([dbo].[kwota_formatuj](bp.Kwota_platn), 0.00) AS [Wplata_razem]
		,[dbo].[kwota_formatuj](fp.Kwota_brutto - ISNULL([dbo].[kwota_formatuj](bp.Kwota_platn), 0.00)) AS [Pozostaje_do_zapł]
		,ISNULL([dbo].[Nr_konta_format](bp.Nr_konta), '-') AS[Nr_konta]

FROM 
	#faktura_polaczone AS fp
FULL OUTER JOIN #bank_platnosci as bp
	ON bp.Id_faktura = fp.Id_faktura
WHERE fp.forma_platn = 'przelew'
AND (fp.Kwota_brutto &gt; bp.Kwota_platn OR bp.Kwota_platn IS NULL)
"></asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id_platnosc" DataSourceID="data_plat" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="Id_platnosc" HeaderText="Id_platnosc" InsertVisible="False" ReadOnly="True" SortExpression="Id_platnosc" />
                <asp:BoundField DataField="Id_faktura" HeaderText="Id_faktura" SortExpression="Id_faktura" />
                <asp:BoundField DataField="Id_konto_odb" HeaderText="Id_konto_odb" SortExpression="Id_konto_odb" />
                <asp:BoundField DataField="Kwota_platn" HeaderText="Kwota_platn" SortExpression="Kwota_platn" />
                <asp:BoundField DataField="Data_platn" HeaderText="Data_platn" SortExpression="Data_platn" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <asp:SqlDataSource ID="data_plat" runat="server" ConnectionString="<%$ ConnectionStrings:platnosciConnectionString2 %>" DeleteCommand="DELETE FROM [PLATNOSC] WHERE [Id_platnosc] = @Id_platnosc" InsertCommand="INSERT INTO [PLATNOSC] ([Id_faktura], [Id_konto_odb], [Kwota_platn], [Data_platn]) VALUES (@Id_faktura, @Id_konto_odb, @Kwota_platn, @Data_platn)" SelectCommand="SELECT * FROM [PLATNOSC] WHERE ([Id_faktura] = @Id_faktura)" UpdateCommand="UPDATE [PLATNOSC] SET [Id_faktura] = @Id_faktura, [Id_konto_odb] = @Id_konto_odb, [Kwota_platn] = @Kwota_platn, [Data_platn] = @Data_platn WHERE [Id_platnosc] = @Id_platnosc">
            <DeleteParameters>
                <asp:Parameter Name="Id_platnosc" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
                <asp:Parameter Name="Id_konto_odb" Type="Decimal" />
                <asp:Parameter Name="Kwota_platn" Type="Decimal" />
                <asp:Parameter Name="Data_platn" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_do_zap" Name="Id_faktura" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_faktura" Type="Decimal" />
                <asp:Parameter Name="Id_konto_odb" Type="Decimal" />
                <asp:Parameter Name="Kwota_platn" Type="Decimal" />
                <asp:Parameter Name="Data_platn" Type="DateTime" />
                <asp:Parameter Name="Id_platnosc" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
