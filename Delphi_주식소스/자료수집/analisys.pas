unit analisys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, TeEngine, Series, Grids, DBGrids, ExtCtrls, TeeProcs,
  Chart, DbChart, StdCtrls, VclTee.TeeGDIPlus, Vcl.ComCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, OleCtrls, SHDocVw, mshtml,ActiveX,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DateUtils, IdHTTP;

type
  TForm1 = class(TForm)
    DBChart1: TDBChart;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Series3: TLineSeries;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ADOQuery1: TADOQuery;
    Series4: TLineSeries;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    RadioButton6: TRadioButton;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    DBChart5: TDBChart;
    LineSeries10: TLineSeries;
    ADOQuery2: TADOQuery;
    Series6: TLineSeries;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Memo1: TMemo;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button3: TButton;
    WebBrowser1: TWebBrowser;
    Button4: TButton;
    Edit3: TEdit;
    Button5: TButton;
    Edit4: TEdit;
    Label1: TLabel;
    ListBox3: TListBox;
    Edit5: TEdit;
    Edit6: TEdit;
    ListBox5: TListBox;
    ListBox6: TListBox;
    Button6: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    CheckBox2: TCheckBox;
    Memo2: TMemo;
    FDQuery2: TFDQuery;
    Memo3: TMemo;
    RadioButton8: TRadioButton;
    RadioButton7: TRadioButton;
    CheckBox3: TCheckBox;
    Button7: TButton;
    Button8: TButton;
    Edit9: TEdit;
    Button9: TButton;
    Edit10: TEdit;
    Label2: TLabel;
    IdHTTP1: TIdHTTP;
    Edit11: TEdit;
    Button10: TButton;
    CheckBox4: TCheckBox;
    Button11: TButton;
    RadioButton9: TRadioButton;
    CheckBox5: TCheckBox;
    ADOQuery3: TADOQuery;
    ListBox4: TListBox;
    DBChart2: TDBChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    RadioButton10: TRadioButton;
    DBChart3: TDBChart;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    LineSeries6: TLineSeries;
    Edit12: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function GetHTML(addr: string):string;
    function GetHTMLSource(Doc: IHtmlDocument2): string;
    function GetData(Fstr:string; Lstr:string; memoln :string):string;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure Memo3DblClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    function GetHTML2(addr2: string):TMemoryStream;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
    HtmlMemo: TMemo;
  end;

var
  Form1: TForm1;
  Urladd:string;
  cc:longint;
  timequit:boolean;
  comStockTotal : longint;

implementation

{$R *.dfm}


procedure TForm1.Button11Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,compTable1,compTable2 : string;
   CCODE, endDate : string;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   DAYGAPRATE,UPDOWN : double;
begin
   if MessageDlg('보물 종목  가져오기B?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';
  compTable2 := 'DAILY_KOSD';
  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  listbox4.Clear;
  fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  endDate := copy(edit9.text,1,4) + copy(edit9.text,5,2) + copy(edit9.text,7,2);

   if checkbox2.Checked  then  begin
     if RadioButton1.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql := sql + ' FROM ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT < 10 - ' + EDIT7.Text + ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end else if RadioButton2.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql := sql + ' FROM ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT < 20 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + '  ORDER BY UPDOWN';
     end else if RadioButton3.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql := sql + ' FROM ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT < 40 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end else if RadioButton4.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql := sql + ' FROM ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT < 60 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end;

      if RadioButton1.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT < 10 - ' + EDIT7.Text + ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end else if RadioButton2.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT < 20 - ' + EDIT7.Text+ ') X  WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end else if RadioButton3.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT < 40 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end else if RadioButton4.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT < 60 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY UPDOWN';
     end;
  end else begin
       if RadioButton1.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql := sql + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY10SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV ';
     end else if RadioButton2.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY20SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton3.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY40SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton4.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql := sql + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY60SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end;

     if RadioButton1.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY10SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV ';
     end else if RadioButton2.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY20SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton3.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY40SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton4.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY60SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end;



  end;



  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
      ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
      CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
      sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
      sql3 :=sql3 + 'LAST_VALUE(ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0)) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS DAYGAPRATE, ';
      sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
      sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
      FDQuery2.Close;
      FDQuery2.SQL.Clear;
      FDQuery2.SQL.Add(sql3);
      FDQuery2.Open;
      ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
      DAYGAPRATE :=FDQuery2.fieldvalues['DAYGAPRATE'];
      ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
      ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];
      UPDOWN :=FDQuery1.fieldvalues['UPDOWN'];
      if UPDOWN < -50 then
         DAYGAPRATE := DAYGAPRATE/2;


      if (DAYGAPRATE < 0 ) and (DAYGAPRATE > -1.5)  then  begin

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;

          LISTBOX1.Items.Add(CCODE);
        //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clBlack));
          LISTBOX3.Items.Add(floatTostr(UPDOWN));
      end;
      FDQuery1.Next;
  end;

  ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql2);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
      ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
      CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
      sql4 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
      sql4 :=sql4 + 'LAST_VALUE(ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0)) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS DAYGAPRATE, ';
      sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
      sql4 :=sql4 +  compTable2 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
      FDQuery2.Close;
      FDQuery2.SQL.Clear;
      FDQuery2.SQL.Add(sql4);
      FDQuery2.Open;
      ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
      DAYGAPRATE :=FDQuery2.fieldvalues['DAYGAPRATE'];
      ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
      ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];
      UPDOWN :=FDQuery1.fieldvalues['UPDOWN'];
      if UPDOWN < -50 then
         DAYGAPRATE := DAYGAPRATE/2;


      if (DAYGAPRATE < 0 ) and (DAYGAPRATE > -1.5)  then begin

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;

          LISTBOX1.Items.Add(CCODE);
       //   LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
          LISTBOX3.Items.Add(floatTostr(UPDOWN));
      end;



      FDQuery1.Next;
  end;



  label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');


end;

procedure TForm1.Button1Click(Sender: TObject);
var
   sql,sql2,DD,compTable,fDate,fToDay,DealRate : string;
   gubun : integer;
begin
   if RadioButton1.Checked then  DD:='10'
   else if RadioButton2.Checked then DD:='20'
   else if RadioButton3.Checked then DD:='40'
   else if RadioButton4.Checked then DD:='60'
   else if RadioButton5.Checked then DD:='120'
   else if RadioButton6.Checked then DD:='240'
   else if RadioButton9.Checked then DD:='620';

   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + trim(edit1.Text) +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin
      Listbox6.Clear;
      FORM1.Caption :=ADOQuery2.fieldvalues['COMPANY'];
      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];
     // memo2.Lines.Add(ADOQuery2.fieldvalues['COMPANY']);
      gubun  :=ADOQuery2.fieldvalues['sosok'];
      if gubun = 1 then compTable := 'DAILY_KOSD'
      else compTable := 'DAILY_KOSP';
      fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      fToDay:=  StringReplace(datetostr(now), '-', '',[rfReplaceAll, rfIgnoreCase]);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      sql :='SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql := sql + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, * FROM ' + compTable + ' WHERE CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND DDATE <=  ''' + fDate +''' ) A ';      // DDATE <= convert(varchar, getdate(), 112)
      sql := sql + ' WHERE A.ROW < ' + DD + ' and ddate <=''' +fDate + ''' order by ddate';
      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      sql2 :='Select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql2 := sql2 + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, * FROM ' + compTable + ' WHERE CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND ';      // DDATE <= convert(varchar, getdate(), 112)
      sql2 := sql2 + ' DDate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''' order by ddate';
      ADOQuery3.SQL.Add(sql2);
      ADOQuery3.Open;
      ADOQuery3.Last;

      EDIT5.Text :=FormatFloat('#,###',ADOQuery1.fieldvalues['ENDPRICE']);
      EDIT6.Text :=FormatFloat('0.##',ADOQuery1.fieldvalues['UPDOWN'])+ '%';
      EDIT10.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['HIGHPRICE']);
      EDIT11.Text := FormatFloat('0.##', ADOQuery1.fieldvalues['UPDOWN2']) + '%';

      listbox6.Items.Add(floatTostr(ADOQuery2.fieldvalues['UPDOWN']) + '%');
      listbox6.Items.Add(floatTostr(ADOQuery2.fieldvalues['ForeignRate']) + '%');
      listbox6.Items.Add(FormatFloat('#,',ADOQuery2.fieldvalues['SalesProfit']));
      listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['DebtTotal']));
      listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['StockProfit']));
      listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['SaleAmount']));
      comStockTotal := ADOQuery2.fieldvalues['TotalStock'];
      DealRate := floatTostr(ADOQuery2.fieldvalues['DealAmount']/comStockTotal*0.1);
      listbox6.Items.Add(FormatFloat('#,#0',comStockTotal));
      listbox6.Items.Add('(' + DealRate + '%)');
   end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   sql,SQL2, fDate,compTable : string;

begin
   if MessageDlg('추천종목  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;
  if RadioButton7.Checked then compTable := 'DAILY_KOSP'
  else compTable := 'DAILY_KOSD';
  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);

  if checkbox3.Checked  then begin
     sql := 'SELECT (SELECT COMPANY FROM MAIN_COMP WHERE CCODE =A.CCODE) AS COMPANY,A.ENDPRICE, A.CCODE AS CCODE, A.AVGDAY5, A.AVGDAY10, ';
     sql := sql + ' ISNULL(ROUND(((A.ENDPRICE - A.STARTPRICE)/nullif(A.STARTPRICE,0)) * 100,2),0) AS UPDOWN, (A.SMAX - A.SMIN)*8/10 + SMIN  AS AVALUE ';
     sql := sql + ' FROM ' + compTable + ' A WHERE A.DDATE=''' + fDate + ''' AND DAY10 <= DAY5 AND DAY5 <= ENDPRICE AND GURAESTDEV < 60';         //STOK3 >= STOD3
     sql := sql + ' AND A.AVGDAY5 <= A.AVGDAY10 AND GURAE > 50000 and A.STARTPRICE <> 0 ';   // and A.DAY20UP >= 0
  end  else begin
     sql := 'SELECT (SELECT COMPANY FROM MAIN_COMP WHERE CCODE =A.CCODE) AS COMPANY,A.ENDPRICE, A.CCODE AS CCODE, A.AVGDAY5, A.AVGDAY10, ';
     sql := sql + ' ISNULL(ROUND(((A.ENDPRICE - A.STARTPRICE)/nullif(A.STARTPRICE,0)) * 100,2),0) AS UPDOWN, (A.SMAX - A.SMIN)*8/10 + SMIN  AS AVALUE ';
     sql := sql + ' FROM ' + compTable + ' A WHERE A.DDATE=''' + fDate + ''' AND DAY10 <= DAY5 AND DAY5 <= ENDPRICE ';         //STOK3 >= STOD3
     sql := sql + ' AND A.AVGDAY5 <= A.AVGDAY10 and A.DAY5 >= A.DAY20  AND GURAE > 50000 and A.STARTPRICE <> 0 ';   // and A.DAY20UP >= 0
  end;



  if Checkbox1.checked then
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        sql2 := 'SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ';
        sql2 := sql2 + ' ISNULL(ROUND(((HIGHPRICE-LOWPRICE)/nullif(ENDPRICE,0)) * 100,2),0) AS RISKGAP,DDATE FROM ' + compTable;
        SQL2 := SQL2 + ' WHERE CCODE=''' + FDQuery1.fieldvalues['CCODE'] + '''  AND DDATE <=  ''' + fDate + ''' ) A WHERE A.ROW < 20 ';
        SQL2 := SQL2 + ' AND A.RISKGAP > 5 ';
        FDQuery2.SQL.Add(sql2);
        FDQuery2.Open;
    //    if FDQuery2.Eof then begin

           LISTBOX1.Items.Add(TRIM(FDQuery1.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
           LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));
    //    end;

        FDQuery1.Next;
  end;
  Screen.Cursor := crDefault;

  showmessage('완료');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql, dSql: string ;
  i,j,k,n,m,cc:integer;
  HtmlMemo : Tmemo;
  ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, DebtTotal,SalesProfit :string;
  SaleAmount, StockProfit, ForeignRate, sosok : string;
begin
   if MessageDlg('기업정보 가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;

    HtmlMemo := TMemo.Create(Self);
    HtmlMemo.Parent := Self;
    HtmlMemo.Width :=2000;
    HtmlMemo.Visible :=false;
    cc:=0;

    URL:='http://finance.naver.com/sise/field_submit.nhn?menu=market_sum&returnUrl=http%3A%2F%2Ffinance.naver.com%2Fsise%2Fsise_market_sum.nhn&fieldIds=listed_stock_cnt&fieldIds=quant';
    URL:=URL + '&fieldIds=operating_profit&fieldIds=frgn_rate&fieldIds=debt_total&fieldIds=sales&fieldIds=eps&';
    SHTML := GetHTML(URL+'sosok='+sosok+'&page='+inttostr(j));
 for k := 0 to 1 do begin
    URL:='http://finance.naver.com/sise/sise_market_sum.nhn?';
    for j:=1 to 30 do begin

        SHTML := GetHTML(URL+'sosok='+inttostr(k)+'&page='+inttostr(j));
        HtmlMemo.Text :=SHTML;
        for i:=0 to HtmlMemo.Lines.Count do begin
              LnHTML :=HtmlMemo.Lines[i];
              if  pos('<TD><A class=tltle href="/item/main.nhn?code=', LnHTML) > 0 then begin
                  ccode:=GetData('?code=', '">', HtmlMemo.Lines[i]);
                  company:=GetData('">', '</A>', HtmlMemo.Lines[i]);
                  curPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+1]);
                  prePrice:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+2]);
                  if ccode ='010140' then
                     company:=company;


                  upDown:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+3]);
                  orgPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+4]);
                  DealAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+5]);
                  TotalStock:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+6]);

                  SaleAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+7]);
                  DebtTotal:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+8]);
                  SalesProfit:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+9]);
                  StockProfit:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+10]);
                  ForeignRate:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+11]);
//                  memo1.Lines.Add(ccode + chr(9)+ company + chr(9)+ curPrice + chr(9)+ prePrice + chr(9)+ upDown + chr(9)+ orgPrice + chr(9)+ DealAmount + chr(9)+ SaleAmount + chr(9)+ DebtTotal + chr(9)+ SalesProfit + chr(9)+ StockProfit + chr(9)+ ForeignRate);
                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql :='delete from Main_Comp where ccode=''' + ccode + '''';
                  ADOQuery2.sql.add(dSql);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql := 'insert into Main_Comp(ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, SaleAmount,DebtTotal,';
                  iSql := iSql + ' SalesProfit, StockProfit, ForeignRate,sosok) Values(''' + ccode + ''','''+ company + ''','+curPrice+','+prePrice+','+upDown;
                  iSql := iSql +','+orgPrice+','+TotalStock+','+ DealAmount+','+ SaleAmount+','+DebtTotal+','+SalesProfit+','+ StockProfit+','+ ForeignRate+','+inttostr(k)+')';
                  ADOQuery2.sql.add(iSql);
                  ADOQuery2.ExecSQL;
                  cc:=cc+1;
                  LABEL2.Caption :=intTostr(cc);
              end;
        end;
        HtmlMemo.Lines.Clear;
    end;
 end;

    showmessage('완료');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, fDate, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 HtmlMemo2 :TMemo;
 i,cc:integer;
 PriceList: Tstringlist;
begin
      if MessageDlg('주기정보 가져오기??', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
        exit;
      end;


      HtmlMemo2 := TMemo.Create(Self);
      HtmlMemo2.Parent := Self;
      HtmlMemo2.Width :=2000;
      HtmlMemo2.Visible :=false;
      PriceList := TStringList.Create;
      cc:=0;


      if checkbox1.Checked  then begin
         Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +'''';
      end else if RadioButton10.Checked  then begin
         Sql := 'select * from Main_Comp order by ccode';
      end else begin
              if RadioButton7.Checked then
                    Sql := 'select * from Main_Comp where  sosok=0  order by ccode'     //ccode=''101530'' and
              else  Sql := 'select * from Main_Comp where  sosok=1 order by ccode';
      end;

      FDQuery1.close;
      FDQuery1.sql.Clear;
      FDQuery1.sql.add(Sql);
      FDQuery1.Open;
      fDate := StringReplace(datetostr(DateTimePicker1.date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      while not FDQuery1.Eof do begin
          CCODE :=TRIM(FDQuery1.fieldvalues['ccode']);
          SOSOK :=TRIM(FDQuery1.fieldvalues['sosok']);
         // http://fchart.stock.naver.com/sise.nhn?symbol=005930&timeframe=day&startTime=20130709&count=100&requestType=2
         //http://finance.naver.com/item/sise_time.nhn?code=138690&thistime=201608101501&page=35
          URL:='http://fchart.stock.naver.com/sise.nhn?symbol=' + CCODE +'&timeframe=day&startTime='+fDate +'&count=' + trim(edit3.text) +'&requestType=2';
          SHTML := GetHTML(URL);
          HtmlMemo2.Text :=SHTML;
          for i:=0 to HtmlMemo2.Lines.Count do begin
              LnHTML :=HtmlMemo2.Lines[i];
              if  pos('<SPAN class=t>item</SPAN>', LnHTML) > 0 then begin
                  getPrice:=GetData('</SPAN><B>', '</B>', HtmlMemo2.Lines[i]);
                  PriceList.Delimiter := '|';
                  PriceList.DelimitedText := getPrice;
                  if SOSOK = '0' then begin
                      StockTable :='DailyPrice_KOSP';
                      InputTable :='Daily_KOSP';
                  end else begin
                      StockTable :='DailyPrice_KOSD';
                      InputTable :='Daily_KOSD';
                  end;
                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql :='Delete from ' + StockTable + ' where CCODE= ''' + CCODE + ''' AND DDATE ='''+ PriceList[0] + '''';
                  ADOQuery2.sql.add(dSql);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql := 'insert into '+StockTable +' (CCODE,dDate,StartPrice,HighPrice,LowPrice,EndPrice,Gurae) ';
                  iSql := iSql + ' Values(''' + CCODE + ''','''+ PriceList[0] + ''',' + PriceList[1] + ',' + PriceList[2] + ',' + PriceList[3] +',' + PriceList[4] +',' + PriceList[5] +')';
                  ADOQuery2.sql.add(iSql);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql2 :='Delete from ' + InputTable + ' where CCODE= ''' + CCODE + ''' AND DDATE ='''+ PriceList[0] + '''';
                  ADOQuery2.sql.add(dSql2);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql2 :='INSERT INTO ' + InputTable +' (CCODE,DDATE,STARTPRICE,HIGHPRICE,LOWPRICE,ENDPRICE,GURAE) SELECT CCODE,DDATE,STARTPRICE,HIGHPRICE,LOWPRICE,ENDPRICE,GURAE ';
                  iSql2 := iSql2+ ' FROM ' + StockTable +' where CCODE = ''' + CCODE + ''' AND DDATE ='''+ PriceList[0] + ''' ORDER BY CCODE, DDATE ';
                  ADOQuery2.sql.add(iSql2);
                  ADOQuery2.ExecSQL;

                  PriceList.Clear;


               end;
          end;
          cc:=cc+1;
          LABEL2.Caption :=intTostr(cc);
          FDQuery1.Next;
          HtmlMemo2.Clear;
          
      end;
      
      showmessage('완료');


end;

procedure TForm1.Button5Click(Sender: TObject);
var
   sql,sql3,CCODE, fDate,endDate, compTable : string;
   cc:integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
begin
   if MessageDlg('상위종목 가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;

  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  listbox4.Clear;
  cc:=0;
  fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  endDate := copy(edit9.text,1,4) + copy(edit9.text,5,2) + copy(edit9.text,7,2);

  if RadioButton7.Checked then compTable := 'DAILY_KOSP'
  else compTable := 'DAILY_KOSD';
  if RadioButton10.Checked then compTable := 'DAILY_KOSP';


  sql := 'SELECT (SELECT COMPANY FROM MAIN_COMP WHERE CCODE =A.CCODE) AS COMPANY, A.CCODE AS CCODE, A.ENDPRICE AS ENDPRICE, ROUND(A.UPDOWN,2) AS UPDOWN  FROM (SELECT  CCODE,';
  sql := sql + ' ((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100 AS UPDOWN, ENDPRICE FROM '+ compTable +' WHERE DDATE = ''' + FDATE + ''' ) A ';
  if STRTOINT(EDIT4.TEXT) < 0 then sql := sql + ' WHERE A.UPDOWN <= ' + EDIT4.TEXT + ' ORDER BY A.UPDOWN DESC '
  else  sql := sql + ' WHERE A.UPDOWN >= ' + EDIT4.TEXT + ' ORDER BY A.UPDOWN DESC ';
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
          LISTBOX1.Items.Add(TRIM(CCODE));
          LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));

          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];

          sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
          sql3 :=sql3 +  compTable + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
          ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
          ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
          ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;

         FDQuery1.Next;
         cc:=cc+1;
         LABEL2.Caption :=intTostr(cc);
  end;

  if RadioButton10.Checked then begin
      compTable := 'DAILY_KOSD';
      sql := 'SELECT (SELECT COMPANY FROM MAIN_COMP WHERE CCODE =A.CCODE) AS COMPANY, A.CCODE AS CCODE, A.ENDPRICE AS ENDPRICE, ROUND(A.UPDOWN,2) AS UPDOWN  FROM (SELECT  CCODE,';
      sql := sql + ' ((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100 AS UPDOWN,ENDPRICE FROM '+ compTable +' WHERE DDATE = ''' + FDATE + ''' ) A ';
      if STRTOINT(EDIT4.TEXT) < 0 then sql := sql + ' WHERE A.UPDOWN <= ' + EDIT4.TEXT + ' ORDER BY A.UPDOWN DESC '
      else  sql := sql + ' WHERE A.UPDOWN >= ' + EDIT4.TEXT + ' ORDER BY A.UPDOWN DESC ';
      FDQuery1.Close;
      FDQuery1.SQL.Clear;
      FDQuery1.SQL.Add(sql);
      FDQuery1.Open;
      while NOT FDQuery1.Eof  do begin
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
          LISTBOX1.Items.Add(TRIM(CCODE));
        //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
          LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));

          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];

          sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
          sql3 :=sql3 +  compTable + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
          ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
          ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
          ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;



          FDQuery1.Next;
          cc:=cc+1;
          LABEL2.Caption :=intTostr(cc);
      end;
  end;


  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button6Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,compTable1,compTable2 : string;
   CCODE, endDate : string;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;

begin
   if MessageDlg('보물 종목  A?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';
  compTable2 := 'DAILY_KOSD';
  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  listbox4.Clear;
  fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  endDate := copy(edit9.text,1,4) + copy(edit9.text,5,2) + copy(edit9.text,7,2);

   if checkbox2.Checked  then  begin
     if RadioButton1.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql := sql + ' FROM ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT < 10 - ' + EDIT7.Text + ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton2.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT < 20 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton3.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT < 40 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton4.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql := sql + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT < 60 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end;

      if RadioButton1.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT < 10 - ' + EDIT7.Text + ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton2.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT < 20 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton3.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT < 40 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end else if RadioButton4.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT < 60 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.UPDOWN';
     end;
  end else begin
       if RadioButton1.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql := sql + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY10SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY X.UPDOWN DESC, VSTDEV ';
     end else if RadioButton2.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY20SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY X.UPDOWN DESC, VSTDEV  ';
     end else if RadioButton3.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY40SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY X.UPDOWN DESC, VSTDEV  ';
     end else if RadioButton4.Checked then begin
         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql := sql + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT > ' + EDIT7.Text;
         sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY60SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY X.UPDOWN DESC, VSTDEV  ';
     end;

     if RadioButton1.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY10SUM/nullif((ENDPRICE-DAY10SUM),0)) * 100,2),0) AS UPDOWN, DAY10COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY10COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY10SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV ';
     end else if RadioButton2.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY20COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY20SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton3.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY40COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY40SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end else if RadioButton4.Checked then begin
         sql2 := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
         sql2 := sql2 + ' ISNULL(ROUND((A.DAY60SUM/nullif((ENDPRICE-DAY60SUM),0)) * 100,2),0) AS UPDOWN, DAY60COUNT';
         sql2 := sql2 + ' FROM ' + compTable2 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.8 AND A.DDATE=''' + fDate + ''' AND DAY60COUNT > ' + EDIT7.Text;
         sql2 := sql2 + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY60SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY UPDOWN DESC, VSTDEV  ';
     end;



  end;

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
      ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
      CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
      sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
      sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
      sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
      FDQuery2.Close;
      FDQuery2.SQL.Clear;
      FDQuery2.SQL.Add(sql3);
      FDQuery2.Open;
      ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
      ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
      ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;

          LISTBOX1.Items.Add(CCODE);
        //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clBlack));
          LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));

      FDQuery1.Next;
  end;

  ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(sql2);
  FDQuery1.Open;
  while NOT FDQuery1.Eof  do begin
      ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
      CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
      sql4 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
      sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
      sql4 :=sql4 +  compTable2 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + fDate + ''' and '''+ endDate +'''';
      FDQuery2.Close;
      FDQuery2.SQL.Clear;
      FDQuery2.SQL.Add(sql4);
      FDQuery2.Open;
      ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE'];
      ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
      ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

          if ENDMAX > ENDPRICE then begin
             ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
             listbox4.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end else if ENDMAX = ENDPRICE then begin
             listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
          end else begin
             listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
          end;

          LISTBOX1.Items.Add(CCODE);
       //   LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
          ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
          LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));




      FDQuery1.Next;
  end;



  label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button7Click(Sender: TObject);
var
  SHTML, LnHTML,URL,iSql,sql, dSql,callvar, CallDay: string ;
  i,j,k,n,m,CC,bx,t,dd,UpHigh :integer;
  HtmlMemo3 : Tmemo;
 // SHTML : TMemoryStream;
  ccode, company, curPrice, prePrice, upDown, orgPrice, DealAmount, DebtTotal,SalesProfit :string;
  sosok, UpPercent : string;
  GuraeMList: Tstringlist;
  WebB : Twebbrowser;
  gTime, gPrice, gUpdown, gDayGap, gSell, gBuy, gGurae, gGuraeGap :string;
begin
     if MessageDlg('가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
     begin
       exit;
     end;


      HtmlMemo3 := TMemo.Create(Self);
      HtmlMemo3.Parent := Self;
      HtmlMemo3.Width :=2000;
      HtmlMemo3.Visible :=false;

      FDQuery1.close;
      FDQuery1.sql.Clear;
      CC:=0;
      if checkbox1.Checked  then  Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''
      else begin
              if RadioButton7.Checked then Sql := 'select * from Main_Comp where  sosok=0  order by ccode'     //ccode=''101530'' and
              else  Sql := 'select * from Main_Comp where  sosok=1 order by ccode';
      end;


      FDQuery1.sql.add(Sql);
      FDQuery1.Open;
      while not FDQuery1.Eof do begin
          CCODE :=TRIM(FDQuery1.fieldvalues['ccode']);
          COMPANY :=TRIM(FDQuery1.fieldvalues['COMPANY']);
         //http://finance.naver.com/item/sise_time.nhn?code=138690&thistime=201608101501&page=1
          URL:='http://finance.naver.com/item/sise_time.nhn?code=';

                  SHTML := GetHTML(URL+ CCODE+'&thistime='+edit9.text);
                  HtmlMemo3.Text := SHTML ;
                  bx:=0;
                  UpHigh :=0;
                       //체결시각		체결가		전일비		매도		 매수		 거래량		변동량
                  for i:=HtmlMemo3.Lines.Count-1 downto 1 do begin
                      LnHTML :=HtmlMemo3.Lines[i];
                      if  pos('<TD align=center><SPAN class="tah p10 gray03">', LnHTML) > 0 then begin
                          gTime:=GetData('<TD align=center><SPAN class="tah p10 gray03">', '</SPAN></TD>', HtmlMemo3.Lines[i]);
                          gPrice:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+1]);
                          gUpdown:=GetData('alt=', 'src="http:', HtmlMemo3.Lines[i+2]);
                          gDayGap:=trim(GetData('">', '</SPAN></TD>', HtmlMemo3.Lines[i+2]));
                       //   gSell:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+3]);
                       //   gBuy:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+4]);
                       //   gGurae:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+5]);
                          gGuraeGap:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+6]);
                          if gDayGap ='' then  gDayGap:='0'
                          else if gUpdown ='하락'  then  gDayGap := '-' + gDayGap;

                          if (UpHigh >  strToint(gDayGap) ) and ( strToint(gGuraeGap) > 40000) and (bx=1) then begin
                              UpPercent := FormatFloat('0.##',strToint(trim(gDayGap)) * 100 / (strToint(gPrice) - strToint(gDayGap)));

                                  memo3.Lines.Add(gTime);
                                  listbox1.items.Add(CCODE);
                                  listbox2.items.Add('xxx' + COMPANY);
                                  listbox3.items.Add(FormatFloat('#,###',strToint(gGuraeGap)));
                                  listbox4.items.Add( FormatFloat('#,###', strToint(gPrice) - strToint(gDayGap))+ '\' + gDayGap+ '/' + '(' + UpPercent +'%)');
                                  UpHigh :=strToint(gDayGap);
                                  bx:=0;
                          end else if (UpHigh < strToint(gDayGap)) and ( strToint(gGuraeGap) > 40000) and ( strToint(gPrice) * strToint(gGuraeGap) > 200000000)  then begin
                              UpPercent := FormatFloat('0.##',strToint(trim(gDayGap)) * 100 / (strToint(gPrice) - strToint(gDayGap)));
                              if strTofloat(UpPercent) < 2 then begin
                                  memo3.Lines.Add(gTime);
                                  listbox1.items.Add(CCODE);
                                  listbox2.items.Add(COMPANY);
                                  listbox3.items.Add(FormatFloat('#,###',strToint(gGuraeGap)));
                                  listbox4.items.Add( FormatFloat('#,###', strToint(gPrice) - strToint(gDayGap))+ '\' + gDayGap+ '/' + '(' + UpPercent +'%)');
                                  if UpHigh < strToint(gDayGap) then UpHigh :=strToint(gDayGap);
                                  bx:=1;
                              end;
                          end else if (UpHigh < strToint(gDayGap)) and ( strToint(gGuraeGap) > 100000)   then begin
                              UpPercent := FormatFloat('0.##',strToint(trim(gDayGap)) * 100 / (strToint(gPrice) - strToint(gDayGap)));

                                  memo3.Lines.Add(gTime);
                                  listbox1.items.Add(CCODE);
                                  listbox2.items.Add('@@' + COMPANY);
                                  listbox3.items.Add(FormatFloat('#,###',strToint(gGuraeGap)));
                                  listbox4.items.Add( FormatFloat('#,###', strToint(gPrice) - strToint(gDayGap))+ '\' + gDayGap+ '/' + '(' + UpPercent +'%)');
                                  if UpHigh < strToint(gDayGap) then UpHigh :=strToint(gDayGap);
                                  bx:=1;
                          end else if (UpHigh < strToint(gDayGap)) and ( strToint(gGuraeGap) > 40000) and ( strToint(gPrice) * strToint(gGuraeGap) > 200000000) then begin
                              UpPercent := FormatFloat('0.##',strToint(trim(gDayGap)) * 100 / (strToint(gPrice) - strToint(gDayGap)));

                                  memo3.Lines.Add(gTime);
                                  listbox1.items.Add(CCODE);
                                  listbox2.items.Add('@-@' + COMPANY);
                                  listbox3.items.Add(FormatFloat('#,###',strToint(gGuraeGap)));
                                  listbox4.items.Add( FormatFloat('#,###', strToint(gPrice) - strToint(gDayGap))+ '\' + gDayGap+ '/' + '(' + UpPercent +'%)');
                                  if UpHigh < strToint(gDayGap) then UpHigh :=strToint(gDayGap);
                                  bx:=1;
                          end;


                      end;
          end;
          HtmlMemo3.Lines.Clear;
          cc:=cc+1;
          LABEL2.Caption :=intTostr(cc);
          FDQuery1.Next;
    end;

//    SHTML.Free;
    showmessage('완료');

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   edit9.text := formatdatetime('YYYYMMDDhhmm',now);

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   memo3.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;
end;

procedure TForm1.DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
begin
  SeriesIndex := DBChart1.Series[0].Clicked(X, Y);

  DBChart1.ShowHint := SeriesIndex <> -1;

  if DBChart1.ShowHint then
  begin
    ADOQuery1.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
    DBChart1.Hint := ADOQuery1.FieldByName('ENDPRICE').AsString + '('+ADOQuery1.FieldByName('UPDOWN2').AsString +')';
  end;
end;

procedure TForm1.DBChart2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1: Integer;
  DayGurae :longint;
begin
  SeriesIndex1 := DBChart2.Series[0].Clicked(X, Y);

  DBChart2.ShowHint := SeriesIndex1 <> -1;

  if DBChart2.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }
    DayGurae := ADOQuery3.FieldByName('GURAE').Value;
    DBChart2.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ')';

  end;

end;

procedure TForm1.DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
begin
  SeriesIndex := DBChart3.Series[0].Clicked(X, Y);

  DBChart3.ShowHint := SeriesIndex <> -1;

  if DBChart3.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
    DBChart3.Hint := ADOQuery3.FieldByName('ENDPRICE').AsString + '('+ADOQuery3.FieldByName('UPDOWN2').AsString +')';
  end;

end;

procedure TForm1.DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1: Integer;
  DayGurae : longint;
begin
  SeriesIndex1 := DBChart5.Series[0].Clicked(X, Y);

  DBChart5.ShowHint := SeriesIndex1 <> -1;

  if DBChart5.ShowHint then
  begin
    ADOQuery1.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }
    DayGurae := ADOQuery1.FieldByName('GURAE').Value;
    DBChart5.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ')';
  end;


end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Button1Click(nil);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin

       LISTBOX1.Clear;
       LISTBOX2.Clear;
       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE COMPANY like ''%' + edit2.Text + '%''';
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;
       while NOT FDQuery1.Eof  do begin
           LISTBOX1.Items.Add(TRIM(FDQuery1.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
           FDQuery1.Next;
       end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   con_string :string;
begin
 DateTimePicker1.DateTime :=now;
 edit9.text := formatdatetime('YYYYMMDDhhmm',now);
 ListBox2.Style := lbOwnerDrawFixed;
 con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
 con_string := con_string + 'stock.fruitcredit.com ;Use Encryption for Data=False;Tag with column collation when possible=False';
 ADOConnection1.ConnectionString := con_string;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    HtmlMemo.Free;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
   edit1.Text := listbox1.items[listbox1.itemindex];;
   Button1Click(nil);
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
      edit1.Text := listbox1.items[listbox2.itemindex];
      Button1Click(nil);
end;

procedure TForm1.ListBox2DblClick(Sender: TObject);
begin


      listbox4.items.Add(listbox2.items[listbox2.itemindex]);

end;

procedure TForm1.ListBox2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
    with Control as TListBox do
    begin
        Canvas.FillRect(Rect);
        Canvas.Font.Color := TColor(Items.Objects[Index]);
        Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
    end;
end;

procedure TForm1.Memo1DblClick(Sender: TObject);
begin
   edit1.Text := memo1.Text;
   memo1.SetFocus;
   Button1Click(nil);
end;

procedure TForm1.Memo2DblClick(Sender: TObject);
var
 sql, ctxt : string;
begin
   ctxt := Memo2.SelText;
   FDQuery1.SQL.Clear;
   sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE COMPANY = ''' + ctxt + '''';
   FDQuery1.SQL.Add(sql);
   FDQuery1.Open;

   edit1.text := FDQuery1.fieldvalues['CCODE'];
   Button1Click(nil);

end;

procedure TForm1.Memo3DblClick(Sender: TObject);
begin
   edit1.text := Memo3.SelText;
   Button1Click(nil);

end;

function Tform1.GetHTML(addr: string):string;
var
  i:longint;
  WebB: TWebBrowser;

begin
 TRY
   if addr='' then exit;

    // WebB :=TWebBrowser.Create(Self);
    // WebB.Visible :=false;
    //  WebB.HandleNeeded;

      WebBrowser1.Navigate(addr);

      WebBrowser1.Silent := True;
      while (WebBrowser1.ReadyState <> READYSTATE_COMPLETE ) do //and (timequit=false)   do
            Application.ProcessMessages;

      result:= WebBrowser1.OleObject.Document.DocumentElement.OuterHTML;  //Hdata;
  finally
  //  WebB.Free;
  end;
end;

function Tform1.GetHTMLSource(Doc: IHtmlDocument2): string;
 var
   WebS           : IPersistStreamInit;
   Buf            : TStringStream;
 begin
   Buf := TStringStream.Create('');
   try
     if SUCCEEDED( Doc.QueryInterface(IPersistStreamInit, WebS) ) then
       if SUCCEEDED( WebS.Save(TStreamAdapter.Create(Buf), True) ) then
         Result := Buf.DataString
       else
         Result := '';
   finally
     FreeAndNil(Buf);
   end;

end;

function Tform1.GetData(Fstr:string; Lstr:string; memoln :string):string;
var
  retStr: string;
begin
    memoln:= StringReplace(memoln, ',', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:= StringReplace(memoln, 'N/A', '0',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '+', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '%', '',[rfReplaceAll, rfIgnoreCase]);
  //  memoln:=StringReplace(memoln, '|', ',',[rfReplaceAll, rfIgnoreCase]);
    retStr := copy(memoln, pos(Fstr,memoln)+ length(Fstr), pos(Lstr,memoln)-pos(Fstr,memoln)- length(Fstr));
    if pos(Fstr, retStr) > 0 then begin
       retStr := copy(retStr, pos(Fstr,retStr)+ length(Fstr), length(retStr)-pos(Fstr,retStr)- length(Fstr));
    end;
    result :=retStr;
end;

function Tform1.GetHTML2(addr2: string):TMemoryStream;
var
  Hdata:string;
  i:longint;
  resp: TMemoryStream;
begin
 TRY
     if addr2='' then exit;

     resp := TMemoryStream.Create;
     IdHTTP1.Get(addr2,resp);

     resp.Position := 0;
     result:= resp;
  finally
    resp.Free;
  end;
end;


procedure TForm1.Button10Click(Sender: TObject);
var
  SHTML, LnHTML,URL,iSql,sql, dSql,callvar, CallDay: string ;
  i,j,k,n,m,CC,bx,t,dd,sPage, UpHigh :integer;
  HtmlMemo3 : Tmemo;
 // SHTML : TMemoryStream;
  ccode, company, curPrice, prePrice, upDown, orgPrice, DealAmount, DebtTotal,SalesProfit :string;
  sosok, UpPercent : string;
  GuraeMList: Tstringlist;
  WebB : Twebbrowser;
  gTime, gPrice, gUpdown, gDayGap, gSell, gBuy, gGurae, gGuraeGap :string;
begin
     if MessageDlg('가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
     begin
       exit;
     end;


      HtmlMemo3 := TMemo.Create(Self);
      HtmlMemo3.Parent := Self;
      HtmlMemo3.Width :=2000;
      HtmlMemo3.Visible :=false;

      FDQuery1.close;
      FDQuery1.sql.Clear;
      CC:=0;
      if checkbox1.Checked  then  Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''
      else begin
              if RadioButton7.Checked then Sql := 'select * from Main_Comp where  sosok=0  order by ccode'     //ccode=''101530'' and
              else  Sql := 'select * from Main_Comp where  sosok=1 order by ccode';
      end;


      FDQuery1.sql.add(Sql);
      FDQuery1.Open;
      while not FDQuery1.Eof do begin
          CCODE :=TRIM(FDQuery1.fieldvalues['ccode']);
          COMPANY :=TRIM(FDQuery1.fieldvalues['COMPANY']);
         //http://finance.naver.com/item/sise_time.nhn?code=138690&thistime=201608101501&page=1
          URL:='http://finance.naver.com/item/sise_time.nhn?code=';
          dd :=strtoint(edit3.Text);

          callvar := copy(edit9.text,1,4) +'-'+ copy(edit9.text,5,2) +'-' +copy(edit9.text,7,2);
          for t:=dd-1 downto 0 do begin
              CallDay := StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);
       
              for spage := 1 to 39 do begin 

                  SHTML := GetHTML(URL+ CCODE+'&thistime='+ CallDay + '1531'+'&page=' + inttostr(spage));
 
                  HtmlMemo3.Text := SHTML ;
                  bx:=0;
                  UpHigh :=0;
                  gTime:='';
                       //체결시각		체결가		전일비		매도		 매수		 거래량		변동량
                  for i:=HtmlMemo3.Lines.Count-1 downto 1 do begin
                      LnHTML :=HtmlMemo3.Lines[i];
                      if  pos('<TD align=center><SPAN class="tah p10 gray03">', LnHTML) > 0 then begin
                          gTime:=StringReplace(GetData('<TD align=center><SPAN class="tah p10 gray03">', '</SPAN></TD>', HtmlMemo3.Lines[i]),':','', [rfReplaceAll, rfIgnoreCase]);
                          gPrice:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+1]);
                          gUpdown:=GetData('alt=', 'src="http:', HtmlMemo3.Lines[i+2]);
                          gDayGap:=trim(GetData('">', '</SPAN></TD>', HtmlMemo3.Lines[i+2]));
                          gSell:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+3]);
                          gBuy:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+4]);
                          gGurae:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+5]);
                          gGuraeGap:=GetData('<TD class=num><SPAN class="tah p11">', '</SPAN></TD>', HtmlMemo3.Lines[i+6]);
                          if gDayGap ='' then  gDayGap:='0'
                          else if gUpdown ='하락'  then  gDayGap := '-' + gDayGap;

                          if gTime <> '' then begin
                              ADOQuery2.close;
                              ADOQuery2.sql.Clear;
                              dSql :='Delete from Time_Stock where CCODE= ''' + CCODE + ''' AND ALLTIME ='''+ CallDay+gTime + '''';
                              ADOQuery2.sql.add(dSql);
                              ADOQuery2.ExecSQL;
                  
                              ADOQuery2.close;
                              ADOQuery2.sql.Clear;
                              iSql := 'insert into Time_Stock (CCODE,DDATE,TTIME,ALLTIME,GUPDOWN, DEALPRICE,DAYUPDOWN,SELLPRICE,BUYPRICE,GURAE,TIMEGURAE) ';
                              iSql := iSql + ' Values(''' + CCODE + ''','''+ CallDay + ''','''+ gTime + ''',''' + CallDay+gTime+ ''',''' + GUPDOWN + ''',' + gPrice + ',';
                              iSql := iSql + gDayGap + ',' + gSell +',' + gBuy +',' + gGurae +',' + gGuraeGap +')';
                              ADOQuery2.sql.add(iSql);
                              ADOQuery2.ExecSQL;
                          end;
                      end;
                      
                  end;
                  if gTime ='0900' then 
                     break;
              end;
          end;
          HtmlMemo3.Lines.Clear;
          cc:=cc+1;
          LABEL2.Caption :=intTostr(cc);
          FDQuery1.Next;
    end;

//    SHTML.Free;
    showmessage('완료');

end;

end.
