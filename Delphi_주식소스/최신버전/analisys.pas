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
  IdBaseComponent, IdComponent, IdTCPConnection,ComObj, IdTCPClient, DateUtils, IdHTTP, Clipbrd,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Winapi.WebView2, Vcl.Edge,shellapi, StrUtils,System.Math;

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
    ADOQuery2: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Memo1: TMemo;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button3: TButton;
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
    CheckBox3: TCheckBox;
    Button7: TButton;
    Edit9: TEdit;
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
    LineSeries2: TLineSeries;
    DBChart3: TDBChart;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    LineSeries6: TLineSeries;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    DateTimePicker2: TDateTimePicker;
    ListBox7: TListBox;
    CheckBox6: TCheckBox;
    ScrollBar1: TScrollBar;
    Button12: TButton;
    LineSeries7: TLineSeries;
    FDConnectionMysql1: TFDConnection;
    FDQueryMysql1: TFDQuery;
    Button13: TButton;
    LineSeries10: TBarSeries;
    Label3: TLabel;
    Label4: TLabel;
    LineSeries1: TBarSeries;
    Edit15: TEdit;
    WebBrowser1: TWebBrowser;
    Button8: TButton;
    ProgressBar1: TProgressBar;
    ADOQuery4: TADOQuery;
    Series6: TLineSeries;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit16: TEdit;
    Label11: TLabel;
    Button9: TButton;
    Button14: TButton;
    CheckBox7: TCheckBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    ComboBox1: TComboBox;
    Button15: TButton;
    Button16: TButton;
    Label12: TLabel;
    Edit17: TEdit;
    FDQuery3: TFDQuery;
    Button17: TButton;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    Edit18: TEdit;
    CheckBox8: TCheckBox;
    Series5: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Edit19: TEdit;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Memo3: TMemo;
    CheckBox9: TCheckBox;
    Edit20: TEdit;
    Label5: TLabel;
    Button21: TButton;
    ListBox8: TListBox;
    Memo4: TMemo;
    Memo5: TMemo;
    ListBox9: TListBox;
    Header1: THeader;
    Edit21: TEdit;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Memo6: TMemo;
    Memo7: TMemo;
    FDStoredProc1: TFDStoredProc;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
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
    function GetData(Fstr:string; Lstr:string; memoln :string):string;
    procedure Button5Click(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    function GetHTML2(addr2: string):TMemoryStream;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox7DblClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Series1BeforeDrawValues(Sender: TObject);
    function BytesToHex(aSource: TBytes): string;
    procedure Button13Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure getStockData(cName :string);
    procedure getMinData(cName :string);
    function GetHTML(addr: string):string;
    procedure Button7Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button14Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Memo2Click(Sender: TObject);
    procedure DBChart4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure BuyStop();
    procedure CheckBox9Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure ListBox8DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Theme_Call(Sender: TObject);
    procedure Theme_Flow(Sender: TObject);
    procedure Theme_Chart(item:string);
    procedure Theme_list(item:string);
    procedure Theme_SUM(aALL:integer);
    procedure TempCopy();
    procedure TempPaste();
    procedure CHART_FLOW_INSERT(STARTDT : STRING);
    procedure ListBox8Click(Sender: TObject);
    procedure ListBox8DblClick(Sender: TObject);
    procedure ListBox9DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox9DblClick(Sender: TObject);
    procedure ListBox9Click(Sender: TObject);
    procedure Edit21KeyPress(Sender: TObject; var Key: Char);
    procedure Edit21DblClick(Sender: TObject);
    procedure Edit21Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    HtmlMemo: TMemo;
  end;

var
  Form1: TForm1;
  Urladd:string;
  company_gubun : string;
  cc:longint;
  timequit:boolean;
  standTime : Tdate;
  comStockTotal : longint;
  minTime : integer;
  PassButton : integer;
  Theme : integer;

implementation

{$R *.dfm}


procedure TForm1.Button11Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd, dcc,allc, winc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if PassButton <> 1 then begin
        if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
           exit;
   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;
  // fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  // eDate :=fDate;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
      //eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin


   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT B.CCODE, B.DDATE, B.SOSOK, C.COMPANY, B.ENDPRICE, ISNULL(ROUND(((B.DAYGAP)/nullif(B.PREPRICE1,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' FROM (SELECT CCODE, DDATE, SUM(GURAE) AS TGURAE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
       sql := sql + ' FROM STOCK_MIN WHERE DDATE=''' + ddStr + '''  GROUP BY CCODE,DDATE) A INNER JOIN DAILY_KOSP B ';
       sql := sql + ' ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE)  INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) ';
       sql := sql + ' WHERE B.STARTPRICE > ' + EDIT20.Text + ' AND A.TGURAE > 500000 AND A.UPGURAE > 1 AND A.TGURAE < 11 * A.UPGURAE AND A.TGURAE > 4 * B.GURAE40' ;
       sql := sql + ' AND ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) < ' + EDIT14.Text ;
       sql := sql + ' AND B.ENDPRICE < B.MAX240 AND B.ENDPRICE > B.DAY20 '  ;
       sql := sql + Line60 + Line120 + goodsql;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


          sql2 :='SELECT  A.HIGHPRICE, A.LOWPRICE, A.STARTPRICE, A.ENDPRICE FROM STOCK_MIN A ';
          sql2 :=sql2 + ' INNER JOIN (SELECT DDATE, CCODE, MAX(GURAE) AS MAXGURAE FROM STOCK_MIN GROUP BY DDATE, CCODE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) ';
          sql2 :=sql2 + ' WHERE A.GURAE = B.MAXGURAE AND A.CCODE='''+ CCODE + ''' AND A.DDATE =''' + ddStr + '''' ;

          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql2);
          FDQuery2.Open;
          LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];

       //   myDate :=StartDate; // STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
       //   myDate := IncDay(myDate, strToint(EDIT16.TEXT));
          DateGap := trim(EDIT16.TEXT);

          sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
          sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
          sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
          ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
          ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
          ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

              if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 winc:=winc + 1;
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;

              listbox7.Items.Add(ddStr);
              LISTBOX1.Items.Add(CCODE);
            //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
              ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));
              allc :=allc +1;

          FDQuery1.Next;
       end;

       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

   Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);

   Screen.Cursor := crDefault;


   showmessage('완료');


end;

procedure TForm1.Button12Click(Sender: TObject);
var
i : integer;

begin
   memo1.Clear;
   for i := 0 to listbox1.Count-1 do
   begin
        memo1.Lines.Add(listbox7.Items.Strings[i] + char(9) + listbox1.Items.Strings[i] + char(9) + listbox2.Items.Strings[i]  + char(9) + listbox3.Items.Strings[i]  + char(9) + listbox4.Items.Strings[i]);
   end;

   ClipBoard.SetTextBuf(pChar(memo1.Lines.Text));

end;

procedure TForm1.Button13Click(Sender: TObject);
var
   sql,sql2,compTable,fDate,fTime,DealRate,CCODE,EndDate : string;
   gubun : string;
   DD,TT : integer;
begin
   RadioButton1.Caption :='10분'; RadioButton2.Caption :='20분'; RadioButton3.Caption :='30분'; RadioButton4.Caption :='1시간';
   RadioButton5.Caption :='2시간'; RadioButton6.Caption :='4시간'; RadioButton9.Caption :='1일';

   Theme :=0;
   DBChart1.Series[5].SeriesColor:= clBlack;
   DBChart1.Series[6].SeriesColor:= clBlack;
   DBChart3.Series[5].SeriesColor:= clBlack;
   DBChart3.Series[6].SeriesColor:= clBlack;



   if RadioButton1.Checked then DD:=10
   else if RadioButton2.Checked then DD:=20
   else if RadioButton3.Checked then DD:=30
   else if RadioButton4.Checked then DD:=60
   else if RadioButton5.Checked then DD:=120
   else if RadioButton6.Checked then DD:=240
   else if RadioButton9.Checked then DD:=390;

   TT := minTime * DD;
   if (TT  >= 390) or (TT < 0) then
      exit;


   CCODE :=edit1.Text;

   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + CCODE +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin
     // Listbox6.Clear;
      FORM1.Caption :=ADOQuery2.fieldvalues['COMPANY'];
      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];
     // memo2.Lines.Add(ADOQuery2.fieldvalues['COMPANY']);

      gubun  :=ADOQuery2.fieldvalues['sosok'];
      compTable := 'DAILY_KOSP';
      fDate := formatdatetime('YYYYMMDD',DateTimePicker1.Date);
      EndDate := fDate;
      if checkbox6.Checked  then BEGIN
          EndDate :=formatdatetime('YYYYMMDD',DateTimePicker2.Date);
       //   ADOQuery3.Tag := 1;
      END;
      fTime:=fDate + '09'; //StringReplace(datetostr(now), '-', '',[rfReplaceAll, rfIgnoreCase]);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
    
      sql :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, A.UPDOWNPRICE, A.ENDPRICE AS DAY20, A.ENDPRICE AS DAY60, A.ENDPRICE AS DAY120,';
      sql :=sql + ' B.GURAE AS GTOTAL, B.PREPRICE1 FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE = ''' + fDate + ''' AND ';
      sql :=sql + ' A.ALLTIME >= CONCAT(''' + fTime + ''' +(' + intTostr(TT) + ')/60 , ''00'' + (' + intTostr(TT) + ')%60) ';
      sql :=sql + ' AND A.ALLTIME <= CONCAT(''' + fTime + ''' +' + intTostr(DD + TT) + '/ 60 , ''00'' + ' + intTostr(DD + TT) + '%60) ORDER BY A.ALLTIME';

      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

      // if not ADOQuery1.Eof  then begin
        if (minTime =0) AND (ADOQuery3.Tag = 1)  then begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            sql2 :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, SUM(A.GURAE * SIGN(A.UPDOWNPRICE)) OVER (PARTITION BY A.CCODE) AS UPGURAE, A.UPDOWNPRICE, A.ENDPRICE AS DAY20,  ';
            sql2 :=sql2 + ' A.ENDPRICE AS DAY60, A.ENDPRICE AS DAY120, B.GURAE AS GTOTAL, B.PREPRICE1  FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE BETWEEN ''' + fDate + ''' AND ''' + EndDate +''' ORDER BY A.ALLTIME';
            ADOQuery3.SQL.Add(sql2);
            ADOQuery3.Open;
            ADOQuery3.Last;
            if ADOQuery1.fieldvalues['ENDPRICE'] <> null then EDIT6.Text := FormatFloat('#,###', ADOQuery3.fieldvalues['UPGURAE']);
            ADOQuery3.Tag :=0;
        end;

        //if ADOQuery1.fieldvalues['ENDPRICE'] <> null then begin
        //   EDIT5.Text :=FormatFloat('#,###',ADOQuery1.fieldvalues['ENDPRICE']);
        //   EDIT10.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['HIGHPRICE']);
        //end;
   end;

end;

procedure TForm1.Button14Click(Sender: TObject);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, CallDay, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 i,cc:integer;
 StartDate, EndDate : TDate;
 GetStream: TMemoryStream;
 idHTTP :TidHTTP;
 GuraeTimeBuff,StartBuff,  HighBuff, LowBuff, EndBuff, GuraeBuff : TBytes;
 GuraeDay, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE : string;
begin
      if PassButton <> 1 then begin
          if MessageDlg('주가정보 가져오기??', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
             exit;
      end;

      cc:=0;




      StartDate := DateTimePicker1.Date;
      CallDay := FormatDateTime('YYYYMMDD', StartDate);

      Sql := 'select CCODE from STOCK_MIN where DDATE ='''+ CallDay + ''' group by CCODE order by ccode';

   try
      ADOQuery4.close;
      ADOQuery4.sql.Clear;
      ADOQuery4.sql.add(Sql);
      ADOQuery4.Open;


      while not ADOQuery4.Eof do begin
          CCODE :=TRIM(ADOQuery4.fieldvalues['ccode']);
          StartDate := DateTimePicker1.Date;

      //    while StartDate <= EndDate  do begin
            //   if DAYOFTHEWEEK(StartDate) > 5 then begin
            //      StartDate :=IncDay(StartDate, 1);
            //      Continue;
            //   end;

                   CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);


                   ADOQuery2.close;
                   ADOQuery2.sql.Clear;
                   dSql2 :='Delete from Daily_KOSP where CCODE= ''' + CCODE + ''' AND DDATE ='''+ CallDay + '''';
                   ADOQuery2.sql.add(dSql2);
                   ADOQuery2.ExecSQL;

                   ADOQuery2.close;
                   ADOQuery2.sql.Clear;
                   iSql := 'insert into Daily_KOSP (CCODE,DDATE,STARTPRICE,HIGHPRICE,LOWPRICE,ENDPRICE,GURAE,SOSOK) ';
                   iSql :=iSql +  'SELECT TOP 1 CCODE,DDATE, FIRST_VALUE(STARTPRICE) OVER (PARTITION BY CCODE ORDER BY DDATE), MAX(HIGHPRICE) OVER (PARTITION BY CCODE ORDER BY DDATE), ';
                   iSql :=iSql +  ' MIN(LOWPRICE) OVER (PARTITION BY CCODE ORDER BY DDATE), LAST_VALUE(ENDPRICE) OVER (PARTITION BY CCODE ORDER BY DDATE), SUM(GURAE) OVER (PARTITION BY CCODE ORDER BY DDATE) AS GURAE1, SOSOK ';
                   iSql :=iSql +  ' from STOCK_MIN WHERE CCODE= ''' + CCODE + ''' AND DDATE ='''+ CallDay + ''' ORDER BY ALLTIME DESC ';


                   ADOQuery2.sql.add(iSql);
                   ADOQuery2.ExecSQL;

                   CallDay:='';

     //     end;
          cc := cc+1;
          LABEL2.Caption :=inttostr(cc);
 //         Progressbar1.Position := Progressbar1.Position + 1;
          ADOQuery4.Next;
          Application.ProcessMessages;
      end;
      if PassButton <> 1 then begin
         showmessage('완료');
      end;
   finally

   end;

end;

procedure TForm1.Button15Click(Sender: TObject);
var
 sql : string;
begin

       LISTBOX1.Clear;
       LISTBOX2.Clear;
       listbox7.Clear;
       listbox3.Clear;
       listbox4.Clear;


       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE sosok=2 order by ccode';
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;
       while NOT FDQuery1.Eof  do begin
           LISTBOX1.Items.Add(TRIM(FDQuery1.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
           LISTBOX7.Items.Add(StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]));
           FDQuery1.Next;
       end;

end;

procedure TForm1.Button16Click(Sender: TObject);
var
   sql,sql3,CCODE, fDate, eDate,todayDate,ddStr,SOSOK, compTable,goodsql,DateGap : string;
   cc,dd:integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if MessageDlg('급등자료 가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;

  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  listbox4.Clear;
  listbox7.Clear;
  cc:=0;


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
          if DAYOFTHEWEEK(StartDate) > 5 then begin
             StartDate :=IncDay(StartDate, 1);
             Continue;
          end;
    //     ddStr :=intTostr(dd);
          ddStr := formatdatetime('YYYYMMDD',StartDate);


          sql := 'SELECT A.CCODE, A.DDATE, A.ENDPRICE, ROUND(100 * A.DAYGAP10 / A.ENDPRICE,2) as MAXUP, B.company, B.sosok  FROM (SELECT CCODE, DDATE, ENDPRICE, SUM(DAYGAP) ';
          sql := sql + ' OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND 9 FOLLOWING) AS DAYGAP10 FROM DAILY_KOSP WHERE ENDPRICE > 0 AND ';
          sql := sql + ' DDATE >= '''+ ddStr +''' ) A inner join Main_Comp B on(A.CCODE=B.CCODE) WHERE ROUND(100 * A.DAYGAP10 / A.ENDPRICE,2) > ' + edit17.text + ' AND A.DDATE ='''+ ddStr +'''';

          IF checkbox3.Checked  then
              sql := sql + ' AND B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';



          FDQuery1.Close;
          FDQuery1.SQL.Clear;
          FDQuery1.SQL.Add(sql);
          FDQuery1.Open;
          while NOT FDQuery1.Eof  do begin
              CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
              LISTBOX1.Items.Add(TRIM(CCODE));
        //    LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery1.fieldvalues['SOSOK'] = 0 THEN LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
              ELSE ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['MAXUP']));

              ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
//              myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
//              myDate := IncDay(myDate, 15);
 //             todayDate := DateToStr(myDate);



              DateGap := trim(EDIT16.TEXT);

              sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
              sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
              sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
              sql3 :=sql3 + 'DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

              FDQuery2.Close;
              FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add(sql3);
              FDQuery2.Open;
              ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
              ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
              ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];



              if ENDMAX > ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;



              listbox7.Items.Add(ddStr);
              FDQuery1.Next;
              cc:=cc+1;
              LABEL2.Caption :=intTostr(cc);
          end;

          StartDate :=IncDay(StartDate, 1);
          LISTBOX7.Items.Add('----------');
          LISTBOX1.Items.Add('----------');
          ListBox2.Items.Add('----------');
          LISTBOX3.Items.Add('----------');
          LISTBOX4.Items.Add('----------');

  end;

  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button17Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,DateGap : string;
   CCODE, ddStr, todayDate,goodsql ,BuyPrice, TGurae, Line60, Line120: string;
   dd, dcc,allc, winc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
 //  if MessageDlg('TEST  A?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
 ///  begin
 //      exit;
 //  end;
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   if RadioButton1.Checked then  RadioButton2.Checked := true;
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 '; //and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6 ';

   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (A.ENDPRICE >= A.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(A.ENDPRICE >= A.DAY120) ';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);


        sql :='select A.DDATE, A.CCODE AS CCODE, C.COMPANY, A.STARTPRICE, A.ENDPRICE, A.HIGHPRICE, A.LOWPRICE, A.DAYGAP, A.SOSOK, B.yGurae, B.xLowprice,';
        sql :=sql + ' B.yGurae * 0.00000001 * B.xLowprice AS TGurae, (A.HIGHPRICE - A.LOWPRICE)*100/nullif(A.PREPRICE1,0) AS UPDOWN, UPGURAE  ';
        sql :=sql + ' from DAILY_KOSP A INNER JOIN (SELECT * FROM (SELECT DDATE, CCODE,LOWPRICE AS xLowprice, Gurae, ROW_NUMBER() OVER (PARTITION BY DDATE,';
        sql :=sql + ' CCODE ORDER BY DDATE, CCODE, GURAE  DESC) AS RankNo, SUM(SIGN(UPDOWNPRICE)) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS UPGURAE,';
        sql :=sql + ' GURAE * SIGN(UPDOWNPRICE) AS yGurae FROM STOCK_MIN WHERE GURAE > 3000)X WHERE X.RankNo =1 AND DDATE = ''' + ddstr + ''' ) B ';
        sql :=sql + ' ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) ';
        sql :=sql + '  Where A.STARTPRICE > ' + EDIT20.Text	 + ' AND B.UPGURAE > 0 and (A.HIGHPRICE - A.LOWPRICE)*100/nullif(A.PREPRICE1,0) > 10 AND B.yGurae * 0.001 *  B.xLowprice  > 500000 ';
        sql :=sql + Line60 + Line120 +  goodsql + ' AND A.DDATE = ''' + ddstr + '''';

        ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;
       // while NOT (FDQuery1.Eof) AND (FDQuery1.fieldvalues['UPDOWN'] > 7) do begin
       while NOT (FDQuery1.Eof)  do begin
            ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
            BuyPrice :=FormatFloat('#,###', FDQuery1.fieldvalues['xLowprice']);
            TGurae := FormatFloat('#.##', FDQuery1.fieldvalues['TGurae']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, strToint(edit16.text));
            DateGap := trim(EDIT16.TEXT);

            FDQuery2.Close;
            FDQuery2.SQL.Clear;
            sql3 := 'SELECT COUNT(*) AS UPCOUNT FROM (SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, DDATE,CCODE, LOWPRICE, GURAE, GURAE5, GURAE20 FROM ';
            sql3 := sql3 + ' DAILY_KOSP WHERE ddate <=''' + ddStr + ''' and ccode=''' + CCODE + ''') A WHERE A.ROW <= 120 ) X JOIN (select DDATE, CCODE, ENDPRICE, GURAE,GURAE5, GURAE20 from DAILY_KOSP ';
            sql3 := sql3 + ' where ddate=''' + ddStr + ''') Y ON X.CCODE =Y.CCODE WHERE X.GURAE > Y.GURAE5 * 6 AND X.LOWPRICE > Y.ENDPRICE * 1.3';
                                                                                                //(CASE WHEN Y.GURAE20 > Y.GURAE5 THEN Y.GURAE5 ELSE Y.GURAE20 END)
          //sql3 := ' SELECT X.DDATE,X.CCODE, SUM(X.FT) AS UPCOUNT, SUM(X.GT) AS DNCOUNT FROM(SELECT B.DDATE, C.CCODE, A.MainTitle, (CASE WHEN (B.DAY20 >= B.DAY60) THEN 1 ELSE -1 END) AS FT ';
          //sql3 := sql3 + ',(CASE WHEN (B.SUMTheme < B.DAY20) THEN -1 ELSE 1 END) AS GT FROM Theme_Stock A LEFT JOIN Theme_DATA B ON(A.MainTitle = B.MainTitle) INNER JOIN DAILY_KOSP C ON(A.CCODE=C.CCODE AND B.DDATE=C.DDATE) ';
          //sql3 := sql3 + ' WHERE C.CCODE ='''+ CCODE+ ''' AND B.DDATE =''' + ddStr + '''';
          //sql3 := sql3 + 'AND (CHARINDEX(''신규상장'', A.MainTitle) =0 AND CHARINDEX(''기업인수'', A.MainTitle) =0 )) X GROUP BY X.DDATE,X.CCODE';


            FDQuery2.Close;
            FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add(sql3);
            FDQuery2.Open;


            if FDQuery2.Eof then UPCOUNT :=0
            else begin
                UPCOUNT :=FDQuery2.fieldvalues['UPCOUNT'];
             //   DNCOUNT :=FDQuery2.fieldvalues['DNCOUNT'];
            end;


            if UPCOUNT > 0 then begin



                 sql4 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                 sql4 :=sql4 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                 sql4 :=sql4 + ' MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                 sql4 :=sql4 + ' DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

                 FDQuery3.Close;
                 FDQuery3.SQL.Clear;
                 FDQuery3.SQL.Add(sql4);
                 FDQuery3.Open;
                 ENDPRICE2 :=FDQuery3.fieldvalues['ENDPRICE2'];
                 ENDMAX :=FDQuery3.fieldvalues['ENDMAX'];
                 ENDMIN :=FDQuery3.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                   winc:=winc + 1;
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;


                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
                 if FDQuery1.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']) + '('+ BuyPrice +') - ' + TGurae)
                 ELSE  ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']) + '('+ BuyPrice +') - ' + TGurae, Pointer(clGreen));
                 LISTBOX3.Items.Add(copy(TRIM(FDQuery1.fieldvalues['UPDOWN']),0,5) + '%');
                 allc :=allc +1;
            end;
        FDQuery1.Next;
        end;

        StartDate :=IncDay(StartDate, 1);
        listbox7.Items.Add('----------');
        LISTBOX1.Items.Add('----------');
        ListBox2.Items.Add('----------');
        LISTBOX3.Items.Add('----------');
        LISTBOX4.Items.Add('----------');
   end;

   Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);
 // label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button18Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,DateGap: string;
   CCODE, ddStr, todayDate,goodsql : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if MessageDlg('보물1-1 종목?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   if RadioButton1.Checked then  RadioButton2.Checked := true;
   if checkbox3.Checked  then
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);


               sql := 'SELECT M.CCODE, M.COMPANY, M.ENDPRICE, M.SOSOK, M.BIGDATE FROM ( SELECT X.CCODE, X.COMPANY,X.SOSOK, ';
               sql := sql + ' (SELECT DDATE FROM (SELECT CCODE, DDATE, row_number()  OVER (PARTITION BY CCODE ORDER BY DDATE) AS ROW FROM DAILY_KOSP ';
               sql := sql + ' WHERE (ENDPRICE - DAY20) > 0 AND CCODE =X.CCODE AND DDATE BETWEEN X.DDATE AND  ''' + ddStr + ''' ) K WHERE K.ROW=1) AS BIGDATE, ';
               sql := sql + ' (SELECT ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) FROM DAILY_KOSP WHERE CCODE =X.CCODE AND DDATE = ''' + ddStr + ''') AS UPDOWN2, ';
               sql := sql + ' (SELECT ENDPRICE FROM DAILY_KOSP WHERE CCODE =X.CCODE AND DDATE = ''' + ddStr + ''' ) AS ENDPRICE ';
               sql := sql + ' FROM (SELECT A.DDATE,  B.COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ISNULL(ROUND((A.DAY20SUM/nullif((A.ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT ';
               sql := sql + ' FROM DAILY_KOSP A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE)  ';
               sql := sql + ' INNER JOIN (SELECT DDATE,CCODE, ENDPRICE, LOWPRICE, GURAE, GURAE5, GURAE20, DAY20, SSTART240 FROM  DAILY_KOSP) C ON( C.ddate <=A.DDATE AND A.CCODE =C.CCODE) ';
               sql := sql + ' WHERE A.STARTPRICE > ' + EDIT20.Text + ' AND A.DAY60 > 1000 AND A.SSTART240 > 240 AND A.DAY20COUNT < 20 -' + EDIT7.Text+ goodsql + ' AND C.SSTART240 > A.SSTART240 -140  ';
               sql := sql + ' AND C.GURAE > A.GURAE5 * 10 AND C.LOWPRICE > A.ENDPRICE * 1.3 AND ISNULL(ROUND((A.DAY20SUM/nullif((A.ENDPRICE-DAY20SUM),0)) * 100,2),0) < ' + edit12.Text ;
               sql := sql + ' AND A.DDATE BETWEEN CONVERT(varchar(16), DATEADD(DAY, -140 , CONVERT( DATETIME,  ''' + ddStr + ''' , 112)),112) AND ''' + ddStr + '''' ;
               sql := sql + ' GROUP BY A.DDATE, B.COMPANY, A.ENDPRICE, A.CCODE, A.SOSOK,  ISNULL(ROUND((A.DAY20SUM/nullif((A.ENDPRICE-DAY20SUM),0)) * 100,2),0), DAY20COUNT) X ';
               sql := sql + ' WHERE X.UPDOWN < -21 ) M WHERE M.BIGDATE = ''' + ddStr + ''' AND M.UPDOWN2 < 25 GROUP BY M.CCODE, M.ENDPRICE, M.COMPANY, M.SOSOK, M.BIGDATE ORDER BY M.CCODE ';
               //sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ';
               //sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
               //sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE  A.DDATE=''' + ddStr + ''' AND DAY60 > 1000 AND SSTART240 > 240 AND DAY20COUNT < 20 - ' + EDIT7.Text+ goodsql +') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.SOSOK, X.UPDOWN';


        ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;
        while NOT FDQuery1.Eof  do begin
            ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);
            DateGap := trim(EDIT16.TEXT);


                 sql4 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                 sql4 :=sql4 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                 sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                 sql4 :=sql4 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

                 FDQuery2.Close;
                 FDQuery2.SQL.Clear;
                 FDQuery2.SQL.Add(sql4);
                 FDQuery2.Open;
                 ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
                 ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
                 ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;
                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
                 if FDQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
                 ELSE  ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
             //    LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));
        FDQuery1.Next;
        end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

  label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');


end;

procedure TForm1.Button19Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd, dcc,allc, winc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   if PassButton <> 1 then begin
        if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
           exit;
   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;
  // fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  // eDate :=fDate;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
      //eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 and C.DEBTTOTAL <= C.SALEAMOUNT * 0.65 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin

   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT A.CCODE, A.DDATE, A.ENDPRICE, UPDOWN2, C.SOSOK, C.COMPANY, HIGHUP, T.UPGURAE FROM  ';
       sql := sql + ' (SELECT CCODE, DDATE, STARTPRICE,ENDPRICE,LOWPRICE, HIGHPRICE, GURAE, DAY20, ENDPRICE/DAY120 AS RISK, MAX240, PREUPDOWN1, PREUPDOWN2,ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, GURAE40, ';
       sql := sql + ' CASE WHEN ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) > 14 THEN CASE WHEN ISNULL(ROUND(((HIGHPRICE - PREPRICE1 )/nullif(PREPRICE1,0)) * 100,2),0) - ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) > 10 ';
       sql := sql + ' THEN 0 ELSE 1 END ELSE 0 END AS HIGHUP FROM DAILY_KOSP) A INNER JOIN (SELECT DDATE, CCODE, MAX(CAST(ALLTIME AS bigint))-MIN(CAST(ALLTIME AS bigint)) AS TIMEGAP,   ';
       sql := sql + ' ISNULL(ROUND((MAX(CAST(GURAE AS BIGINT))-MIN(CAST(GURAE AS BIGINT))) * 100 / nullif(MAX(CAST(GURAE AS BIGINT)),0),2),0) AS GURAEGAP, SUM(PLUSMINUS) AS PICK,    ';
       sql := sql + ' SUM(BEST) AS XBEST  FROM (SELECT DDATE, CCODE, ALLTIME, GURAE, SIGN(UPDOWNPRICE) AS PLUSMINUS, CASE WHEN STARTPRICE * CAST(GURAE AS bigint) * SIGN(UPDOWNPRICE) * 0.0001 >  ';
       sql := sql + ' CASE WHEN STARTPRICE < 10000 THEN 50000 ELSE 70000 END THEN 1  WHEN STARTPRICE * CAST(GURAE AS bigint) * SIGN(UPDOWNPRICE) * 0.0001 <   CASE WHEN STARTPRICE < 10000 THEN -50000  ELSE -100000 END THEN -1 ELSE 0 END AS BEST,  ';
       sql := sql + ' ROW_NUMBER() OVER (PARTITION BY DDATE, CCODE   ORDER BY DDATE, CCODE, GURAE DESC) AS RankNo FROM STOCK_MIN) X WHERE X.RankNo < 3  GROUP BY DDATE, CCODE) B ON(A.DDATE = B.DDATE AND A.CCODE =B.CCODE) ';
       sql := sql + ' INNER JOIN  (SELECT DDATE, CCODE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE FROM STOCK_MIN GROUP BY DDATE,CCODE) T ON(A.CCODE=T.CCODE AND A.DDATE = T.DDATE) ';
       sql := sql + ' INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) WHERE A.STARTPRICE >  ' + EDIT20.Text + ' AND A.GURAE > 500000 AND C.STOCKPROFIT > 0 '; //AND ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) < 14'; // AND B.DDATE ='20220418' ;
       sql := sql + ' AND A.GURAE > 4 * A.GURAE40  AND A.HIGHPRICE < A.MAX240 AND A.GURAE < 11 * T.UPGURAE AND B.PICK = 2 AND B.XBEST = 2 AND PREUPDOWN1 < 20 AND GURAEGAP < 50 AND TIMEGAP < 60 AND A.HIGHUP = 0 AND A.PREUPDOWN2 < 15 ';   // AND A.ENDPRICE > A.DAY20
       sql := sql + ' AND RISK < 1.33 AND B.DDATE =''' + ddStr + '''' ;                            // AND ISNULL(ROUND((A.HIGHPRICE - A.LOWPRICE) / nullif(A.STARTPRICE,0) * 100,2),0) > ' + EDIT14.Text +'

       sql := sql + ' '  ;
       sql := sql + Line60 + Line120 + goodsql;


       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


          sql2 :='SELECT  A.HIGHPRICE, A.LOWPRICE, A.STARTPRICE, A.ENDPRICE FROM STOCK_MIN A ';
          sql2 :=sql2 + ' INNER JOIN (SELECT DDATE, CCODE, MAX(GURAE) AS MAXGURAE FROM STOCK_MIN GROUP BY DDATE, CCODE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) ';
          sql2 :=sql2 + ' WHERE A.GURAE = B.MAXGURAE AND A.CCODE='''+ CCODE + ''' AND A.DDATE =''' + ddStr + '''' ;

          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql2);
          FDQuery2.Open;
          LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];

       //   myDate :=StartDate; // STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
       //   myDate := IncDay(myDate, strToint(EDIT16.TEXT));
          DateGap := trim(EDIT16.TEXT);

          sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
          sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
          sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
          ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
          ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
          ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

              if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 winc:=winc + 1;
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;

              listbox7.Items.Add(ddStr);
              LISTBOX1.Items.Add(CCODE);
            //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
              ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));
              allc :=allc +1;
          FDQuery1.Next;
       end;

       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

  Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);

  Screen.Cursor := crDefault;


  showmessage('완료');

end;

procedure TForm1.Button1Click(Sender: TObject);
var
   sql,sql2,sql3, sql4, DD,compTable,fDate,fToDay,DealRate, JISU_INFO : string;
   gubun : string;
begin
   RadioButton1.Caption :='10일'; RadioButton2.Caption :='20일'; RadioButton3.Caption :='40일'; RadioButton4.Caption :='60일';
   RadioButton5.Caption :='120일'; RadioButton6.Caption :='240일'; RadioButton9.Caption :='3년'; RadioButton7.Caption :='5년'; RadioButton8.Caption :='8년';

   Theme :=0;
   DBChart1.Legend.Visible :=true;
   DBChart1.Series[1].Visible := true; DBChart1.Series[2].Visible := true; DBChart1.Series[3].Visible := true; DBChart1.Series[4].Visible := true; DBChart1.Series[5].Visible := true; DBChart1.Series[6].Visible := true;

   DBChart3.Legend.Visible :=true;
   DBChart3.Series[1].Visible := true; DBChart3.Series[2].Visible := true; DBChart3.Series[3].Visible := true; DBChart3.Series[4].Visible := true; DBChart3.Series[5].Visible := true; DBChart3.Series[6].Visible := true;

   DBChart1.Series[0].Title	:='종가';
   DBChart1.Series[3].Title	:='최저가';
   DBChart1.Series[4].Title	:='20일';
   DBChart1.Series[5].Title	:='60일';

 //  DBChart3.Legend.Visible :=false;
   DBChart1.Series[0].Title	:='종가';
   DBChart3.Series[3].Title	:='최저가';
   DBChart3.Series[4].Title	:='20일';
   DBChart3.Series[5].Title	:='60일';

   DBChart1.Series[5].SeriesColor:= clYellow;
   DBChart1.Series[6].SeriesColor:= clAqua;
   DBChart3.Series[5].SeriesColor:= clYellow;
   DBChart3.Series[6].SeriesColor:= clAqua;

   minTime :=0;
   ScrollBar1.Position :=0;
   if RadioButton1.Checked then  DD:='10'
   else if RadioButton2.Checked then DD:='20'
   else if RadioButton3.Checked then DD:='40'
   else if RadioButton4.Checked then DD:='60'
   else if RadioButton5.Checked then DD:='120'
   else if RadioButton6.Checked then DD:='240'
   else if RadioButton9.Checked then DD:='620'
   else if RadioButton7.Checked then DD:='1228'
   else if RadioButton8.Checked then DD:='1970';

   fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

   BuyStop();



   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + trim(edit1.Text) +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin
      Listbox6.Clear;

      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];
     // memo2.Lines.Add(ADOQuery2.fieldvalues['COMPANY']);
      gubun  :=ADOQuery2.fieldvalues['sosok'];


      fToDay:= formatdatetime('YYYYMMDD',now);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      sql :='SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql := sql + ' ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) AS UPDOWN2, DDATE,DAY20, DAY60, DAY120, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, ';
      sql := sql + ' ISNULL(ROUND(((HIGHPRICE-PREPRICE1)/nullif(PREPRICE1,0)) * 100,2),0) AS HIGHRATE, ISNULL(ROUND(((LOWPRICE-PREPRICE1)/nullif(PREPRICE1,0)) * 100,2),0) AS LOWRATE, STARTPRICE,HIGHPRICE,LOWPRICE, ';
      sql := sql + ' ROUND((ENDPRICE - DAY20) * 0.01 / nullif(((DAY20)*0.01),0) * 100,2) AS DAY20RATE, ENDPRICE,PREPRICE1 FROM DAILY_KOSP WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND DDATE <=  ''' + fDate +''' ) A ';      // DDATE <= convert(varchar, getdate(), 112)
      sql := sql + ' WHERE A.ROW < ' + DD + ' and ddate <=''' +fDate + ''' order by ddate';
      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      sql2 :='Select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql2 := sql2 + ' ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) AS UPDOWN2, DDATE, DAY20, DAY60, DAY120, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT,';
      sql2 := sql2 + ' ISNULL(ROUND(((HIGHPRICE-PREPRICE1)/nullif(PREPRICE1,0)) * 100,2),0) AS HIGHRATE, ISNULL(ROUND(((LOWPRICE-PREPRICE1)/nullif(PREPRICE1,0)) * 100,2),0) AS LOWRATE, STARTPRICE,HIGHPRICE,LOWPRICE, ';
      sql2 := sql2 + ' ENDPRICE, PREPRICE1 FROM DAILY_KOSP WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND ';
      sql2 := sql2 + ' DDate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''' order by ddate';
      ADOQuery3.SQL.Add(sql2);
      ADOQuery3.Open;
      ADOQuery3.Last;
      ADOQuery3.Tag :=1;

      ADOQuery5.Close;
      ADOQuery5.SQL.Clear;
      sql3 :='SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql3 := sql3 + ' ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) AS UPDOWN2, DDATE,DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE,PREPRICE1 FROM DAILY_KOSP ';      // DDATE <= convert(varchar, getdate(), 112)
      sql3 := sql3 + ' WHERE  CCODE=''990408''  AND DDATE <=  ''' + fDate +''' ) A  WHERE A.ROW < ' + DD + ' and ddate <=''' +fDate + ''' order by ddate';
      ADOQuery5.SQL.Add(sql3);
      ADOQuery5.Open;
      ADOQuery5.Last;

      ADOQuery6.Close;
      ADOQuery6.SQL.Clear;
      sql4 :='Select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql4 := sql4 + ' ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0) AS UPDOWN2, DDATE, DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE,PREPRICE1 ';
      sql4 := sql4 + ' FROM DAILY_KOSP WHERE CCODE=''990408''  AND DDate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''' order by ddate';
      ADOQuery6.SQL.Add(sql4);
      ADOQuery6.Open;
      ADOQuery6.Last;
      ADOQuery6.Tag :=1;


      //   FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
      EDIT5.Text :=FormatFloat('#,###', ADOQuery1.fieldvalues['ENDPRICE'] );
//      EDIT6.Text :=FormatFloat('0.##',ADOQuery1.fieldvalues['UPDOWN'])+ '%';
      EDIT10.Text := FormatFloat('0.##', ADOQuery1.fieldvalues['HIGHRATE']) + '%'; //FormatFloat('0.00', (ADOQuery1.FieldByName('HIGHPRICE').AsInteger-ADOQuery1.FieldByName('PREPRICE1').AsInteger) / ADOQuery1.FieldByName('PREPRICE1').AsInteger * 100)+ '%';
      EDIT19.Text := FormatFloat('0.00', (ADOQuery1.FieldByName('LOWPRICE').AsInteger-ADOQuery1.FieldByName('PREPRICE1').AsInteger) / ADOQuery1.FieldByName('PREPRICE1').AsInteger * 100)+ '%';
      EDIT11.Text := FormatFloat('0.##', ADOQuery1.fieldvalues['UPDOWN2']) + '%';
      EDIT9.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['GURAE']);
    //  EDIT15.Text := FormatFloat('#,###', ADOQuery1.FieldByName('ENDPRICE').AsInteger - ADOQuery1.FieldByName('DAYGAP').AsInteger);
      EDIT15.Text := FormatFloat('0.00', (ADOQuery1.FieldByName('STARTPRICE').AsInteger-ADOQuery1.FieldByName('PREPRICE1').AsInteger) / ADOQuery1.FieldByName('PREPRICE1').AsInteger * 100)+ '%';
      if ADOQuery1.fieldvalues['GURAEWEIGHT'] <> null then EDIT6.Text :=FormatFloat('#,###', ADOQuery1.fieldvalues['GURAEWEIGHT']);
      label14.Caption	 := FormatFloat('#0.#0',ADOQuery1.fieldvalues['DAY20RATE']) + '%';
      label15.Caption	 := FormatFloat('#,#0,',ADOQuery1.fieldvalues['DAY20']);

      if ADOQuery5.fieldvalues['GURAEWEIGHT'] <> null then
        EDIT6.Text :=FormatFloat('#,###', ADOQuery5.fieldvalues['GURAEWEIGHT']);
     // listbox6.Items.Add(floatTostr(ADOQuery2.fieldvalues['UPDOWN']) + '%');
      listbox6.Items.Add(floatTostr(ADOQuery2.fieldvalues['ForeignRate']) + '%');
      listbox6.Items.Add(FormatFloat('#,',ADOQuery2.fieldvalues['SalesProfit']));
      listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['StockProfit']));
     // listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['DebtTotal']));
      listbox6.Items.Add(FormatFloat('#,#0',ADOQuery2.fieldvalues['SaleAmount']) + '('+FormatFloat('#,#0',ADOQuery2.fieldvalues['DebtTotal']) + ')');
      listbox6.Items.Add(FormatFloat('#0.#0',ADOQuery2.fieldvalues['PER']) + '('+FormatFloat('#0.#0',ADOQuery2.fieldvalues['PBR']) + ')');
      listbox6.Items.Add(FormatFloat('#0.#0',ADOQuery2.fieldvalues['ROE']) + '('+FormatFloat('#0.#0',ADOQuery2.fieldvalues['ROA']) + ')');
      comStockTotal := ADOQuery2.fieldvalues['TotalStock'];
      DealRate := floatTostr(ADOQuery2.fieldvalues['DealAmount']/comStockTotal*0.1);
      listbox6.Items.Add(FormatFloat('#,#0',comStockTotal));
      listbox6.Items.Add('(' + DealRate + '%)');
   end;

end;

procedure TForm1.Button20Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   if PassButton <> 1 then begin
        if MessageDlg('보물종목4  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
           exit;
   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6 AND C.PER >=0 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin

   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT B.DDATE, B.CCODE, CAST(B.CC AS CHAR(5)) + ''/'' + CAST(B.SS AS CHAR(5)) AS CC_AVG, C.COMPANY, D.GURAE, D.ENDPRICE, ROUND(DAYGAP / nullif(STARTPRICE,0),2) * 100 AS MAKEM, D.GURAE20 FROM ';
       sql := sql + ' (SELECT * FROM (SELECT DDATE, CCODE, COUNT(*) AS CC, ROUND(AVG(AA.MX),2) AS SS  FROM (SELECT DDATE, CCODE, STARTPRICE, ROUND(((convert(float,STARTPRICE) - LOWPRICE) * 1000 / nullif(STARTPRICE,0)),2) AS MX ';
       sql := sql + ' FROM STOCK_MIN) AA WHERE AA.MX > 4.5 AND AA.STARTPRICE > ' + EDIT20.Text  + ' GROUP BY DDATE, CCODE) BB WHERE BB.CC >= 40) B ';
       sql := sql + ' INNER JOIN Main_Comp C on(B.CCODE=C.CCODE) INNER JOIN (SELECT CCODE, DDATE, STARTPRICE, ENDPRICE, DAY20, DAY60, DAY120, GURAE,MAX240, SSTART240, DAYGAP, GURAE20 ';
       sql := sql + ' FROM DAILY_KOSP) D ON(B.DDATE = D.DDATE AND B.CCODE = D.CCODE) WHERE B.DDATE  =''' + ddStr + '''';
       sql := sql + ' AND D.ENDPRICE <= DAY20 AND D.ENDPRICE <= DAY60 AND D.ENDPRICE <= D.DAY120 AND DAY20  <= D.DAY60 AND D.DAY20  <= D.DAY120 AND D.GURAE > 200000 ';
       sql := sql + ' AND D.SSTART240 >=240 AND ROUND(DAYGAP / nullif(D.STARTPRICE,0),2) * 100 > -10 AND ROUND(DAYGAP / nullif(D.STARTPRICE,0),2) * 100 < 10 AND ROUND((D.MAX240 - D.ENDPRICE) * 100 / nullif(D.ENDPRICE,0),2) > 50 ';

       sql := sql + Line60 + Line120 + goodsql;
       sql := sql + '  ORDER BY DDATE, CC DESC,  SS DESC '  ;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


          sql2 :='SELECT  A.HIGHPRICE, A.LOWPRICE, A.STARTPRICE, A.ENDPRICE FROM STOCK_MIN A ';
          sql2 :=sql2 + ' INNER JOIN (SELECT DDATE, CCODE, MAX(GURAE) AS MAXGURAE FROM STOCK_MIN GROUP BY DDATE, CCODE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) ';
          sql2 :=sql2 + ' WHERE A.GURAE = B.MAXGURAE AND A.CCODE='''+ CCODE + ''' AND A.DDATE =''' + ddStr + '''' ;

          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql2);
          FDQuery2.Open;
          LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];

       //   myDate :=StartDate; // STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
       //   myDate := IncDay(myDate, strToint(EDIT16.TEXT));
          DateGap := trim(EDIT16.TEXT);

          sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
          sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
          sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
          ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
          ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
          ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

              if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;

              listbox7.Items.Add(ddStr);
              LISTBOX1.Items.Add(CCODE);
            //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
              ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['CC_AVG']));

          FDQuery1.Next;
       end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;



  Screen.Cursor := crDefault;


  showmessage('완료');






end;

procedure TForm1.Button21Click(Sender: TObject);
var
  SHTML,LnHTML,LnHTML2, URL,iSql, dSql: string ;
  i,j,k,M,cc,L, page:integer;
  HtmlMemo,HtmlMemo2: Tmemo;
  lastpage,Urlcode, MainTitle,MainCode, MainBigo, SubCode, SubBigo, ccode, Theme :string;

begin
    if PassButton <> 1 then begin
       if MessageDlg('테마정보 가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
       begin
           exit;
       end;
    end;
    HtmlMemo := TMemo.Create(Self);
    HtmlMemo.Parent := Self;
    HtmlMemo.Width :=2000;
    HtmlMemo.WordWrap:= true;
    HtmlMemo.Visible :=false;

    HtmlMemo2 := TMemo.Create(Self);
    HtmlMemo2.Parent := Self;
    HtmlMemo2.Width :=2000;
    HtmlMemo2.WordWrap:= true;
    HtmlMemo2.Visible :=false;
    cc:=0;

    URL:='https://finance.naver.com/sise/theme.naver?';
    SHTML:= GetHTML(URL);
    HtmlMemo.Text := SHTML;
    M := pos('">맨뒤', HtmlMemo.Text);
    L := SendMessage(HtmlMemo.Handle, EM_LINEFROMCHAR, M - 1, 0);
    page:= strToInt(GetData('page=', '">맨뒤', HtmlMemo.Lines[L]));

    ADOQuery2.close;
    ADOQuery2.sql.Clear;
    dSql :='delete from Theme_Stock'; // where Up_Date= ''' + formatdatetime('YY',today)+'-' + inttostr(WeekOfTheYear(today)) + ''''; //CONVERT(date,GETDATE())';
    ADOQuery2.sql.add(dSql);
    ADOQuery2.ExecSQL;


    for k := 1 to page do begin
        URL:='https://finance.naver.com/sise/theme.naver?&page='+inttostr(k);
        SHTML := GetHTML(URL);
        HtmlMemo.Text :=SHTML;

        for i:=0 to HtmlMemo.Lines.Count-1 do begin
              LnHTML :=HtmlMemo.Lines[i];
              if  pos('<TD class=col_type1><A href="', LnHTML) > 0 then begin
                  Urlcode:='https://finance.naver.com' +  StringReplace(GetData('<TD class=col_type1><A href="', '">', HtmlMemo.Lines[i]),'amp;','',[rfReplaceAll, rfIgnoreCase]);
                  SHTML := GetHTML(Urlcode);
                  MainCode := GetData('no=', '@', Urlcode +'@');
                  HtmlMemo2.Text :=SHTML;
                  MainTitle :='';

                  for J:=0 to HtmlMemo2.Lines.Count-1 do begin
                      LnHTML2 :=HtmlMemo2.Lines[j];
                      if  (pos('<STRONG class=info_title>', LnHTML2) > 0) and (MainTitle ='')  then begin
                             MainTitle:=GetData('<STRONG class=info_title>', '</STRONG>', HtmlMemo2.Lines[j]);
                             MainBigo:= GetData('<P class=info_txt>', '</P>', HtmlMemo2.Lines[j+1]);
                             if pos('</P>', HtmlMemo2.Lines[j+1]) = 0 then
                                MainBigo:= GetData('<P class=info_txt>', '</P>', HtmlMemo2.Lines[j+1]+HtmlMemo2.Lines[j+2]);

                             MainBigo := StringReplace(MainBigo,'''','"',[rfReplaceAll, rfIgnoreCase]);
                      end else if pos('<A href="/item/main.naver?code=', LnHTML2) > 0 then begin
                             SubCode:=GetData('<A href="/item/main.naver?code=', '">', LnHTML2);

                      end else if (pos('<P class=info_txt>', LnHTML2) > 0) and (SubCode <> '')  then begin
                            SubBigo:=GetData('<P class=info_txt>', '</P>', LnHTML2);
                            if pos('</P>', LnHTML2) = 0 then
                                SubBigo:= GetData('<P class=info_txt>', '</P>', HtmlMemo2.Lines[j]+HtmlMemo2.Lines[j+1]);

                            SubBigo := StringReplace(SubBigo,'amp;','',[rfReplaceAll, rfIgnoreCase]);
                            SubBigo := StringReplace(SubBigo,'''','"',[rfReplaceAll, rfIgnoreCase]);
                            ADOQuery2.close;
                            ADOQuery2.sql.Clear;
                         //   iSql := 'insert into Theme_Stock(ccode, MainCode, MainTitle, MainBigo, SubBigo, Up_Date) Values(''' + SubCode + ''','''+ MainCode + ''','''+ MainTitle + ''','''+ MainBigo+''','''+SubBigo +''',''' + formatdatetime('YY',today) +'-' + inttostr(WeekOfTheYear(today)) + ''')';
                            iSql := 'insert into Theme_Stock(ccode, MainCode, MainTitle, MainBigo, SubBigo, Up_Date) Values(''' + SubCode + ''','''+ MainCode + ''','''+ MainTitle + ''','''+ MainBigo+''','''+SubBigo +''', CONVERT(date,GETDATE()) )';
                            ADOQuery2.sql.add(iSql);
                            ADOQuery2.ExecSQL;
                            cc:=cc+1;
                            LABEL2.Caption :=intTostr(cc);
                            SubCode:='';
                      end;

                  end;

              end;
        end;
        HtmlMemo.Lines.Clear;
        HtmlMemo2.Lines.Clear;
    end;


    if PassButton <> 1 then begin
       showmessage('완료');
    end;

end;

procedure TForm1.Button22Click(Sender: TObject);
var
   sql,sql2, DD, mainitem,DateGap : string;
   CCODE, ddStr, todayDate: string;
   dcc : integer;
   THMFIRST,THMLAST, THMMIN,THMMAX, MINTHM : Double;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   Screen.Cursor := crHourglass;
   listbox9.Clear;
   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   if RadioButton1.Checked then  DD:='10'
   else if RadioButton2.Checked then DD:='20'
   else if RadioButton3.Checked then DD:='40'
   else if RadioButton4.Checked then DD:='60'
   else if RadioButton5.Checked then DD:='120'
   else if RadioButton6.Checked then DD:='240'
   else if RadioButton9.Checked then DD:='620'
   else if RadioButton7.Checked then DD:='1228'
   else if RadioButton8.Checked then DD:='1970';


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);


        sql :='SELECT TOP 15 X.MainTitle, X.DDATE, Y.MINTHM, X.AVGTheme FROM THEME_DATA X INNER JOIN ( SELECT MainTitle, MIN(SUMTheme) AS MINTHM, COUNT(MainTitle)  AS CC  ';
        sql :=sql + ' FROM (SELECT DDATE,MainTitle, row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE DESC) AS ROW, ';
        sql :=sql + ' SUMTheme FROM THEME_DATA WHERE  DDATE <= ''' + ddstr + '''  ) A  WHERE A.ROW <=240 GROUP BY MainTitle) Y ON(X.MainTitle = Y.MainTitle AND X.SUMTheme = Y.MINTHM) WHERE Y.CC >= 60 AND X.DDATE = ''' + ddstr + ''' ORDER BY MINTHM ';

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;

        if FDQuery1.Eof <> null then LISTBOX9.Items.AddObject('--   ' + formatdatetime('YYYY-MM-DD',StartDate) +#9+ '--'+#9, Pointer(clBlue));
        while NOT FDQuery1.Eof  do begin

           mainitem :=FDQuery1.fieldvalues['Maintitle'];
           MINTHM := FDQuery1.fieldvalues['MINTHM'];

           DateGap := trim(EDIT16.TEXT);
           LISTBOX9.Items.AddObject(mainitem +#9+ FormatFloat('0.##', MINTHM) + '% '+#9, Pointer(clRed));

           listbox7.Items.Add(ddStr);
           LISTBOX1.Items.Add('');
           LISTBOX2.Items.Add(mainitem);
           LISTBOX3.Items.Add(FormatFloat('0.##', FDQuery1.fieldvalues['AVGTheme']) + '% ');

                 sql2 :='SELECT TOP 1 FIRST_VALUE(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND '+ DateGap + ' FOLLOWING) as THMFIRST, ';
                 sql2 :=sql2 + ' LAST_VALUE(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND '+ DateGap + ' FOLLOWING) as THMLAST,';
                 sql2 :=sql2 + ' MIN(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS THMMIN,';
                 sql2 :=sql2 + ' MAX(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS THMMAX';
                 sql2 :=sql2 + ' FROM (SELECT DDATE,MainTitle, row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE) AS ROW, ';
                 sql2 :=sql2 + ' SUM(AVGTheme) OVER (PARTITION BY MainTitle ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 239 FOLLOWING) AS MinThm ';
                 sql2 :=sql2 + ' FROM THEME_DATA WHERE DDATE >= ''' + ddStr +''' AND MainTitle =''' + mainitem +''' ) A WHERE A.ROW <= ' + DateGap ;


                 FDQuery3.Close;
                 FDQuery3.SQL.Clear;
                 FDQuery3.SQL.Add(sql2);
                 FDQuery3.Open;
                 THMFIRST :=FDQuery3.fieldvalues['THMFIRST'];
                 THMLAST :=FDQuery3.fieldvalues['THMLAST'];
                 THMMAX :=FDQuery3.fieldvalues['THMMAX'];
                 THMMIN :=FDQuery3.fieldvalues['THMMIN'];

                 if THMMAX > THMFIRST then begin
                   listbox4.items.Add(FormatFloat('0.##', (THMMAX-THMFIRST)) + '%('+FormatFloat('0.##', (THMLAST-THMFIRST)) + '%)');
                 end else if THMMAX = THMFIRST then begin
                   listbox4.items.Add(FormatFloat('0.##', (THMLAST-THMFIRST)) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(THMFIRST-THMMIN)) + '%('+FormatFloat('0.##', (THMLAST-THMFIRST)) + '%)');
                 end;

           FDQuery1.Next;
        end;

        StartDate :=IncDay(StartDate, 1);
        listbox7.Items.Add('----------');
        LISTBOX1.Items.Add('----------');
        ListBox2.Items.Add('----------');
        LISTBOX3.Items.Add('----------');
        LISTBOX4.Items.Add('----------');
   end;

  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button23Click(Sender: TObject);
var
   sql,sql2,sql3, DD,MM, mainitem,ALLitem, DateGap : string;
   CCODE,COMPANY,CCC, ddStr, CurDate, todayDate: string;
   ENDPRICE,ENDPRICE2, DAY20, ENDMIN,ENDMAX,ADDPRICE : integer;
   dcc,allc, winc : integer;
   THMFIRST,THMLAST, THMMIN,THMMAX, MINTHM : Double;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   Screen.Cursor := crHourglass;
   listbox9.Clear;

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
        ddStr := formatdatetime('YYYYMMDD',StartDate);
        CurDate := formatdatetime('YYYYMMDD',IncDay(StartDate, -30));


        sql :='SELECT * FROM (SELECT DATEPART(YYYY, Y.DDATE) AS YYYY, DATEPART(MONTH, Y.DDATE) AS MM,  MAINTITLE,  ';
        sql :=sql + ' row_number() OVER (PARTITION BY DATEPART(YYYY, Y.DDATE), DATEPART(MONTH, Y.DDATE) ORDER BY COUNT(MAINTITLE) DESC ) AS RowM, ';
        sql :=sql + ' COUNT(MAINTITLE) AS CC FROM (SELECT  DDATE, MAINTITLE, AVGTheme, row_number() OVER (PARTITION BY DDATE ORDER BY AVGTheme DESC) AS RowNum ';
        sql :=sql + ' FROM (SELECT A.DDATE, B.MAINTITLE,AVG(ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0)) AS AVGTheme  ';
        sql :=sql + ' FROM DAILY_KOSP A INNER JOIN Theme_Stock B on(A.ccode =B.CCODE) WHERE A.GURAE > 0 AND CHARINDEX(''신규상장'', B.MainTitle) =0  ';
        sql :=sql + ' GROUP BY A.DDATE, B.MainTitle) X) Y WHERE Y.RowNum <= 5 AND Y.DDATE BETWEEN ''' + CurDate + ''' AND ''' + ddstr + '''';
        sql :=sql + ' GROUP BY DATEPART(YYYY, Y.DDATE), DATEPART(MONTH, Y.DDATE), MAINTITLE )Z WHERE Z.RowM <=5 ORDER BY YYYY,CC DESC, MM DESC,  RowM ';

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;



        if FDQuery1.Eof <> null then  LISTBOX9.Items.AddObject('--   ' + formatdatetime('YYYY-MM-DD',StartDate) +#9+ '--'+#9, Pointer(clBlue));

        while NOT FDQuery1.Eof  do begin
           mainitem :=FDQuery1.fieldvalues['Maintitle'];
           MINTHM := FDQuery1.fieldvalues['CC'];
           MM := FDQuery1.fieldvalues['MM'];
           LISTBOX9.Items.AddObject(MM +'월: '+ mainitem +#9+ FormatFloat('#0', MINTHM) + ' '+#9, Pointer(clRed));
           ALLitem :=  mainitem + ''',''';
           FDQuery1.Next;

        end;

        sql2 :='SELECT S.CCODE, W.COMPANY, S.CCC, W.SOSOK FROM (SELECT CCODE, COUNT(*) AS CCC FROM THEME_STOCK WHERE MainTitle IN (SELECT MainTitle FROM (SELECT DATEPART(YYYY, Y.DDATE) AS YYYY,  MAINTITLE,  ';             // DATEPART(MONTH, Y.DDATE) AS MM,
        sql2 :=sql2 + ' row_number() OVER (PARTITION BY DATEPART(YYYY, Y.DDATE) ORDER BY COUNT(MAINTITLE) DESC ) AS RowM, ';                            //, DATEPART(MONTH, Y.DDATE)
        sql2 :=sql2 + ' COUNT(MAINTITLE) AS CC FROM (SELECT  DDATE, MAINTITLE, AVGTheme, row_number() OVER (PARTITION BY DDATE ORDER BY AVGTheme DESC) AS RowNum ';
        sql2 :=sql2 + ' FROM (SELECT A.DDATE, B.MAINTITLE,AVG(ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0)) AS AVGTheme  ';
        sql2 :=sql2 + ' FROM DAILY_KOSP A INNER JOIN Theme_Stock B on(A.ccode =B.CCODE) WHERE A.GURAE > 0 AND CHARINDEX(''신규상장'', B.MainTitle) =0  ';
        sql2 :=sql2 + ' GROUP BY A.DDATE, B.MainTitle) X) Y WHERE Y.RowNum <= 7 AND Y.DDATE BETWEEN ''' + CurDate + ''' AND ''' + ddstr + '''';
        sql2 :=sql2 + ' GROUP BY DATEPART(YYYY, Y.DDATE),  MAINTITLE )Z WHERE Z.CC >=3 ) GROUP BY CCODE) S INNER JOIN MAIN_COMP W ON(S.CCODE=W.CCODE)  WHERE S.CCC > 1 ORDER BY W.COMPANY';      //DATEPART(MONTH, Y.DDATE),

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql2);
        FDQuery1.Open;

        while NOT FDQuery1.Eof  do begin

           CCODE :=FDQuery1.fieldvalues['CCODE'];
           COMPANY := FDQuery1.fieldvalues['COMPANY'];
           CCC := FDQuery1.fieldvalues['CCC'];

           DateGap := trim(EDIT16.TEXT);


                 sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                 sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                 sql3 :=sql3 + ' MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, ENDPRICE,GURAE,DAY20, SOSOK,  ';
                 sql3 :=sql3 + ' ROUND(ISNULL(DAYGAP*100/NULLIF(PREPRICE1,0),0),2) AS UPDOWN2 FROM DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

                 FDQuery3.Close;
                 FDQuery3.SQL.Clear;
                 FDQuery3.SQL.Add(sql3);
                 FDQuery3.Open;
                 while NOT FDQuery3.Eof  do begin
                    ENDPRICE :=FDQuery3.fieldvalues['ENDPRICE'];
                    DAY20 :=FDQuery3.fieldvalues['DAY20'];

                    if (ENDPRICE > 2500) AND (ENDPRICE > DAY20) then begin

                        listbox7.Items.Add(ddStr);
                        LISTBOX1.Items.Add(CCODE);
                        LISTBOX2.Items.Add(COMPANY);
                       // LISTBOX3.Items.Add(CCC);
                        LISTBOX3.Items.Add(FormatFloat('0.##', FDQuery3.fieldvalues['UPDOWN2']) + '%');


                        ENDPRICE2 :=FDQuery3.fieldvalues['ENDPRICE2'];
                        ENDMAX :=FDQuery3.fieldvalues['ENDMAX'];
                        ENDMIN :=FDQuery3.fieldvalues['ENDMIN'];

                        if ENDMAX > ENDPRICE then begin
                           listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                           winc:=winc + 1;
                        end else if ENDMAX = ENDPRICE then begin
                           listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                        end else begin
                           listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                        end;
                    end;

                    allc :=allc +1;
                    FDQuery3.Next;
                 end;
            //     if FDQuery1.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
            //     ELSE  ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']) + TGurae, Pointer(clGreen));
            //     LISTBOX3.Items.Add(copy(TRIM(FDQuery1.fieldvalues['UPDOWN']),0,5) + '%');

          FDQuery1.Next;
        end;


        StartDate :=IncDay(StartDate, 1);
        listbox7.Items.Add('----------');
        LISTBOX1.Items.Add('----------');
        ListBox2.Items.Add('----------');
        LISTBOX3.Items.Add('----------');
        LISTBOX4.Items.Add('----------');


        StartDate :=IncDay(StartDate, 1);

   end;

   Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);
   Screen.Cursor := crDefault;

   showmessage('완료');

end;

procedure TForm1.Button24Click(Sender: TObject);
var
   sql,sql2, DD, mainitem,DateGap : string;
   CCODE, ddStr, todayDate: string;
   dcc : integer;
   THMFIRST,THMLAST, THMMIN,THMMAX, MINTHM : Double;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   Screen.Cursor := crHourglass;
   listbox9.Clear;
   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);


        sql :='SELECT A.DDATE, A.MainTitle, AVGTHEME,SUMTHEME, ROW FROM(SELECT DDATE, MainTitle, AVGTHEME, SUMTHEME, DAY20, DAY60, DAY120  ';
        sql :=sql + ' ,row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE DESC) AS ROW ,LEAD (DAY20) OVER(PARTITION BY MainTitle ORDER BY DDATE DESC ) AS PREDAY20 ';
        sql :=sql + ' ,LEAD (DAY60) OVER(PARTITION BY MainTitle ORDER BY DDATE DESC ) AS PREDAY60 ';
        sql :=sql + ' FROM Theme_DATA  WHERE (CHARINDEX(''신규상장'', MainTitle) =0 AND CHARINDEX(''기업인수'', MainTitle) =0 ) AND DDATE <=''' + ddstr + ''' ) A WHERE ROW=1 AND A.DAY20 >= A.DAY60 AND A.PREDAY20 <= A.PREDAY60  ORDER BY DDATE DESC ';

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;

        if FDQuery1.Eof <> null then LISTBOX9.Items.AddObject('--   ' + formatdatetime('YYYY-MM-DD',StartDate) +#9+ '--'+#9, Pointer(clBlue));
        while NOT FDQuery1.Eof  do begin

           mainitem :=FDQuery1.fieldvalues['Maintitle'];
           MINTHM := FDQuery1.fieldvalues['SUMTHEME'];

           DateGap := trim(EDIT16.TEXT);
           LISTBOX9.Items.AddObject(mainitem +#9+ FormatFloat('0.##', MINTHM) + '% '+#9, Pointer(clRed));

           listbox7.Items.Add(ddStr);
           LISTBOX1.Items.Add('');
           LISTBOX2.Items.Add(mainitem);
           LISTBOX3.Items.Add(FormatFloat('0.##', FDQuery1.fieldvalues['AVGTheme']) + '% ');

                 sql2 :='SELECT TOP 1 FIRST_VALUE(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND '+ DateGap + ' FOLLOWING) as THMFIRST, ';
                 sql2 :=sql2 + ' LAST_VALUE(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND '+ DateGap + ' FOLLOWING) as THMLAST,';
                 sql2 :=sql2 + ' MIN(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS THMMIN,';
                 sql2 :=sql2 + ' MAX(MinThm) OVER(PARTITION BY MainTitle ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS THMMAX';
                 sql2 :=sql2 + ' FROM (SELECT DDATE,MainTitle, row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE) AS ROW, ';
                 sql2 :=sql2 + ' SUMTheme AS MinThm FROM THEME_DATA WHERE DDATE >= ''' + ddStr +''' AND MainTitle =''' + mainitem +''' ) A WHERE A.ROW <= ' + DateGap ;


                 FDQuery3.Close;
                 FDQuery3.SQL.Clear;
                 FDQuery3.SQL.Add(sql2);
                 FDQuery3.Open;
                 if FDQuery3.Eof then begin
                    showmessage('전체를 선택하고 태마주를 정리해주세요');
                    exit;
                 end;

                 THMFIRST :=FDQuery3.fieldvalues['THMFIRST'];
                 THMLAST :=FDQuery3.fieldvalues['THMLAST'];
                 THMMAX :=FDQuery3.fieldvalues['THMMAX'];
                 THMMIN :=FDQuery3.fieldvalues['THMMIN'];

                 if THMMAX > THMFIRST then begin
                   listbox4.items.Add(FormatFloat('0.##', (THMMAX-THMFIRST)*100/THMFIRST) + '%('+FormatFloat('0.##', (THMLAST-THMFIRST)*100/THMFIRST) + '%)');
                 end else if THMMAX = THMFIRST then begin
                   listbox4.items.Add(FormatFloat('0.##', (THMLAST-THMFIRST)*100/THMFIRST) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(THMFIRST-THMMIN)*100/THMFIRST) + '%('+FormatFloat('0.##', (THMLAST-THMFIRST)*100/THMFIRST) + '%)');
                 end;

           FDQuery1.Next;
        end;

        StartDate :=IncDay(StartDate, 1);
        listbox7.Items.Add('----------');
        LISTBOX1.Items.Add('----------');
        ListBox2.Items.Add('----------');
        LISTBOX3.Items.Add('----------');
        LISTBOX4.Items.Add('----------');
   end;

  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button25Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd, dcc, allc, winc : integer;
   ENDPRICE,ENDPRICE2, UPCOUNT,DNCOUNT, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

//   if PassButton <> 1 then begin
//        if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
//           exit;
//   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   winc :=0; allc:=0;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
      //eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 ' ; //and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin

   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT B.CCODE, B.DDATE, B.SOSOK, C.COMPANY, B.ENDPRICE, ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' FROM (SELECT CCODE, DDATE, SUM(GURAE) AS TGURAE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
       sql := sql + ' FROM STOCK_MIN WHERE DDATE=''' + ddStr + '''  GROUP BY CCODE,DDATE) A INNER JOIN DAILY_KOSP B ';
       sql := sql + ' ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE)  INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) ';
       sql := sql + ' WHERE B.STARTPRICE > ' + EDIT20.Text + ' AND A.TGURAE > 500000 AND A.UPGURAE > 1 AND A.TGURAE < 11 * A.UPGURAE AND A.TGURAE > 4 * B.GURAE40' ;
       sql := sql + ' AND ISNULL(ROUND(((B.DAYGAP)/nullif(B.PREPRICE1,0)) * 100,2),0) < 15 ';// + EDIT14.Text ;
    //   sql := sql + ' AND B.ENDPRICE < B.MAX240 AND B.ENDPRICE > B.DAY20 '  ;
    //   sql := sql + Line60 + Line120
        sql := sql + goodsql;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


       //   sql2 :='SELECT  A.HIGHPRICE, A.LOWPRICE, A.STARTPRICE, A.ENDPRICE FROM STOCK_MIN A ';
       //   sql2 :=sql2 + ' INNER JOIN (SELECT DDATE, CCODE, MAX(GURAE) AS MAXGURAE FROM STOCK_MIN GROUP BY DDATE, CCODE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) ';
       //   sql2 :=sql2 + ' WHERE A.GURAE = B.MAXGURAE AND A.CCODE='''+ CCODE + ''' AND A.DDATE =''' + ddStr + '''' ;




          sql3 := ' SELECT X.DDATE,X.CCODE, SUM(X.FT) AS UPCOUNT, SUM(X.GT) AS DNCOUNT FROM(SELECT B.DDATE, C.CCODE, A.MainTitle, (CASE WHEN (B.DAY20 >= B.DAY60) THEN 1 ELSE -1 END) AS FT ';
          sql3 := sql3 + ',(CASE WHEN (B.SUMTheme < B.DAY20) THEN -1 ELSE 1 END) AS GT FROM Theme_Stock A LEFT JOIN Theme_DATA B ON(A.MainTitle = B.MainTitle) INNER JOIN DAILY_KOSP C ON(A.CCODE=C.CCODE AND B.DDATE=C.DDATE) ';
          sql3 := sql3 + ' WHERE C.CCODE ='''+ CCODE+ ''' AND B.DDATE =''' + ddStr + '''';
          sql3 := sql3 + 'AND (CHARINDEX(''신규상장'', A.MainTitle) =0 AND CHARINDEX(''기업인수'', A.MainTitle) =0 )) X GROUP BY X.DDATE,X.CCODE';


          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
  //        LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];

          if FDQuery2.Eof then UPCOUNT :=0
          else begin
               UPCOUNT :=FDQuery2.fieldvalues['UPCOUNT'];
               DNCOUNT :=FDQuery2.fieldvalues['DNCOUNT'];
          end;


          DateGap := trim(EDIT16.TEXT);

          if (UPCOUNT >= 0) AND (DNCOUNT >= 0)  then begin


                sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(sql3);
                FDQuery2.Open;
                ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
                ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
                ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 winc:=winc + 1;
               end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
               end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
               end;

                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
                 LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));

               allc :=allc +1;
           //   IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
           //   ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
                LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));
          end;


          FDQuery1.Next;
       end;


       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

   Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);

  Screen.Cursor := crDefault;


  showmessage('완료');


end;

procedure TForm1.Button26Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd,UPCOUNT, dcc,allc, winc : integer;
   ENDPRICE,DNCOUNT, ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

//   if PassButton <> 1 then begin
//        if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
//           exit;
//   end;

   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;
  // fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  // eDate :=fDate;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
      //eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 '; //and C.DEBTTOTAL <= C.SALEAMOUNT * 0.65 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin

   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT A.CCODE, A.DDATE, A.ENDPRICE, UPDOWN2, C.SOSOK, C.COMPANY, B.UPGURAE,GURAEGAP,GURAE,TIMEGAP,MINMAX,UPGURAE,DOWNX,PICK FROM   ';
       sql := sql + ' (SELECT CCODE, DDATE, STARTPRICE,ENDPRICE,LOWPRICE, HIGHPRICE, GURAE, DAY20, ENDPRICE/DAY120 AS RISK, MAX240, PREUPDOWN1, PREUPDOWN2,ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2,';
       sql := sql + ' GURAE40 FROM DAILY_KOSP) A';
       sql := sql + ' INNER JOIN (SELECT DDATE, CCODE, ABS(CAST(RIGHT(ALLTIMEA,4) AS bigint)-CAST(RIGHT(ALLTIMEB,4) AS bigint)) AS TIMEGAP, UPGURAE ';
       sql := sql + ' ,ISNULL(ROUND((CAST(FMXGURAE AS BIGINT)- CAST(SMXGURAE AS BIGINT)) * 100 / nullif(CAST(FMXGURAE AS BIGINT),0),2),0) AS GURAEGAP,  ';
       sql := sql + ' CAST(FMXGURAE AS BIGINT) * 0.8 - ABS(CAST(MINMAX AS BIGINT))  AS DOWNX, MINMAX, PICK FROM  (SELECT DDATE, CCODE, ALLTIME, CAST(GURAE AS BIGINT) AS GURAE, SIGN(UPDOWNPRICE) AS PLUSMINUS, ';
       sql := sql + ' ROW_NUMBER() OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, GURAE DESC) AS RankNo, FIRST_VALUE(GURAE) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, GURAE DESC) AS FMXGURAE,  ';
       sql := sql + ' LEAD(GURAE,1) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, GURAE DESC) AS SMXGURAE, FIRST_VALUE(ALLTIME) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, GURAE DESC) AS ALLTIMEA, ';
       sql := sql + ' LEAD(ALLTIME,1) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, GURAE DESC) AS ALLTIMEB,  MIN(CAST(GURAE AS BIGINT) * SIGN(UPDOWNPRICE)) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS MINMAX, ';
       sql := sql + ' SUM(GURAE * SIGN(UPDOWNPRICE)) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS UPGURAE,';
       sql := sql + ' SUM(SIGN(UPDOWNPRICE)) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS PICK FROM STOCK_MIN WHERE GURAE > 3000) X  WHERE X.RankNo = 1 ) B ON(A.DDATE = B.DDATE AND A.CCODE =B.CCODE)  ';
       sql := sql + ' INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) WHERE A.STARTPRICE >  2000 AND A.GURAE > 500000 ';
       sql := sql + ' AND A.GURAE > 3.8 * A.GURAE40  AND A.GURAE < 11.1 * B.UPGURAE AND PREUPDOWN1 < 20 AND GURAEGAP < 50 AND TIMEGAP < 75 AND A.ENDPRICE > A.DAY20 AND DOWNX > 0 AND PICK > 0';    //AND A.PREUPDOWN2 < 15   AND B.XBEST = 2
     //  sql := sql + ' AND RISK < 1.33
       sql := sql + ' AND B.DDATE =''' + ddStr + '''' ;

       sql := sql + goodsql;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


          sql3 := ' SELECT X.DDATE,X.CCODE, SUM(X.FT) AS UPCOUNT, SUM(X.GT) AS DNCOUNT FROM(SELECT B.DDATE, C.CCODE, A.MainTitle, (CASE WHEN (B.DAY20 >= B.DAY60) THEN 1 ELSE -1 END) AS FT ';
          sql3 := sql3 + ',(CASE WHEN (B.SUMTheme < B.DAY20) THEN -1 ELSE 1 END) AS GT FROM Theme_Stock A LEFT JOIN Theme_DATA B ON(A.MainTitle = B.MainTitle) INNER JOIN DAILY_KOSP C ON(A.CCODE=C.CCODE AND B.DDATE=C.DDATE) ';
          sql3 := sql3 + ' WHERE C.CCODE ='''+ CCODE+ ''' AND B.DDATE =''' + ddStr + '''';
          sql3 := sql3 + 'AND (CHARINDEX(''신규상장'', A.MainTitle) =0 AND CHARINDEX(''기업인수'', A.MainTitle) =0 )) X GROUP BY X.DDATE,X.CCODE';


          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add(sql3);
          FDQuery2.Open;
  //        LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];

          if FDQuery2.Eof then UPCOUNT :=0
          else begin
               UPCOUNT :=FDQuery2.fieldvalues['UPCOUNT'];
               DNCOUNT :=FDQuery2.fieldvalues['DNCOUNT'];
          end;


          DateGap := trim(EDIT16.TEXT);

          if (UPCOUNT >= 0) AND (DNCOUNT >= 0)  then begin

               DateGap := trim(EDIT16.TEXT);

               sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
               sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
               sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
               sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
               FDQuery2.Close;
               FDQuery2.SQL.Clear;
               FDQuery2.SQL.Add(sql3);
               FDQuery2.Open;
               ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
               ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
               ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

               if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 winc:=winc + 1;
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;

              listbox7.Items.Add(ddStr);
              LISTBOX1.Items.Add(CCODE);
              LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
            //  IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
            //  ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));
              allc :=allc +1;
          end;
              FDQuery1.Next;
       end;

       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

  Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);

  Screen.Cursor := crDefault;


  showmessage('완료');

end;

procedure TForm1.Button27Click(Sender: TObject);
var
fDate : string;
begin
       fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);
       Theme_SUM(0);
       CHART_FLOW_INSERT(fDate);

end;

procedure TForm1.Button28Click(Sender: TObject);
var
   sql,sql2,sql3, DD,MM, mainitem,ALLitem, DateGap, MXRATE, BUYPRICE : string;
   CCODE,COMPANY,CCC, ddStr, CurDate, todayDate: string;
   ENDPRICE,ENDPRICE2, DAY20, ENDMIN,ENDMAX,ADDPRICE : integer;
   dcc,allc, winc : integer;
   THMFIRST,THMLAST, THMMIN,THMMAX, MINTHM : Double;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   Screen.Cursor := crHourglass;
   listbox9.Clear;

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
        ddStr := formatdatetime('YYYYMMDD',StartDate);
        CurDate := formatdatetime('YYYYMMDD',IncDay(StartDate, -30));

        sql :='SELECT A.*, B.ENDPRICE,C.COMPANY FROM (SELECT DDATE, CCODE, FIRST_VALUE(MXRATE) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS MXRATE ';
        sql :=sql + ' , row_number() OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE) AS ROW, FIRST_VALUE(BUYPRICE) OVER (PARTITION BY DDATE, CCODE ORDER BY DDATE, CCODE, BUYPRICE DESC ) AS BUYPRICE';
        sql :=sql + ' FROM MIN_TD_TEMP WHERE NOUSE = 0 ) A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE =B.DDATE) INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) WHERE ROW=1 AND A.DDATE=''' + ddstr + '''';


        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;

        while NOT FDQuery1.Eof  do begin
            ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
            MXRATE :=TRIM(FDQuery1.fieldvalues['MXRATE']);
            BUYPRICE :=TRIM(FDQuery1.fieldvalues['BUYPRICE']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);
            DateGap := trim(EDIT16.TEXT);


                 sql2 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                 sql2 :=sql2 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                 sql2 :=sql2 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                 sql2 :=sql2 +  'DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

                 FDQuery2.Close;
                 FDQuery2.SQL.Clear;
                 FDQuery2.SQL.Add(sql2);
                 FDQuery2.Open;
                 ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
                 ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
                 ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;
                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
             //   LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
                 if FDQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY'])+'(' + BUYPRICE + ')')
                 ELSE  ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY'])+'(' + BUYPRICE + ')', Pointer(clGreen));
                 LISTBOX3.Items.Add(MXRATE + '%');

        FDQuery1.Next;
        end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

 // label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button29Click(Sender: TObject);
var
   sql,fDate,eDate,ddStr : string;
   cc : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if PassButton <> 1 then begin
        if MessageDlg('분당데이터 지우기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
           exit;
   end;

   Screen.Cursor := crHourglass;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
   cc:=0;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'DELETE FROM STOCK_MIN WHERE DDATE=''' + ddStr + '''';

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.ExecSQL;

       cc := cc+1;
       LABEL2.Caption :=inttostr(cc);
       StartDate :=IncDay(StartDate, 1);
   end;

   Screen.Cursor := crDefault;
   showmessage('완료');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql : string;
   CCODE, ddStr, todayDate : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   StartDate, EndDate : TDate;
begin
   if MessageDlg('급등종목  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   if checkbox3.Checked  then
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6 ';


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);

       sql := 'SELECT * FROM (select B.COMPANY, A.DDATE DDATE, A.CCODE AS CCODE,A.DAY60 AS DAY60,DAY10, STARTPRICE, A.GURAE AS GURAE,A.ENDPRICE, ';
       sql := sql + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN, round(A.Gurae/nullif(A.GURAE40,0),2) AS GRATE, A.SOSOK ';
       sql := sql + ' from ' + compTable1 + '  A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE A.DAY60 > 1500 AND A.PREUPDOWN1 < 5 AND A.PREUPDOWN2 < 5 ' + goodsql +') X ';     //AND A.PREUPDOWN1 < 9 AND A.PREUPDOWN2 < 9
       sql := sql + ' WHERE X.GURAE > 500000 AND X.DDATE =''' + ddStr + ''' AND X.STARTPRICE < X.ENDPRICE AND X.GRATE > ' + EDIT13.Text + ' AND X.UPDOWN > 3 and X.UPDOWN < 20 order by X.SOSOK, X.UPDOWN  ';


       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
          sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
          sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN, SOSOK FROM ';
          sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + ddStr + ''' and '''+ todayDate +'''';
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

              listbox7.Items.Add(ddStr);
              LISTBOX1.Items.Add(CCODE);
            //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clBlack))
              ELSE ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));

          FDQuery1.Next;
       end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;


  label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');
end;

procedure TForm1.Button30Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE, DateGap : string;
   CCODE, ddStr, todayDate,Line60, Line120 : string;
   dd, dcc, allc, winc : integer;
   ENDPRICE,ENDPRICE2, UPCOUNT,DNCOUNT, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

//   if PassButton <> 1 then begin
//        if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
//           exit;
//   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   winc :=0; allc:=0;
   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;
      //eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
   if checkbox3.Checked  then
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 ' ; //and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6 ';
   Line60:='';
   if checkbox2.Checked  then  Line60 :=' AND (B.ENDPRICE >= B.DAY60) ';
   Line120:='';
   if checkbox8.Checked  then  Line120 :=' AND(B.ENDPRICE >= B.DAY120) ';

 //  todayDate := formatdatetime('YYYYMMDD',now);
//   for dd := strToint(fDate) to strToint(eDate) do begin

   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT B.CCODE, B.DDATE, B.SOSOK, C.COMPANY, B.ENDPRICE, ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' FROM (SELECT CCODE, DDATE, SUM(GURAE) AS TGURAE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
       sql := sql + ' FROM STOCK_MIN WHERE DDATE=''' + ddStr + '''  GROUP BY CCODE,DDATE) A INNER JOIN DAILY_KOSP B ';
       sql := sql + ' ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE)  INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) ';
       sql := sql + ' WHERE B.STARTPRICE > ' + EDIT20.Text + ' AND A.TGURAE > 500000 AND A.UPGURAE > 1 AND A.TGURAE < 11 * A.UPGURAE AND A.TGURAE > 4 * B.GURAE40' ;
       sql := sql + ' AND ISNULL(ROUND(((B.DAYGAP)/nullif(B.PREPRICE1,0)) * 100,2),0) < 15 ';// + EDIT14.Text ;
    //   sql := sql + ' AND B.ENDPRICE < B.MAX240 AND B.ENDPRICE > B.DAY20 '  ;
    //   sql := sql + Line60 + Line120
        sql := sql + goodsql;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
          ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
          CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);


//          sql3 := ' SELECT X.DDATE,X.CCODE, SUM(X.FT) AS UPCOUNT, SUM(X.GT) AS DNCOUNT FROM(SELECT B.DDATE, C.CCODE, A.MainTitle, (CASE WHEN (B.DAY20 >= B.DAY60) THEN 1 ELSE -1 END) AS FT ';
//          sql3 := sql3 + ',(CASE WHEN (B.SUMTheme < B.DAY20) THEN -1 ELSE 1 END) AS GT FROM Theme_Stock A LEFT JOIN Theme_DATA B ON(A.MainTitle = B.MainTitle) INNER JOIN DAILY_KOSP C ON(A.CCODE=C.CCODE AND B.DDATE=C.DDATE) ';
//          sql3 := sql3 + ' WHERE C.CCODE ='''+ CCODE+ ''' AND B.DDATE =''' + ddStr + '''';
//          sql3 := sql3 + 'AND (CHARINDEX(''신규상장'', A.MainTitle) =0 AND CHARINDEX(''기업인수'', A.MainTitle) =0 )) X GROUP BY X.DDATE,X.CCODE';
//
//
//          FDQuery2.Close;
//          FDQuery2.SQL.Clear;
//          FDQuery2.SQL.Add(sql3);
//          FDQuery2.Open;
//  //        LOWPRICE :=FDQuery2.fieldvalues['LOWPRICE'];
//
//          if FDQuery2.Eof then UPCOUNT :=0
//          else begin
//               UPCOUNT :=FDQuery2.fieldvalues['UPCOUNT'];
//               DNCOUNT :=FDQuery2.fieldvalues['DNCOUNT'];
//          end;


          DateGap := trim(EDIT16.TEXT);

//          if (UPCOUNT >= 0) AND (DNCOUNT >= 0)  then begin


                sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(sql3);
                FDQuery2.Open;
                ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
                ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
                ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                if ENDMAX > ENDPRICE then begin
                // ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 winc:=winc + 1;
               end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
               end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
               end;

                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
                 LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));

               allc :=allc +1;
           //   IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
           //   ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
                LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));


                FDQuery1.Next;
      end;



 //      end;


       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

   Label2.Caption	 :=   FormatFloat('0.##', WINC/ALLC * 100) + '%' + INTTOSTR(WINC)+'/' + INTTOSTR(ALLC);

  Screen.Cursor := crDefault;


  showmessage('완료');

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql, dSql: string ;
  i,j,k,M,cc,L, page:integer;
  HtmlMemo : Tmemo;
  ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, DebtTotal,SalesProfit,RESERVE_RATIO, PROPERTY_TOTAL :string;
  SaleAmount, StockProfit, ForeignRate,PER,ROE,ROA,PBR, sosok,DEBTRATIO,PSR : string;
begin
    if PassButton <> 1 then begin
       if MessageDlg('기업정보 가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
       begin
           exit;
       end;
    end;
    HtmlMemo := TMemo.Create(Self);
    HtmlMemo.Parent := Self;
    HtmlMemo.Width :=2000;
    HtmlMemo.Visible :=false;
    cc:=0;

    URL:='https://finance.naver.com/sise/field_submit.nhn?menu=market_sum&returnUrl=http%3A%2F%2Ffinance.naver.com%2Fsise%2Fsise_market_sum.nhn&fieldIds=listed_stock_cnt&fieldIds=quant&fieldIds=property_total';
    URL:=URL + '&fieldIds=operating_profit&fieldIds=frgn_rate&fieldIds=debt_total&fieldIds=reserve_ratio&fieldIds=sales&fieldIds=eps&fieldIds=per&fieldIds=roe&fieldIds=roa&fieldIds=pbr&';
    SHTML := GetHTML(URL+'sosok='+sosok+'&page='+inttostr(j));
 for k := 0 to 1 do begin
     URL:='https://finance.naver.com/sise/sise_market_sum.nhn?sosok='+inttoStr(k);

     SHTML:= GetHTML(URL);
     HtmlMemo.Text := SHTML;
     M := pos('">맨뒤', HtmlMemo.Text);
     L := SendMessage(HtmlMemo.Handle, EM_LINEFROMCHAR, M - 1, 0);
     page:= strToInt(GetData('page=', '">맨뒤', HtmlMemo.Lines[L]));

    for j:=1 to page do begin

        SHTML := GetHTML(URL+'&page='+inttostr(j));
        HtmlMemo.Text :=SHTML;
        for i:=0 to HtmlMemo.Lines.Count do begin
              LnHTML :=HtmlMemo.Lines[i];
              if  pos('<TD><A class=tltle href="/item/main.naver?code=', LnHTML) > 0 then begin
                  ccode:=GetData('?code=', '">', HtmlMemo.Lines[i]);
                  company:=StringReplace(StringReplace(GetData('">', '</A>', HtmlMemo.Lines[i]), '&amp;', '*',[rfReplaceAll, rfIgnoreCase]),' ', '',[rfReplaceAll, rfIgnoreCase]);
                  curPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+1]);
                  prePrice:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+2]);
                  if ccode ='010140' then
                     company:=company;


                  upDown:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+3]);
                  orgPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+4]);
                  DealAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+5]);
                  TotalStock:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+6]);

                  SaleAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+7]);
                  PROPERTY_TOTAL:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+8]);
                  DebtTotal:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+9]);
                  SalesProfit:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+10]);
                  StockProfit:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+11]);
                  ForeignRate:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+12]);
                  PER:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+13]);
                  ROE:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+14]);
                  ROA:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+15]);
                  PBR:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+16]);
                  RESERVE_RATIO :=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+17]);
//                  memo1.Lines.Add(ccode + chr(9)+ company + chr(9)+ curPrice + chr(9)+ prePrice + chr(9)+ upDown + chr(9)+ orgPrice + chr(9)+ DealAmount + chr(9)+ SaleAmount + chr(9)+ DebtTotal + chr(9)+ SalesProfit + chr(9)+ StockProfit + chr(9)+ ForeignRate);
                  if strToint(SaleAmount) <> 0  then begin
                     PSR := FORMATFLOAT('#.##',(strToint(curPrice) / ((strToint(SaleAmount) / strToint(TotalStock)))/100000));
                     DEBTRATIO := FORMATFLOAT('0.##',(strToint(DebtTotal) * 100) / (strToint(PROPERTY_TOTAL) - strToint(DebtTotal)));
                  end;
                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql :='delete from Main_Comp where ccode=''' + ccode + '''';
                  ADOQuery2.sql.add(dSql);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql := 'insert into Main_Comp(ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, SaleAmount,DebtTotal,';
                  iSql := iSql + ' SalesProfit, StockProfit, ForeignRate,PER,ROE,ROA,PBR,RESERVE_RATIO,PSR,DEBTRATIO,Up_date, sosok) Values(''' + ccode + ''','''+ company + ''','+curPrice+','+prePrice+','+upDown;
                  iSql := iSql +','+orgPrice+','+TotalStock+','+ DealAmount+','+ SaleAmount+','+DebtTotal+','+SalesProfit+','+ StockProfit+','+ ForeignRate+','+ PER+','+ ROE+','+ ROA+','+ PBR+','+ RESERVE_RATIO+','+ PSR+','+ DEBTRATIO+',GETUTCDATE(),'+inttostr(k)+')';
                  ADOQuery2.sql.add(iSql);
                  ADOQuery2.ExecSQL;
                  cc:=cc+1;
                  LABEL2.Caption :=intTostr(cc);
              end;
        end;
        HtmlMemo.Lines.Clear;
    end;
 end;
    if PassButton <> 1 then begin
       showmessage('완료');
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, CallDay, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 i,cc:integer;
 GetList : TStringList;
 StartDate, EndDate : TDate;
 GetStream: TMemoryStream;
 idHTTP :TidHTTP;
 GuraeTimeBuff,StartBuff,  HighBuff, LowBuff, EndBuff, GuraeBuff : TBytes;
 GuraeDay, memolist, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE : string;
  m: Integer;
begin
      if PassButton <> 1 then begin
          if MessageDlg('주가정보 가져오기??', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
             exit;
      end;

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;

      cc:=0;

  try

      if (memo2.Lines.Count >=10) then begin
          memolist:= '''' + memo2.Lines[0];
          for m := 1 to memo2.Lines.Count -1 do
             memolist:= memolist + ''',''' + memo2.Lines[m];

          Sql := 'select * from Main_Comp where ccode in (' + memolist+ ''')';

      end else if checkbox1.Checked  then
         Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''

      else Sql := 'select * from Main_Comp ' + company_gubun + ' order by ccode';
      StartDate := DateTimePicker1.Date;
      EndDate :=StartDate;
      if checkbox6.Checked  then begin
         EndDate :=DateTimePicker2.Date;
      end;


      ADOQuery4.close;
      ADOQuery4.sql.Clear;
      ADOQuery4.sql.add(Sql);
      ADOQuery4.Open;
      Progressbar1.Max := ADOQuery4.Recordcount;

      StartDate := DateTimePicker1.Date;

      while not ADOQuery4.Eof do begin
          CCODE :=TRIM(ADOQuery4.fieldvalues['ccode']);
          SOSOK :=TRIM(ADOQuery4.fieldvalues['sosok']);


//          while StartDate <= EndDate  do
//          begin
                   CallDay := FormatDateTime('YYYYMMDD', StartDate);

                   if DAYOFTHEWEEK(StartDate) > 5 then begin
                       StartDate :=IncDay(StartDate, 1);
                       Continue;
                   end;
                   URL:='http://mobilestock.etomato.com/mobilestock/device/chart3.aspx?t=d&dt=a&s=' + CCODE +'&d='+ CallDay + '&n=' + trim(edit3.text);
                   idHTTP.Get(URL,GetStream);
                   GetStream.Position := 0;
                   while GetStream.Position < GetStream.Size do
                   begin

                       SetLength(GuraeTimeBuff, 12);
                       SetLength(StartBuff, 4);
                       SetLength(HighBuff, 4);
                       SetLength(LowBuff, 4);
                       SetLength(EndBuff, 4);
                       SetLength(GuraeBuff, 4);


                       GetStream.ReadBuffer(GuraeTimeBUFF, 12);
                       GetStream.Position  := GetStream.Position + 2;
                       GetStream.ReadBuffer(StartBuff, 4);
                       GetStream.ReadBuffer(HighBuff, 4);
                       GetStream.ReadBuffer(LowBuff, 4);
                       GetStream.ReadBuffer(EndBuff, 4);
                       GetStream.ReadBuffer(GuraeBuff, 4);


                       GuraeDay := copy(TEncoding.ASCII.GetString(GuraeTimeBUFF),1,8);
                       EndPRICE := BytesToHex(EndBuff);

                   //    if (CallDay = copy(GuraeTime,1,8)) and (EndPRICE <> '') then begin
                           STARTPRICE := BytesToHex(StartBuff);
                           HIGHPRICE := BytesToHex(HighBuff);
                           LOWPRICE := BytesToHex(LowBuff);
                           GURAE := BytesToHex(GuraeBuff);

                           ADOQuery2.close;
                           ADOQuery2.sql.Clear;
                           dSql2 :='Delete from Daily_KOSP where CCODE= ''' + CCODE + ''' AND DDATE ='''+ GuraeDay + '''';
                           ADOQuery2.sql.add(dSql2);
                           ADOQuery2.ExecSQL;

                           ADOQuery2.close;
                           ADOQuery2.sql.Clear;
                           iSql := 'insert into Daily_KOSP (CCODE,DDATE,STARTPRICE,HIGHPRICE,LOWPRICE,ENDPRICE,GURAE,SOSOK) ';
                           iSql := iSql + ' Values(''' + CCODE + ''','''+ GuraeDay + ''',' + STARTPRICE + ',' + HIGHPRICE + ',' + LOWPRICE +',' + EndPRICE +',' + GURAE +',' + SOSOK + ')';
                           ADOQuery2.sql.add(iSql);
                        //   memo1.Lines.add(iSql);
                           ADOQuery2.ExecSQL;
                   //    end;
                       GetStream.Position  := GetStream.Position + 4;
                       cc := cc+1;
                   end;

                   GuraeDay:='';
                   EndPRICE:='';STARTPRICE:='';HIGHPRICE:='';LOWPRICE:='';GURAE:='';

          //cc := cc+1;
          LABEL2.Caption :=inttostr(cc);
          Progressbar1.Position := Progressbar1.Position + 1;
          GetStream.Clear;
          ADOQuery4.Next;
          Application.ProcessMessages;
      end;
      if PassButton <> 1 then begin
         showmessage('완료');
      end;
   finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
   sql,sql3,CCODE, fDate, eDate,todayDate,ddStr,SOSOK, compTable1,goodsql,DateGap : string;
   cc,dd:integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
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
  listbox7.Clear;
  cc:=0;
  if checkbox3.Checked  then
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;

   while StartDate <= EndDate  do begin
          if DAYOFTHEWEEK(StartDate) > 5 then begin
             StartDate :=IncDay(StartDate, 1);
             Continue;
          end;
    //     ddStr :=intTostr(dd);
          ddStr := formatdatetime('YYYYMMDD',StartDate);

          compTable1 := 'DAILY_KOSP';


          sql := 'SELECT B.COMPANY, A.CCODE AS CCODE, A.ENDPRICE AS ENDPRICE, ROUND(A.UPDOWN,2) AS UPDOWN,ROUND(A.UPDOWN2,2) AS UPDOWN2, A.SOSOK  FROM (SELECT  CCODE,';
          sql := sql + ' ((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100 AS UPDOWN, ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2,';
          sql := sql + ' ENDPRICE, SOSOK FROM '+ compTable1 +' WHERE DDATE = ''' + ddStr + ''' ) A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) ';
          if STRTOINT(EDIT4.TEXT) < 0 then sql := sql + ' WHERE A.UPDOWN2 <= ' + EDIT4.TEXT + goodsql + ' ORDER BY A.SOSOK, A.UPDOWN2 DESC '
          else  sql := sql + ' WHERE A.UPDOWN2 >= ' + EDIT4.TEXT + goodsql + ' ORDER BY  A.UPDOWN2 DESC, A.SOSOK ';

          FDQuery1.Close;
          FDQuery1.SQL.Clear;
          FDQuery1.SQL.Add(sql);
          FDQuery1.Open;
          while NOT FDQuery1.Eof  do begin
              CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
              LISTBOX1.Items.Add(TRIM(CCODE));
        //    LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
              IF FDQuery1.fieldvalues['SOSOK'] = 0 THEN LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
              ELSE ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));

              ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
              myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
              myDate := IncDay(myDate, 15);
              todayDate := DateToStr(myDate);
              DateGap := trim(EDIT16.TEXT);

              sql3 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
              sql3 :=sql3 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
              sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
              sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';


              FDQuery2.Close;
              FDQuery2.SQL.Clear;
              FDQuery2.SQL.Add(sql3);
              FDQuery2.Open;
              ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
              ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
              ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

              if ENDMAX > ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end else if ENDMAX = ENDPRICE then begin
                 listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;



              listbox7.Items.Add(ddStr);
              FDQuery1.Next;
              cc:=cc+1;
              LABEL2.Caption :=intTostr(cc);
          end;

          StartDate :=IncDay(StartDate, 1);
          LISTBOX7.Items.Add('----------');
          LISTBOX1.Items.Add('----------');
          ListBox2.Items.Add('----------');
          LISTBOX3.Items.Add('----------');
          LISTBOX4.Items.Add('----------');

  end;

  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button6Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,DateGap: string;
   CCODE, ddStr, todayDate,goodsql : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if MessageDlg('보물 종목  A?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;

   if RadioButton1.Checked then  RadioButton2.Checked := true;
   if checkbox3.Checked  then
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);

               sql := 'SELECT  DDATE, COMPANY, ENDPRICE, CCODE, SOSOK, DAY20COUNT,UPDOWN  ';
               sql := sql + ' FROM  (SELECT A.DDATE, B.COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK,  ISNULL(ROUND((A.DAY20SUM/nullif((A.ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, ';
               sql := sql + ' DAY20COUNT FROM DAILY_KOSP A  INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) ';
               sql := sql + ' INNER JOIN (SELECT DDATE,CCODE, LOWPRICE, GURAE, GURAE5, GURAE20, SSTART240 FROM  DAILY_KOSP) C ON( C.ddate <=A.DDATE AND A.CCODE =C.CCODE)';
               sql := sql + ' WHERE A.STARTPRICE > ' + EDIT20.Text + ' AND A.DAY60 > 1000 AND A.SSTART240 > 240 AND A.DAY20COUNT < 20 - ' + EDIT7.Text+ goodsql + ' AND C.SSTART240 > A.SSTART240 -140 ';
               sql := sql + ' AND C.GURAE > A.GURAE5 * 10 AND C.LOWPRICE > A.ENDPRICE * 1.3 ';
               sql := sql + ' AND A.DDATE BETWEEN CONVERT(varchar(16), DATEADD(DAY, -140 , CONVERT( DATETIME, ''' + ddStr + ''', 112)),112) AND ''' + ddStr + ''' ';
               sql := sql + ' GROUP BY A.DDATE, B.COMPANY, A.ENDPRICE, A.CCODE, A.SOSOK,  ISNULL(ROUND((A.DAY20SUM/nullif((A.ENDPRICE-DAY20SUM),0)) * 100,2),0), DAY20COUNT) X ';
               sql := sql + ' WHERE  X.UPDOWN <  ' + edit12.Text + ' AND X.DDATE = ''' + ddStr + ''' ORDER BY X.DDATE, X.CCODE, X.SOSOK, X.UPDOWN  ';


            //   sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ';
            //   sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
            //   sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE  A.DDATE=''' + ddStr + ''' AND DAY60 > 1000 AND SSTART240 > 240 AND DAY20COUNT < 20 - ' + EDIT7.Text+ goodsql +') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.SOSOK, X.UPDOWN';

        ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(sql);
        FDQuery1.Open;
        while NOT FDQuery1.Eof  do begin
            ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);
            DateGap := trim(EDIT16.TEXT);


                 sql4 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
                 sql4 :=sql4 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
                 sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
                 sql4 :=sql4 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + ddStr +''' Order by ddate';

                 FDQuery2.Close;
                 FDQuery2.SQL.Clear;
                 FDQuery2.SQL.Add(sql4);
                 FDQuery2.Open;
                 ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
                 ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
                 ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;
                 listbox7.Items.Add(ddStr);
                 LISTBOX1.Items.Add(CCODE);
             //   LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
                 if FDQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
                 ELSE  ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
                 LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN']));

        FDQuery1.Next;
        end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;

  label2.Caption := fDate;
  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button7Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql : string;
   CCODE, ddStr, todayDate, ALLTIME, HIGHPRICE,LOWPRICE, UPDOWN2: string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE,BUYG,BSG, TOTALG, MGURAE, TGURAE, GURAE40: integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
   if MessageDlg('보물종목2  가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
   begin
       exit;
   end;
   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox7.Clear;
   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;
   listbox4.Clear;


   if checkbox3.Checked  then
      goodsql :=' AND D.SaleAmount > 0 and  D.SalesProfit > 10 and D.DEBTTOTAL <= D.SALEAMOUNT * 0.6 ';


   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;
   if checkbox6.Checked  then
      EndDate :=DateTimePicker2.Date;

   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;

       ddStr := formatdatetime('YYYYMMDD',StartDate);

       sql := 'SELECT A.CCODE, A.DDATE, A.SOSOK, D.COMPANY, C.ENDPRICE, A.LOWPRICE, ISNULL(ROUND(((C.DAYGAP)/nullif(C.ENDPRICE-C.DAYGAP,0)) * 100,2),0) AS UPDOWN2, A.ALLTIME, A.HIGHPRICE, A.GURAE AS MGURAE, C.GURAE AS TGURAE, C.GURAE40 ';
       sql := sql + ' FROM STOCK_MIN A INNER JOIN (SELECT DDATE, CCODE, MAX(GURAE) AS MAXGURAE FROM STOCK_MIN GROUP BY DDATE, CCODE) B  ';
       sql := sql + ' ON(A.CCODE=B.CCODE AND A.CCODE=B.CCODE) INNER JOIN DAILY_KOSP C ON(A.CCODE=C.CCODE AND A.DDATE=C.DDATE) INNER JOIN MAIN_COMP D ON(A.CCODE=D.CCODE) ';
       sql := sql + ' WHERE B.DDATE = ''' + ddStr +''' AND B.MAXGURAE > 70000 AND A.GURAE = B.MAXGURAE AND A.UPDOWNPRICE > 0 AND A.LOWPRICE > 1500 AND C.GURAE > 400000 AND C.GURAE > 3 * C.GURAE40  ';
       sql := sql +  goodsql;

       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;

       while NOT FDQuery1.Eof  do begin
           ALLTIME :=FDQuery1.fieldvalues['ALLTIME'];
           HIGHPRICE :=FDQuery1.fieldvalues['HIGHPRICE'];
           ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];
           CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
           MGURAE :=FDQuery1.FieldByName('MGURAE').AsInteger;
           TGURAE :=FDQuery1.FieldByName('TGURAE').AsInteger;
           UPDOWN2 :=TRIM(FDQuery1.fieldvalues['UPDOWN2']);
           LOWPRICE :=FDQuery1.fieldvalues['LOWPRICE'];

           sql2 :='SELECT  ISNULL(SUM(GURAE * CASE WHEN (UPDOWNPRICE > 0) AND (ENDPRICE >' +  HIGHPRICE +') AND (ALLTIME > ''' + ALLTIME + ''') THEN 1 END) ,0) ';
           sql2 :=sql2 + '+ 2 * ISNULL(SUM(GURAE * CASE WHEN (UPDOWNPRICE <= 0) AND (ENDPRICE > ' +  HIGHPRICE +') AND (ALLTIME > ''' + ALLTIME + ''') THEN -1 END),0)  AS BUYG , ';
           sql2 :=sql2 + ' SUM(GURAE * SIGN(UPDOWNPRICE)) as BSG , SUM(GURAE) AS TOTALG FROM STOCK_MIN ';
           sql2 :=sql2 + ' WHERE CCODE='''+ CCODE + ''' AND DDATE =''' + ddStr + '''' ;
           FDQuery2.Close;
           FDQuery2.SQL.Clear;
           FDQuery2.SQL.Add(sql2);
           FDQuery2.Open;
          // BUYG,SELLG,TOTALG
           BUYG :=FDQuery2.FieldByName('BUYG').AsInteger;
           TOTALG := FDQuery2.FieldByName('TOTALG').AsInteger;
           BSG := FDQuery2.FieldByName('BSG').AsInteger;

           if (BUYG >= 0) AND (TGURAE < 12 * MGURAE) AND (strTofloat(UPDOWN2) > 0) and (strTofloat(UPDOWN2) < 20) and (BSG >= 0) then begin
               myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
               myDate := IncDay(myDate, 15);
               todayDate := DateToStr(myDate);

               sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
               sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN, SOSOK FROM ';
               sql3 :=sql3 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + ddStr + ''' and '''+ todayDate +'''';
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

                   listbox7.Items.Add(ddStr);
                   LISTBOX1.Items.Add(CCODE);
            //  LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
                   IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+LOWPRICE+')', Pointer(clBlack))
                   ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+LOWPRICE+')', Pointer(clGreen));
                   LISTBOX3.Items.Add(UPDOWN2);
           end;
           FDQuery1.Next;
       end;
       StartDate :=IncDay(StartDate, 1);
       listbox7.Items.Add('----------');
       LISTBOX1.Items.Add('----------');
       ListBox2.Items.Add('----------');
       LISTBOX3.Items.Add('----------');
       LISTBOX4.Items.Add('----------');
   end;



  Screen.Cursor := crDefault;

  showmessage('완료');

end;

procedure TForm1.Button8Click(Sender: TObject);
var
   sql,sql3,CCODE, fDate,endDate,eDate,todayDate,ddStr,SOSOK, DDATE : string;
   cc,dd:integer;
   myDate : TDateTime;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
begin

  Screen.Cursor := crHourglass;

  listbox1.Clear;
  listbox2.Clear;
  listbox3.Clear;
  listbox4.Clear;
  listbox7.Clear;
  cc:=0;

  fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
  eDate :=fDate;
  if checkbox6.Checked  then
     eDate :=StringReplace(datetostr(DateTimePicker2.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);

        //  todayDate :=formatdatetime('YYYYMMDD',now);


          sql:= 'SELECT B.COMPANY, A.DDATE AS DDATE, A.CCODE AS CCODE, A.ENDPRICE AS ENDPRICE, A.SOSOK, ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2 ';
          sql:= sql + ' FROM DAILY_KOSP A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE A.GOLD=1 AND A.DDATE between ''' + fDate + ''' and ''' + eDate + ''' ORDER BY A.DDATE DESC ';

          FDQuery1.Close;
          FDQuery1.SQL.Clear;
          FDQuery1.SQL.Add(sql);
          FDQuery1.Open;
          while NOT FDQuery1.Eof  do begin
              CCODE :=TRIM(FDQuery1.fieldvalues['CCODE']);
              DDATE :=TRIM(FDQuery1.fieldvalues['DDATE']);
              LISTBOX1.Items.Add(TRIM(CCODE));
              IF FDQuery1.fieldvalues['SOSOK'] = 0 THEN LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']))
              ELSE ListBox2.Items.AddObject(TRIM(FDQuery1.fieldvalues['COMPANY']), Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));

              ENDPRICE :=FDQuery1.fieldvalues['ENDPRICE'];

              myDate := STRTODATE(COPY(DDATE,1,4)+'-'+ COPY(DDATE,5,2)+'-'+COPY(DDATE,7,2));
              myDate := IncDay(myDate, 15);
              todayDate := DateToStr(myDate);

              sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
              sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
              sql3 :=sql3 + ' DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate between  ''' + DDATE + ''' and '''+ todayDate +'''';
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



              listbox7.Items.Add(DDATE);
              FDQuery1.Next;
              cc:=cc+1;
              LABEL2.Caption :=intTostr(cc);
          end;


          LISTBOX7.Items.Add('----------');
          LISTBOX1.Items.Add('----------');
          ListBox2.Items.Add('----------');
          LISTBOX3.Items.Add('----------');
          LISTBOX4.Items.Add('----------');

 // end;

  Screen.Cursor := crDefault;



end;

procedure TForm1.Button9Click(Sender: TObject);
VAR
 fDate :STRING;
begin
   PassButton :=1;
   Checkbox1.Checked  :=false;
   fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);
   if checkbox7.Checked  then begin
       Button3Click(nil);
       Button4Click(nil);
       Button10Click(nil);
       Button21Click(nil);
       Button27Click(nil);
   end else if combobox1.text ='전체' then begin
       button4click(nil);
       Button10Click(nil);
       Button27Click(nil);


   end else begin
       button4click(nil);
       Button10Click(nil);
   end;

   Button26Click(nil);
   button9.Caption :=formatdatetime('hhmmss',now);
   BuyStop();
   PassButton :=0;


end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
   standTime :=DateTimePicker1.Date ;
   ADOQuery3.Tag := 1;
   Theme_Flow(nil);
end;

procedure TForm1.DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  UPDOWN, GTOTAL,UPDOWN2, STPRICE,Hintstr : string;
begin
  SeriesIndex := DBChart1.Series[0].Clicked(X, Y);

  DBChart1.ShowHint := SeriesIndex <> -1;
//  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart1.ShowHint then
  begin
      ADOQuery1.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
      if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery1.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery1.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - ADOQuery1.FieldByName('PREPRICE1').AsInteger) / ADOQuery1.FieldByName('PREPRICE1').AsInteger  * 100);
        DBChart1.Hint := UPDOWN2 +'%(' + ADOQuery1.FieldByName('ENDPRICE').AsString +')/UPDOWN:'+ UPDOWN +'%/시분'+ Rightstr(ADOQuery1.FieldByName('DDATE').AsString,4);

      end else begin
         if Theme = 1 then begin
            Hintstr :=  ADOQuery1.FieldByName('ENDPRICE').AsString + '('+ ADOQuery1.FieldByName('UPDOWN2').AsString +'%)/'
                     + ADOQuery1.FieldByName('DDATE').AsString;

         end else begin;

            Hintstr :=  ADOQuery1.FieldByName('UPDOWN2').AsString + '%('+ ADOQuery1.FieldByName('ENDPRICE').AsString +')/HIGH:'
                     + ADOQuery1.FieldByName('HIGHRATE').AsString +'%/LOW:' + ADOQuery1.FieldByName('LOWRATE').AsString +'%/'
                     + ADOQuery1.FieldByName('DDATE').AsString;
         end;
         DBChart1.Hint :=  Hintstr;
      end;

  end;

end;

procedure TForm1.DBChart2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1,DayGurae: Integer;
  GTOTAL,UPDOWN,UPDOWN2,STPRICE : string;
begin
  SeriesIndex1 := DBChart2.Series[0].Clicked(X, Y);

  DBChart2.ShowHint := SeriesIndex1 <> -1;
//  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart2.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }

    if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery3.FieldByName('GURAE').AsInteger / ADOQuery3.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery3.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery3.FieldByName('STARTPRICE').AsInteger  * 100);
     //   UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - ADOQuery3.FieldByName('PREPRICE1').AsInteger) / ADOQuery3.FieldByName('PREPRICE1').AsInteger  * 100);
        DBChart2.Hint := ADOQuery3.FieldByName('GURAE').AsString + '(' + GTOTAL + '%)/시분'+ Rightstr(ADOQuery3.FieldByName('DDATE').AsString,4);
      //  DBChart2.Hint :=ADOQuery3.FieldByName('LOWPRICE').AsString + '(' + UPDOWN2 +')/' + ADOQuery3.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN + ')/' + ADOQuery3.FieldByName('GURAE').AsString  + '(' + GTOTAL +')' ;
    end else begin
       if Theme = 1 then begin
           DBChart2.Hint :=  ADOQuery3.FieldByName('ENDPRICE').AsString + '('+ ADOQuery3.FieldByName('UPDOWN2').AsString +'%)/'
                            + ADOQuery3.FieldByName('DDATE').AsString;

       end else begin;
          DayGurae := ADOQuery3.FieldByName('GURAE').Value;
          DBChart2.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ') /'+ ADOQuery3.FieldByName('DDATE').AsString;
       end;

    end;
  end;

end;

procedure TForm1.DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  GTOTAL, UPDOWN,UPDOWN2,STPRICE,Hintstr :string;
begin
  SeriesIndex := DBChart3.Series[0].Clicked(X, Y);

  DBChart3.ShowHint := SeriesIndex <> -1;
//  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart3.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
      if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery3.FieldByName('GURAE').AsInteger / ADOQuery3.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery3.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery3.FieldByName('STARTPRICE').AsInteger  * 100);
     //   UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - ADOQuery3.FieldByName('PREPRICE1').AsInteger) / ADOQuery3.FieldByName('PREPRICE1').AsInteger  * 100);
        DBChart3.Hint := UPDOWN2 +'%(' + ADOQuery3.FieldByName('ENDPRICE').AsString +')/UPDOWN:'+ UPDOWN +'%/시분'+ Rightstr(ADOQuery3.FieldByName('DDATE').AsString,4);
      // DBChart3.Hint := ADOQuery3.FieldByName('ENDPRICE').AsString +'(' + UPDOWN2 +')/' + ADOQuery3.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN +'%)/'+ GTOTAL + '/' + ADOQuery3.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery3.FieldByName('LOWPRICE').AsString;
      end else begin
         if Theme = 1 then begin
            Hintstr :=  ADOQuery3.FieldByName('ENDPRICE').AsString + '('+ADOQuery3.FieldByName('UPDOWN2').AsString +'%)/'
                        + ADOQuery3.FieldByName('DDATE').AsString;

         end else begin;

            Hintstr :=  ADOQuery3.FieldByName('UPDOWN2').AsString + '%('+ ADOQuery3.FieldByName('ENDPRICE').AsString +')/HIGH:'
                        + ADOQuery3.FieldByName('HIGHRATE').AsString +'%/LOW:' + ADOQuery3.FieldByName('LOWRATE').AsString +'%/'
                        + ADOQuery3.FieldByName('DDATE').AsString;
         end;
         DBChart3.Hint :=  Hintstr;
      end;

  end;

end;

procedure TForm1.DBChart4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  UPDOWN, GTOTAL,UPDOWN2, STPRICE : string;
begin


end;

procedure TForm1.DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1,DayGurae: Integer;
  GTOTAL,UPDOWN,UPDOWN2,STPRICE: string;
begin
  SeriesIndex1 := DBChart5.Series[0].Clicked(X, Y);

  DBChart5.ShowHint := SeriesIndex1 <> -1;
//  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart5.ShowHint then
  begin
    ADOQuery1.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }

    if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery1.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery1.FieldByName('STARTPRICE').AsInteger  * 100);
      //  UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - ADOQuery1.FieldByName('PREPRICE1').AsInteger) / ADOQuery1.FieldByName('PREPRICE1').AsInteger  * 100);
        DBChart5.Hint := ADOQuery1.FieldByName('GURAE').AsString + '(' + GTOTAL + '%)/시분'+ Rightstr(ADOQuery1.FieldByName('DDATE').AsString,4);
      //  DBChart5.Hint := ADOQuery1.FieldByName('LOWPRICE').AsString +'(' + UPDOWN2 +')/'+ ADOQuery1.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN + ')/' + ADOQuery1.FieldByName('GURAE').AsString  + '(' + GTOTAL +')' ;
    end else begin
       if Theme = 1 then begin
           DBChart5.Hint :=  ADOQuery1.FieldByName('ENDPRICE').AsString + '('+ ADOQuery1.FieldByName('UPDOWN2').AsString +'%)/'
                            + ADOQuery1.FieldByName('DDATE').AsString;

       end else begin;
          DayGurae := ADOQuery1.FieldByName('GURAE').Value;
          DBChart5.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ') /' +  Rightstr(ADOQuery1.FieldByName('DDATE').AsString,4);
       end;
    end;
  end;


end;

procedure TForm1.DBChart6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  GTOTAL, UPDOWN,UPDOWN2,STPRICE :string;
begin

end;

procedure TForm1.Edit1DblClick(Sender: TObject);
var
uSql,CallDay : string;
begin
     CallDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

     FDQuery2.close;
     FDQuery2.sql.Clear;
     uSql :='UPDATE DAILY_KOSP SET GOLD= 1 where CCODE= ''' + EDIT1.TEXT + ''' AND DDATE ='''+ CallDay + '''';
     FDQuery2.sql.add(uSql);
     FDQuery2.ExecSQL;
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
uSql,CallDay : string;
begin

   if (Key = 13) and (Shift = [ssCtrl]) then begin

     CallDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

     FDQuery2.close;
     FDQuery2.sql.Clear;
     uSql :='UPDATE DAILY_KOSP SET GOLD= 0 where CCODE= ''' + EDIT1.TEXT + ''' AND DDATE ='''+ CallDay + '''';
     FDQuery2.sql.add(uSql);
     FDQuery2.ExecSQL;
   end else if Key = 13 then
      Button1Click(nil);
end;

procedure TForm1.Edit21Click(Sender: TObject);
begin
  if edit21.Text <>'' then

     Theme_chart(edit21.Text);
end;

procedure TForm1.Edit21DblClick(Sender: TObject);
begin
     Theme_list(edit21.text);
end;

procedure TForm1.Edit21KeyPress(Sender: TObject; var Key: Char);
var
sql :string;
begin
     if Key = #13 then begin
       listbox9.Clear;
       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       sql := 'SELECT MainTitle FROM Theme_Stock WHERE MainTitle like ''%' + edit21.Text + '%'' GROUP BY MainTitle';
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;
       while NOT FDQuery1.Eof  do begin
        //   LISTBOX9.Items.Add(TRIM(FDQuery1.fieldvalues['MainTitle']));
           listbox9.Items.AddObject(FDQuery1.fieldvalues['Maintitle'] +#9+ '0.00' + '% '+#9, Pointer(clRed));

           FDQuery1.Next;
       end;
     end;
end;

procedure TForm1.Edit2DblClick(Sender: TObject);
begin
    MEMO2.Lines.Add(EDIT2.Text);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin

       LISTBOX1.Clear;
       LISTBOX2.Clear;
       listbox7.Clear;
       listbox3.Clear;
       listbox4.Clear;


       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE COMPANY like ''%' + edit2.Text + '%''';
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;
       while NOT FDQuery1.Eof  do begin
           LISTBOX1.Items.Add(TRIM(FDQuery1.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery1.fieldvalues['COMPANY']));
           LISTBOX7.Items.Add(StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]));
           FDQuery1.Next;
       end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   con_string :string;
begin
 DateTimePicker1.DateTime :=now;
 DateTimePicker2.DateTime :=now;
 standTime :=now;
 company_gubun :='';
 //edit9.text := formatdatetime('YYYYMMDDhhmm',now);
 ListBox2.Style := lbOwnerDrawFixed;
 ListBox9.Style := lbOwnerDrawFixed;

  Header1.SectionWidth[0] := 130;
  Header1.SectionWidth[1] := 50;

 con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
 con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';
 ADOConnection1.ConnectionString := con_string;
 DBChart1.Title.Text.Clear;
 DBChart5.Title.Text.Clear;
 DBChart3.Title.Text.Clear;
 DBChart2.Title.Text.Clear;

 Button1Click(nil);
 Theme_Flow(nil);


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    HtmlMemo.Free;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var
  IE: OleVariant;
  ccode,URL : string;
begin
  try
    ccode := listbox1.items[listbox2.itemindex];
    URL := 'http://finance.naver.com/item/fchart.nhn?code='+ ccode;
    ShellExecute(self.WindowHandle,'open','chrome.exe', PChar(URL), nil, SW_SHOW);

  finally
    IE:=Unassigned;
  end;
//   edit1.Text := listbox1.items[listbox1.itemindex];;
//   Button1Click(nil);
end;

procedure TForm1.ListBox2Click(Sender: TObject);
var
  chDate, ccode, mitem : string;
  futureDate : TDateTime;
begin


     chDate:= listbox7.items[listbox2.itemindex];
     edit1.Text := listbox1.items[listbox2.itemindex];
     ccode:= listbox1.items[listbox2.itemindex];

      if ccode = '' then begin
          DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
       //   futureDate := IncDay(DateTimePicker1.Date , strToint(EDIT16.TEXT));
       //   label2.Caption :=  DateToStr(futureDate);
          mitem:= listbox2.items[listbox2.itemindex];
          edit21.Text	 :=mitem;
          Theme_Chart(mitem);

      end else if chDate <> '----------' then begin

          if FormatDateTime('YYYYMMDD', DateTimePicker1.Date) <> listbox7.items[listbox2.itemindex] then  begin
              DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
              Theme_Flow(nil);
          end else begin
              DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
          end;

          futureDate := IncDay(DateTimePicker1.Date , strToint(EDIT16.TEXT));
       //   label2.Caption :=  DateToStr(futureDate);;
          Button1Click(nil);
          Theme_Call(nil);
          TempPaste();
      end;
end;

procedure TForm1.ListBox2DblClick(Sender: TObject);
var
   CCODE,DDATE, sql, src : string;
   I,J: integer;
   slTemp1, slTemp2 : TStringList;
begin
  try
       CCODE := listbox1.items[listbox2.itemindex];
       DDATE := listbox7.items[listbox2.itemindex];

       if LENGTH(CCODE) <> 6 then EXIT;
       TempCOPY();
       listbox3.Clear;
       listbox4.Clear;
       MEMO2.Clear;
       slTemp1 := TStringList.Create;
       slTemp2 := TStringList.Create;

       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;

       sql := 'SELECT [dbo].[FLOW_PATTERN](''' + CCODE + ''',''' + DDATE + ''',''' + EDIT16.Text + ''') AS JASONSTR' ;

     //  sql := 'SELECT [dbo].[FLOW_PATTERN](''096530'',''20230803'',''7'') AS JASONSTR';

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;


       IF NOT ADOQuery2.Eof then begin
            src := ADOQuery2.FieldByName('JASONSTR').AsString ;
            if src ='' then begin
                TempPaste();
                exit;
            end;
            slTemp1.Delimiter :='/';
            slTemp1.DelimitedText := src;

            for I := 0 to slTemp1.Count	-2 do begin
                 slTemp2.Delimiter :=',';
                 slTemp2.DelimitedText := slTemp1[I];
             //    for J := 0 to slTemp2.Count -1 do begin
                     listbox3.Items.add(slTemp2[1]);
                     listbox4.Items.Add(slTemp2[2]);
                     memo2.Lines.Add(slTemp2[0]);
             //    end;
           end;

       end;

  finally
      slTemp1.free; slTemp2.free;
  end;
end;

procedure TForm1.ListBox2DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
    with Control as TListBox do
    begin
        if odSelected in State then
            Canvas.Brush.Color := $00FCB498;
        Canvas.FillRect(Rect);
        Canvas.Font.Color := TColor(Items.Objects[Index]);
        Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
    end;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
var
  chDate, ccode, mitem : string;
  futureDate : TDateTime;
begin


     chDate:= memo2.Lines[listbox3.itemindex];
     ccode:= listbox3.items[listbox3.itemindex];
     edit1.Text := ccode;

      if LENGTH(ccode) =6 then begin

          if FormatDateTime('YYYYMMDD', DateTimePicker1.Date) <> chDate then  begin
              DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
              Theme_Flow(nil);
          end else begin
              DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
          end;


          Button1Click(nil);
          Theme_Call(nil);

      end;

end;

procedure TForm1.ListBox7DblClick(Sender: TObject);
begin
   edit1.Text := listbox7.items[listbox7.itemindex];;
   Button1Click(nil);
end;

procedure TForm1.ListBox8Click(Sender: TObject);
var
 sql,itemName, itemCode : string;
begin

          ADOQuery2.Close;
          ADOQuery2.SQL.Clear;
          itemName :=listbox8.items[listbox8.itemindex];
          itemCode :=  copy(itemName, POS('#', itemName)+1, length(itemName)-POS('#', itemName));
          edit21.Text  :=  itemName;
          sql := 'SELECT * FROM Theme_Stock where Ccode='+ edit1.Text +' and MainTitle=''' + itemName + '''';

       if (edit1.Text  <>'') AND (itemName <>'') then begin
          ADOQuery2.SQL.Add(sql);
          ADOQuery2.Open;
          Memo4.TEXT := ADOQuery2.fieldvalues['MainBigo'];
          Memo5.TEXT := ADOQuery2.fieldvalues['SubBigo'];
       end;

end;

procedure TForm1.ListBox8DblClick(Sender: TObject);
var
 sql, sql2, itemName, fDate, itemCode : string;
 CCODE,DateGap, todayDate,goodsql : string;
 ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
 myDate : TDateTime;
 StartDate, EndDate : TDate;
begin

       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       itemName :=listbox8.items[listbox8.itemindex];
       itemCode :=  copy(itemName, POS('#', itemName)+1, length(itemName)-POS('#', itemName));

       fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

       sql := 'Select A.ccode, A.ddate,A.ENDPRICE, C.company,B.MainBigo, B.subBigo, ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' from  DAILY_KOSP A INNER JOIN Theme_Stock B ON(A.CCODE =B.CCODE)';
       sql := sql + ' INNER JOIN Main_comp C on(A.CCODE = C.CCODE) WHERE  B.MainTitle=''' + itemName + ''' AND A.DDATE =''' + fDate +''' ORDER BY ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) DESC';

       listbox7.Clear;
       listbox1.Clear;
       listbox2.Clear;
       listbox3.Clear;
       listbox4.Clear;

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;
       Memo4.TEXT := ADOQuery2.fieldvalues['MainBigo'];
       Memo5.TEXT := ADOQuery2.fieldvalues['SubBigo'];

       while NOT ADOQuery2.Eof  do begin

            ENDPRICE :=ADOQuery2.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(ADOQuery2.fieldvalues['CCODE']);
            myDate := STRTODATE(COPY(fDate,1,4)+'-'+ COPY(fDate,5,2)+'-'+COPY(fDate,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);
            DateGap := trim(EDIT16.TEXT);

            listbox7.Items.Add(ADOQuery2.fieldvalues['ddate']);
            listbox1.Items.Add(ADOQuery2.fieldvalues['ccode']);
       //     listbox2.Items.Add(ADOQuery2.fieldvalues['company']);
            listbox3.items.Add(FormatFloat('0.##', ADOQuery2.fieldvalues['UPDOWN2']) + '%');

            sql2 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
            sql2 :=sql2 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
            sql2 :=sql2 + ' MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
            sql2 :=sql2 + ' DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + fDate +''' Order by ddate';

            FDQuery2.Close;
            FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add(sql2);
            FDQuery2.Open;
            ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
            ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
            ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;

                 if FDQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(ADOQuery2.fieldvalues['COMPANY']))
                 ELSE  ListBox2.Items.AddObject(TRIM(ADOQuery2.fieldvalues['COMPANY']), Pointer(clGreen));

            ADOQuery2.Next;

       end;
end;

procedure TForm1.ListBox8DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
    with Control as TListBox do
    begin
        if odSelected in State then
            Canvas.Brush.Color := $00FCB498;
        Canvas.FillRect(Rect);
        Canvas.Font.Color := TColor(Items.Objects[Index]);
        Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
    end;
end;

procedure TForm1.ListBox9Click(Sender: TObject);
var
  itemName : string;
begin
 itemName :=copy(listbox9.items[listbox9.itemindex],1,Pos(#9, listbox9.items[listbox9.itemindex])-1) ;
 if (itemName <> '') AND (POS('--',itemName) = 0) then begin
     if POS('월:',itemName) > 0 then
        Delete(itemName, 1, POS('월:',itemName) + 2 );
     Theme_Chart(itemName);
     edit21.Text :=  itemName;
 end;
end;

procedure TForm1.ListBox9DblClick(Sender: TObject);
var
   itemName : string;
begin

     itemName :=copy(listbox9.items[listbox9.itemindex],1,Pos(#9, listbox9.items[listbox9.itemindex])-1) ;
     if (itemName <> '') AND (POS('--',itemName) = 0) then  begin
        if POS('월:',itemName) > 0 then
           Delete(itemName, 1, POS('월:',itemName) + 2 );
        Theme_list(itemName);
     end;


end;

procedure TForm1.ListBox9DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
   r1,r2,r3 : TRect;
   tmp : string;
   ind : byte;
   Align: Word;
   Hand: HDC;
begin
    r1 := Rect;
    r1.Right := Header1.SectionWidth[0];
    r2 := Rect;
    r2.Left := r1.right + 1;
    r2.right := r2.Left + Header1.SectionWidth[1];
    tmp := TlistBox(Control).Items[Index];


    with TlistBox(Control).Canvas do begin
        if odSelected in State then
            Brush.Color := $00FCB498;
        FillRect(Rect);
        ind := Pos(#9, tmp);
        TextRect(r1, r1.left, r1.top, copy(tmp,1, ind-1));
        tmp := copy(tmp, ind+1, length(tmp)-ind+1);
        ind := Pos(#9, tmp);
     //   TextRect(r2, r2.left, r2.top, copy(tmp, 1, ind-1));
        Font.Color := TColor(clRed);
        Font.Style := Font.Style + [fsBold];
    //        TextOut(r2.left + 2, r2.Top, copy(tmp, 1, ind-1));
        Align := DT_RIGHT;
        Hand := Handle;
        DrawText(Hand, pChar(copy(tmp, 1, ind-1)), -1, Rect, Align);
    end;

end;


procedure TForm1.Memo1DblClick(Sender: TObject);
begin
   edit1.Text := memo1.Text;
   memo1.SetFocus;
   Button1Click(nil);
end;



procedure TForm1.Memo2Click(Sender: TObject);
var
  chDate : string;
  futureDate : TDateTime;
begin

      if Memo2.SelText <> '' then begin
           edit2.Text :=  Memo2.SelText;
           Button1Click(nil);
      end;

end;

procedure TForm1.Memo2DblClick(Sender: TObject);
var
 sql, ctxt : string;
begin
   ctxt := Memo2.SelText;
   edit2.text := ctxt;
   getStockData(ctxt);
   getMinData(ctxt);
   Button1Click(nil);
   Button13Click(nil);

end;



procedure TForm1.RadioButton4Click(Sender: TObject);
begin
    ScrollBar1.Position :=0;
    if RadioButton1.Caption ='10분' then  Button13Click(nil)
    else if Theme =1 then Theme_Chart(edit21.text)
    else Button1Click(nil);

end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
    if RadioButton1.Caption ='10분' then begin
       minTime := ScrollBar1.Position ;
       Button13Click(nil);
    end else begin
       DateTimePicker1.Date := standTime +  ScrollBar1.Position ;
       Button1Click(nil);
    end;

end;

procedure TForm1.Series1BeforeDrawValues(Sender: TObject);
begin
   //DBChart1.Series[0].  .YValue[3]:=1000;
end;



function Tform1.GetData(Fstr:string; Lstr:string; memoln :string):string;
var
  retStr: string;
begin
    memoln:= StringReplace(memoln, ',', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:= StringReplace(memoln, 'N/A', '0',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '+', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '%', '',[rfReplaceAll, rfIgnoreCase]);
   // memoln:=StringReplace(memoln, 'amp;', '',[rfReplaceAll, rfIgnoreCase]);
  //  memoln:=StringReplace(memoln, '|', ',',[rfReplaceAll, rfIgnoreCase]);
    retStr := copy(memoln, pos(Fstr,memoln)+ length(Fstr), pos(Lstr,memoln)-pos(Fstr,memoln)- length(Fstr));
    if pos(Fstr, retStr) > 0 then begin
       retStr := copy(retStr, pos(Fstr,retStr)+ length(Fstr), length(retStr)-pos(Fstr,retStr)- length(Fstr));
    end;
    result :=retStr;
end;

function Tform1.GetHTML2(addr2: string):TMemoryStream;
var
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
  SHTML, LnHTML,URL,iSql,sql,LdSql, dSql,Wsql, CallDay: string ;
  i,CC,dd,sPage :integer;
  IdHTTP: TIdHTTP;
  StartDate, EndDate : TDate;
  GetList : TStringList;
  UrlItem,ATextData:string;
  GetStream: TMemoryStream;
  ccode, company :string;
  sosok, fDate,eDate,UPDOWNPRICE: string;
  GuraeTimeBuff,StartBuff,  HighBuff, LowBuff, EndBuff, GuraeBuff : TBytes;
  GuraeTime, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE, MinSeq, SignUpDown  : string;
  OldGuraeTime, OldEndPRICE,fileLoc, goodsql :string;
  StockF: TextFile;
begin
      if PassButton <> 1 then begin
        if MessageDlg('가져오기?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
      end;

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;
      Progressbar1.Max :=0;

      try


          CC:=0;

          if checkbox1.Checked  then  Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''
          else if company_gubun='' then  Sql := 'select * from Main_Comp where SaleAmount > 0 order by ccode'
          else Sql := 'select * from Main_Comp ' + company_gubun + ' order by ccode';


          ADOQuery4.close;
          ADOQuery4.sql.Clear;
          ADOQuery4.sql.add(Sql);
          ADOQuery4.Open;
          Progressbar1.Max := ADOQuery4.Recordcount;

          StartDate := DateTimePicker1.Date;
          EndDate :=StartDate;

          if checkbox6.Checked  then begin
              EndDate :=DateTimePicker2.Date;
          end;
          fileLoc := 'c:/STOCK_DATA/' + FormatDateTime('YYYYMMDD', StartDate);
          AssignFile(StockF, fileLoc);
          Rewrite(StockF);

          while not ADOQuery4.Eof do begin
              CCODE :=TRIM(ADOQuery4.fieldvalues['ccode']);
              COMPANY :=TRIM(ADOQuery4.fieldvalues['COMPANY']);
              sosok :=TRIM(ADOQuery4.fieldvalues['sosok']);

              StartDate := DateTimePicker1.Date;
              while StartDate <= EndDate  do begin

                  CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

                  if DAYOFTHEWEEK(StartDate) > 5 then begin
                     StartDate :=IncDay(StartDate, 1);
                     Continue;
                  end;
                  FDQuery2.close;
                  FDQuery2.sql.Clear;
                  if (CCODE <> '') and (CallDay <>'') then
                      dSql :='Delete from Stock_min where CCODE= ''' + CCODE + ''' AND DDATE ='''+ CallDay + '''';
                  FDQuery2.sql.add(dSql);
                  FDQuery2.ExecSQL;

                  UrlItem :='http://mobilestock.etomato.com/mobilestock/device/chart2.aspx?t=1&s=';
                  UrlItem := UrlItem +CCODE + '&d=' + CallDay + trim(edit18.text) + '00&n=392';
                  IdHTTP.Get(UrlItem,GetStream);
                  GetStream.Position := 0;
                  OldEndPRICE :='0';
                  while GetStream.Position < GetStream.Size do
                  begin

                       SetLength(GuraeTimeBuff, 12);
                       SetLength(StartBuff, 4);
                       SetLength(HighBuff, 4);
                       SetLength(LowBuff, 4);
                       SetLength(EndBuff, 4);
                       SetLength(GuraeBuff, 4);


                       GetStream.ReadBuffer(GuraeTimeBUFF, 12);
                       GetStream.Position  := GetStream.Position + 2;
                       GetStream.ReadBuffer(StartBuff, 4);
                       GetStream.ReadBuffer(HighBuff, 4);
                       GetStream.ReadBuffer(LowBuff, 4);
                       GetStream.ReadBuffer(EndBuff, 4);
                       GetStream.ReadBuffer(GuraeBuff, 4);


                       GuraeTime := TEncoding.ASCII.GetString(GuraeTimeBUFF);
                       EndPRICE := BytesToHex(EndBuff);

                       if (CallDay = copy(GuraeTime,1,8)) and (EndPRICE <> '') then begin
                           STARTPRICE := BytesToHex(StartBuff);
                           HIGHPRICE := BytesToHex(HighBuff);
                           LOWPRICE := BytesToHex(LowBuff);
                           GURAE := BytesToHex(GuraeBuff);

                              UPDOWNPRICE :=IntTostr(strtoInt(EndPRICE) -strToint(OldEndPRICE));

                              MinSeq := intTostr((strToint(copy(GuraeTime,9,2)) - 9) * 60 + strToint(copy(GuraeTime,11,2)));
                              SignUpDown := intTostr(Sign(StrToint(UPDOWNPRICE)));

                              LdSql :=','+ CCODE + ','+ CallDay + ','+ GuraeTime + ',' + STARTPRICE+ ',' + HIGHPRICE  + ',';
                              LdSql := LdSql + LOWPRICE + ',' + ENDPRICE +',' + GURAE +',' + sosok +',' + UPDOWNPRICE +',' + MinSeq +',' + SignUpDown ;

                              WriteLn(StockF,LdSql);

                       end;
                       OldEndPRICE:= EndPRICE;
                       if OldEndPRICE ='' then OldEndPRICE :='0';

                       GetStream.Position  := GetStream.Position + 4;
                 end;



                 GuraeTime:='';
                 EndPRICE :='';
                 GuraeTime :='';

                 StartDate :=IncDay(StartDate, 1);
              end;
              cc:=cc+1;

              Progressbar1.Position := Progressbar1.Position + 1;
              LABEL2.Caption :=intTostr(cc);
              GetStream.Clear;
              ADOQuery4.Next;
              Application.ProcessMessages;

          end;
          CloseFile(StockF);

          if FileExists(fileLoc) then
          begin
              FDQuery2.Close;
           //   FDQueryMysql1.SQL.Text := 'LOAD DATA LOCAL INFILE "' + fileLoc + '" INTO TABLE Stock_min FIELDS TERMINATED BY ","  LINES TERMINATED BY "\r\n"';
              FDQuery2.SQL.Text := 'BULK INSERT STOCK_MIN FROM ''' + fileLoc + ''' WITH (FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')';
              FDQuery2.ExecSQL;

              FDQuery2.Close;
              FDQuery2.sql.Clear;
              Wsql := 'UPDATE DAILY_KOSP SET GURAEWEIGHT = B.UPGURAE FROM DAILY_KOSP A JOIN (SELECT CCODE, DDATE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
              Wsql := Wsql + ' FROM STOCK_MIN GROUP BY CCODE, DDATE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE B.DDATE ='''+ CallDay + '''';
              if checkbox1.Checked  then  Wsql := Wsql + ' AND B.CCODE=''' + edit1.Text +'''';
              FDQuery2.sql.add(Wsql);
              FDQuery2.ExecSQL;
          end;

          if PassButton <> 1 then begin
              showmessage('완료');
          end;
      finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
      end;
end;

function TForm1.BytesToHex(aSource: TBytes): string;
var
   strHex : string;
   strHexDec :  string;
   i : integer;
begin
   SetLength(strHex, Length(aSource) * 2);
   if Length(aSource) > 0 then
      BinToHex(aSource[0], PChar(strHex), Length(aSource));
   for i := 4 downto 1 do begin
       strHexDec :=strHexDec + strHex[2*i-1];
       strHexDec :=strHexDec +  strHex[2*i]
   end;
   result := intTostr(strToInt('$' + strHexDec));
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
var
  chDate : string;
  futureDate : TDateTime;
begin
      IF CheckBox9.Checked THEN  BEGIN
          edit1.Text := '996001';
          CheckBox9.Caption :='코스닥';
      END ELSE BEGIN
          edit1.Text := '990001';
          CheckBox9.Caption :='코스피';

      END;
      checkbox1.Checked :=true;
      PassButton :=1;
      Button4Click(nil);
      Button1Click(nil);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if combobox1.text ='전체' then company_gubun :=''
  else if  combobox1.text ='코스피,코스닥' then company_gubun :=' where CCODE IN(''990001'',''996001'', ''990413'',''990408'',''990410'') OR (sosok < 2)  and curPrice > 1000 and SaleAmount > 0 ' //and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.6 ) '
  else if  combobox1.text ='지수,코넥스' then company_gubun :=' where sosok > 1 and SaleAmount > 0 ' ;

end;

procedure TForm1.getStockData(cName :string);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, fDate, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 i,cc:integer;
 idHTTP :TidHTTP;
 PriceList,Htmlstr: Tstringlist;
begin

      idHTTP    := TIdHTTP.Create();
      PriceList := TStringList.Create;
      Htmlstr := TStringList.Create;
      cc:=0;


      Sql := 'select * from Main_Comp where company=''' + cName +'''';

    try
      FDQuery1.close;
      FDQuery1.sql.Clear;
      FDQuery1.sql.add(Sql);
      FDQuery1.Open;
      fDate := StringReplace(datetostr(DateTimePicker1.date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      if not FDQuery1.Eof then begin
          edit1.Text :=FDQuery1.fieldvalues['ccode'];
          CCODE :=TRIM(FDQuery1.fieldvalues['ccode']);
          SOSOK :=TRIM(FDQuery1.fieldvalues['sosok']);
          URL:='http://fchart.stock.naver.com/sise.nhn?symbol=' + CCODE +'&timeframe=day&startTime='+fDate +'&count=' + trim(edit3.text) +'&requestType=2';
          SHTML := idHTTP.GET(URL);
          SHTML :=StringReplace(SHTML, #9, '',[rfReplaceAll, rfIgnoreCase]);
          SHTML :=StringReplace(SHTML, #$A, '@',[rfReplaceAll, rfIgnoreCase]);
          Htmlstr.StrictDelimiter := true;
          Htmlstr.Delimiter := '@';
          Htmlstr.DelimitedText := SHTML;

          for i:=0 to Htmlstr.Count-1 do begin
              LnHTML :=Htmlstr[i];
               if  pos('item data', LnHTML) > 0 then begin
                  getPrice:=GetData('<item data="', '" />', LnHTML);
                  PriceList.Delimiter := '|';
                  PriceList.DelimitedText := getPrice;

               //       StockTable :='DailyPrice_KOSP';
                      InputTable :='Daily_KOSP';

              
                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql2 :='Delete from ' + InputTable + ' where CCODE= ''' + CCODE + ''' AND DDATE ='''+ PriceList[0] + '''';
                  ADOQuery2.sql.add(dSql2);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql := 'insert into '+InputTable +' (CCODE,DDATE,STARTPRICE,HIGHPRICE,LOWPRICE,ENDPRICE,GURAE,SOSOK) ';
                  iSql := iSql + ' Values(''' + CCODE + ''','''+ PriceList[0] + ''',' + PriceList[1] + ',' + PriceList[2] + ',' + PriceList[3] +',' + PriceList[4] +',' + PriceList[5] +',' + SOSOK + ')';
                  ADOQuery2.sql.add(iSql);
                  ADOQuery2.ExecSQL;

                  PriceList.Clear;
               end;
          end;
          cc:=cc+1;
          LABEL2.Caption :=intTostr(cc);
          Htmlstr.Clear;

      end;
   finally
          Htmlstr.Free;
          PriceList.Free;
          idHTTP.Free;
   end;

end;

procedure TForm1.getMinData(cName :string);
var
  SHTML, LnHTML,URL,iSql,sql,LdSql, dSql,CallDay: string ;
  i,CC,dd,sPage :integer;
  IdHTTP: TIdHTTP;
  StartDate, EndDate : TDate;
  GetList : TStringList;
  UrlItem,ATextData,MinSeq, SignUpDown:string;
  GetStream: TMemoryStream;
  ccode, company,Wsql :string;
  sosok, fDate,eDate,UPDOWNPRICE: string;
  GuraeTimeBuff,StartBuff,  HighBuff, LowBuff, EndBuff, GuraeBuff : TBytes;
  GuraeTime, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE : string;
  OldGuraeTime, OldEndPRICE,fileLoc, goodsql :string;
  StockF: TextFile;
begin


      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;


      try


          CC:=0;
          Sql := 'select * from Main_Comp where company=''' + cName +'''';


          FDQuery1.close;
          FDQuery1.sql.Clear;
          FDQuery1.sql.add(Sql);
          FDQuery1.Open;

          StartDate := DateTimePicker1.Date;
          EndDate :=StartDate;


          fileLoc := 'C:/STOCK_DATA/' + FormatDateTime('YYYYMMDD', StartDate) +'temp';
          AssignFile(StockF, fileLoc);
          Rewrite(StockF);

          if not FDQuery1.Eof then begin
              CCODE :=TRIM(FDQuery1.fieldvalues['ccode']);
              COMPANY :=TRIM(FDQuery1.fieldvalues['COMPANY']);
              sosok :=TRIM(FDQuery1.fieldvalues['sosok']);

                  CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

                  FDQuery2.close;
                  FDQuery2.sql.Clear;
                  dSql :='Delete from Stock_min where CCODE= ''' + CCODE + ''' AND DDATE ='''+ CallDay + '''';
                  FDQuery2.sql.add(dSql);
                  FDQuery2.ExecSQL;

                  UrlItem :='http://mobilestock.etomato.com/mobilestock/device/chart2.aspx?t=1&s=';
                  UrlItem := UrlItem +CCODE + '&d=' + CallDay + trim(edit18.text) +'00&n=391';
                  IdHTTP.Get(UrlItem,GetStream);
                  GetStream.Position := 0;
                  OldEndPRICE :='0';
                  while GetStream.Position < GetStream.Size do
                  begin

                       SetLength(GuraeTimeBuff, 12);
                       SetLength(StartBuff, 4);
                       SetLength(HighBuff, 4);
                       SetLength(LowBuff, 4);
                       SetLength(EndBuff, 4);
                       SetLength(GuraeBuff, 4);


                       GetStream.ReadBuffer(GuraeTimeBUFF, 12);
                       GetStream.Position  := GetStream.Position + 2;
                       GetStream.ReadBuffer(StartBuff, 4);
                       GetStream.ReadBuffer(HighBuff, 4);
                       GetStream.ReadBuffer(LowBuff, 4);
                       GetStream.ReadBuffer(EndBuff, 4);
                       GetStream.ReadBuffer(GuraeBuff, 4);


                       GuraeTime := TEncoding.ASCII.GetString(GuraeTimeBUFF);
                       EndPRICE := BytesToHex(EndBuff);

                       if (CallDay = copy(GuraeTime,1,8)) and (EndPRICE <> '') then begin
                           STARTPRICE := BytesToHex(StartBuff);
                           HIGHPRICE := BytesToHex(HighBuff);
                           LOWPRICE := BytesToHex(LowBuff);
                           GURAE := BytesToHex(GuraeBuff);

                              UPDOWNPRICE :=IntTostr(strtoInt(EndPRICE) -strToint(OldEndPRICE));
                              MinSeq := intTostr((strToint(copy(GuraeTime,9,2)) - 9) * 60 + strToint(copy(GuraeTime,11,2)));
                              SignUpDown := intTostr(Sign(StrToint(UPDOWNPRICE)));

                              LdSql :=','+ CCODE + ','+ CallDay + ','+ GuraeTime + ',' + STARTPRICE+ ',' + HIGHPRICE  + ',';
                              LdSql := LdSql + LOWPRICE + ',' + ENDPRICE +',' + GURAE +',' + sosok +',' + UPDOWNPRICE +',' + MinSeq +',' + SignUpDown ;



                              WriteLn(StockF,LdSql);
                       end;
                       OldEndPRICE:= EndPRICE;
                       if OldEndPRICE ='' then OldEndPRICE :='0';

                       GetStream.Position  := GetStream.Position + 4;
                 end;



                 GuraeTime:='';
                 EndPRICE :='';
                 GuraeTime :='';

                 StartDate :=IncDay(StartDate, 1);
              end;
              cc:=cc+1;

              LABEL2.Caption :=intTostr(cc);
              GetStream.Clear;
             // FDQuery1.Next;


          CloseFile(StockF);

          if FileExists(fileLoc) then
          begin
              FDQuery2.Close;
              FDQuery2.SQL.Text := 'BULK INSERT STOCK_MIN FROM ''' + fileLoc + ''' WITH (FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')';
              FDQuery2.ExecSQL;

              FDQuery2.Close;
              FDQuery2.sql.Clear;
              Wsql := 'UPDATE DAILY_KOSP SET GURAEWEIGHT = B.UPGURAE FROM DAILY_KOSP A JOIN (SELECT CCODE, DDATE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
              Wsql := Wsql + ' FROM STOCK_MIN GROUP BY CCODE, DDATE) B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE B.DDATE ='''+ CallDay + '''';
              Wsql := Wsql + ' AND B.CCODE=''' + edit1.Text +'''';
              FDQuery2.sql.add(Wsql);
              FDQuery2.ExecSQL;

          end;

      finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
      end;
end;

function Tform1.GetHTML(addr: string):string;
var
  i:longint;
  WebB: TWebBrowser;

begin
 TRY
   if addr='' then exit;

      WebBrowser1.Navigate(addr);

      WebBrowser1.Silent := True;
      while (WebBrowser1.ReadyState <> READYSTATE_COMPLETE ) do //and (timequit=false)   do
            Application.ProcessMessages;

      result:= WebBrowser1.OleObject.Document.DocumentElement.OuterHTML;  //Hdata;
  finally

  end;
end;


procedure TForm1.Theme_Call(Sender: TObject);
var
 sql : string;
begin

       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       listbox8.Clear;
       sql := 'SELECT * FROM Theme_Stock where CCODE =' + TRIM(EDIT1.TEXT);

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;
       if NOT ADOQuery2.Eof  then  begin
           Memo4.TEXT := ADOQuery2.fieldvalues['MainBigo'];
           Memo5.TEXT := ADOQuery2.fieldvalues['SubBigo'];
       end else begin
            Memo4.TEXT := '';
            Memo5.TEXT := '';
       end;


       while NOT ADOQuery2.Eof  do begin
          listbox8.Items.Add(ADOQuery2.fieldvalues['Maintitle']);// +'#'+ADOQuery2.fieldvalues['MainCode']);
          ADOQuery2.Next;
       end;

end;

procedure TForm1.Theme_Flow(Sender: TObject);
var
 sql,fDate : string;
begin

       fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);
       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       listbox9.Clear;
       sql := 'SELECT top 14 * FROM (SELECT A.DDATE, B.MAINTITLE, AVG(ISNULL(ROUND(((DAYGAP)/nullif(PREPRICE1,0)) * 100,2),0)) AS AVGTheme ';
       sql := sql + ' FROM DAILY_KOSP A INNER JOIN Theme_Stock B on(A.ccode =B.CCODE) WHERE  A.GURAE > 0 GROUP BY A.DDATE, B.MainTitle) X ';
       sql := sql + ' WHERE X.DDATE =''' + fDate + '''  ORDER BY X.DDATE, X.AVGTheme desc';

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;


       while NOT ADOQuery2.Eof  do begin
          listbox9.Items.AddObject(ADOQuery2.fieldvalues['Maintitle'] +#9+ FormatFloat('0.##', ADOQuery2.fieldvalues['AVGTheme']) + '% '+#9, Pointer(clRed));
          ADOQuery2.Next;
       end;


end;


procedure TForm1.Theme_Chart(item:string);
var
   sql,sql2,sql3, sql4, DD,compTable,fDate,fToDay,DealRate, JISU_INFO : string;
   itemName,LastVal,LastDay10, LastDay20,LastDay60,LastDay120 : string;
begin
   RadioButton1.Caption :='10일'; RadioButton2.Caption :='20일'; RadioButton3.Caption :='40일'; RadioButton4.Caption :='60일';
   RadioButton5.Caption :='120일'; RadioButton6.Caption :='240일'; RadioButton9.Caption :='3년'; RadioButton7.Caption :='5년'; RadioButton8.Caption :='8년';
   if item = '' then begin
 //
      edit21.Text  :=  itemName;
   end else  itemName :=item;


   Theme :=1;
 //  DBChart1.Legend.Visible :=false;
   DBChart1.Series[1].Visible := false; DBChart1.Series[2].Visible := false;  DBChart1.Series[3].Visible := false;  // DBChart1.Series[4].Visible := false; DBChart1.Series[5].Visible := false;   DBChart1.Series[6].Visible := false;
   DBChart1.Series[0].Title	:=itemName;
   DBChart1.Series[4].Title	:='10일';
   DBChart1.Series[5].Title	:='60일';
   DBChart1.Series[6].Title	:='120일';

 //  DBChart3.Legend.Visible :=false;
   DBChart3.Series[1].Visible := false; DBChart3.Series[2].Visible := false;  DBChart3.Series[3].Visible := false; //DBChart3.Series[4].Visible := false; DBChart3.Series[5].Visible := false; DBChart3.Series[6].Visible := false;  DBChart3.Series[6].Visible := false;
   DBChart3.Series[0].Title	:=itemName;
   DBChart3.Series[4].Title	:='10일';
   DBChart3.Series[5].Title	:='60일';
   DBChart3.Series[6].Title	:='120일';

   minTime :=0;
   ScrollBar1.Position :=0;
   if RadioButton1.Checked then  DD:='10'
   else if RadioButton2.Checked then DD:='20'
   else if RadioButton3.Checked then DD:='40'
   else if RadioButton4.Checked then DD:='60'
   else if RadioButton5.Checked then DD:='120'
   else if RadioButton6.Checked then DD:='240'
   else if RadioButton9.Checked then DD:='620'
   else if RadioButton7.Checked then DD:='1228'
   else if RadioButton8.Checked then DD:='1970';

   fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

   //BuyStop();

      fToDay:= formatdatetime('YYYYMMDD',now);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      sql :='SELECT * FROM (SELECT  DDATE, MainTitle, row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE DESC) AS ROW, FORMAT(SUMTheme,''###0'') AS ENDPRICE, AVGTheme, FORMAT(Day20,''###0'') AS Day20, ';
      sql := sql + ' FORMAT(Day60,''###0'')  AS Day60, FORMAT(Day120,''###0'') AS Day120,  ROUND(AVGTheme,2) AS  STARTPRICE,  ';
      sql := sql + ' AVGTheme AS HIGHPRICE, AVGTheme AS UPDOWN2, AVGTheme AS GURAE, AVGTheme AS GURAEWEIGHT, AVGTheme AS LOWPRICE ';
      sql := sql + ' FROM Theme_DATA WHERE MainTitle =''' + itemName +''' AND ddate <= ''' +fDate + ''') X ';
      sql := sql + ' WHERE X.ROW <= ' + DD + ' ORDER BY X.DDATE  ';

      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;


      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      sql2 :='SELECT * FROM (SELECT  DDATE, MainTitle, row_number() OVER (PARTITION BY MainTitle ORDER BY DDATE DESC) AS ROW, FORMAT(SUMTheme,''###0'') AS ENDPRICE, AVGTheme, FORMAT(Day20,''###0'') AS Day20, ';
      sql2 := sql2 + ' FORMAT(Day60,''###0'')  AS Day60, FORMAT(Day120,''###0'') AS Day120,  ROUND(AVGTheme,2) AS  STARTPRICE,  ';
      sql2 := sql2 + ' AVGTheme AS HIGHPRICE, AVGTheme AS UPDOWN2, AVGTheme AS GURAE, AVGTheme AS GURAEWEIGHT, AVGTheme AS LOWPRICE ';
      sql2 := sql2 + ' FROM Theme_DATA WHERE MainTitle =''' + itemName +''' AND ddate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''') X ORDER BY X.DDATE ';


      ADOQuery3.SQL.Add(sql2);
      ADOQuery3.Open;
      ADOQuery3.Last;
      ADOQuery3.Tag :=1;


end;


procedure TForm1.Theme_list(item:string);
var
 sql, sql2, itemName, fDate, itemCode : string;
 CCODE,DateGap, todayDate,goodsql : string;
 ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
 myDate : TDateTime;
 StartDate, EndDate : TDate;
begin

       if checkbox3.Checked  then
          goodsql :=' AND A.ENDPRICE > 1000 '; //and C.SaleAmount > 0 and  C.SalesProfit > 10 ';  //and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6';

       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       itemName :=item ;
    //   itemCode :=  copy(itemName, POS('#', itemName)+1, length(itemName)-POS('#', itemName));

       fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

       sql := 'Select A.ccode, A.ddate, A.ENDPRICE, C.company,B.MainBigo, B.subBigo, ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' from  DAILY_KOSP A INNER JOIN Theme_Stock B ON(A.CCODE =B.CCODE)';
       sql := sql + ' INNER JOIN Main_comp C on(A.CCODE = C.CCODE) WHERE  B.MainTitle=''' + itemName + ''' AND A.GURAE > 0 '+ goodsql + ' AND A.DDATE =''' + fDate +''' ORDER BY ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) DESC';

       listbox7.Clear;
       listbox1.Clear;
       listbox2.Clear;
       listbox3.Clear;
       listbox4.Clear;

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;
       if NOT ADOQuery2.Eof then begin
          Memo4.TEXT := ADOQuery2.fieldvalues['MainBigo'];
           Memo5.TEXT := ADOQuery2.fieldvalues['SubBigo'];
       end;

       while NOT ADOQuery2.Eof  do begin

            ENDPRICE :=ADOQuery2.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(ADOQuery2.fieldvalues['CCODE']);
            myDate := STRTODATE(COPY(fDate,1,4)+'-'+ COPY(fDate,5,2)+'-'+COPY(fDate,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);
            DateGap := trim(EDIT16.TEXT);

            listbox7.Items.Add(ADOQuery2.fieldvalues['ddate']);
            listbox1.Items.Add(ADOQuery2.fieldvalues['ccode']);
       //     listbox2.Items.Add(ADOQuery2.fieldvalues['company']);
            listbox3.items.Add(FormatFloat('0.##', ADOQuery2.fieldvalues['UPDOWN2']) + '%');

            sql2 :='SELECT TOP 1 LAST_VALUE(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE  ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) as ENDPRICE2, ';
            sql2 :=sql2 + ' MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND ' + DateGap + ' FOLLOWING) AS ENDMAX,';
            sql2 :=sql2 + ' MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE ROWS BETWEEN CURRENT ROW AND  ' + DateGap + '  FOLLOWING) AS ENDMIN, SOSOK FROM ';
            sql2 :=sql2 + ' DAILY_KOSP WHERE CCODE =''' + CCODE +''' and ddate >=  ''' + fDate +''' Order by ddate';

            FDQuery2.Close;
            FDQuery2.SQL.Clear;
            FDQuery2.SQL.Add(sql2);
            FDQuery2.Open;
            ENDPRICE2 :=FDQuery2.fieldvalues['ENDPRICE2'];
            ENDMAX :=FDQuery2.fieldvalues['ENDMAX'];
            ENDMIN :=FDQuery2.fieldvalues['ENDMIN'];

                 if ENDMAX > ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDMAX-ENDPRICE)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end else if ENDMAX = ENDPRICE then begin
                   listbox4.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                 end else begin
                   listbox4.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                 end;

                 if FDQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(ADOQuery2.fieldvalues['COMPANY']))
                 ELSE  ListBox2.Items.AddObject(TRIM(ADOQuery2.fieldvalues['COMPANY']), Pointer(clGreen));

            ADOQuery2.Next;

       end;



end;

procedure TForm1.Theme_SUM(aALL:integer);
var
 sql,fDate,dSql, TOPSTR : string;
begin

       fDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

       IF (aALL = 1)  then begin
          TOPSTR :='';
          ADOQuery2.close;
          ADOQuery2.sql.Clear;
          dSql :='Delete from THEME_DATA ';
          ADOQuery2.sql.add(dSql);
          ADOQuery2.ExecSQL;
       END ELSE begin
          TOPSTR :=''; // WHERE Z.DDATE =''' + fDate + '''';
          ADOQuery2.close;
          ADOQuery2.sql.Clear;
          dSql :='Delete from THEME_DATA '; // WHERE DDATE =''' + fDate + '''';
          ADOQuery2.sql.add(dSql);
          ADOQuery2.ExecSQL;
       end;


       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       sql := 'INSERT into THEME_DATA (DDATE, MainTitle, AVGTheme, SUMTheme, DAY20,DAY60,DAY120) (SELECT * FROM (SELECT DDATE, MainTitle, AVGTheme, AVGSUM,';
       sql := sql + ' AVG(AVGSUM) OVER (PARTITION BY MainTitle ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 9 FOLLOWING) AS DAY10, AVG(AVGSUM) OVER (PARTITION BY MainTitle ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 19 FOLLOWING) AS DAY60, ';
       sql := sql + ' AVG(AVGSUM) OVER (PARTITION BY MainTitle ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 59 FOLLOWING) AS DAY120  ';
       sql := sql + ' FROM (SELECT X.ROW, X.DDATE, X.MainTitle, X.AVGTheme, SUM(AVGTheme) OVER (PARTITION BY MainTitle ORDER BY DDATE) * 1000 AS AVGSUM ';
       sql := sql + ' FROM (SELECT row_number() OVER (PARTITION BY B.MainTitle ORDER BY DDATE DESC) AS ROW, A.DDATE, B.MAINTITLE, ROUND(AVG(ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0)),3) AS AVGTheme  ';
       sql := sql + ' FROM DAILY_KOSP A INNER JOIN Theme_Stock B on(A.CCODE = B.CCODE) WHERE A.DDATE > ''20140101'' AND ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) <=30  ';
       sql := sql + ' AND ISNULL(ROUND(((A.DAYGAP)/nullif(A.PREPRICE1,0)) * 100,2),0) >=-30  ';
       sql := sql + ' GROUP BY A.DDATE, B.MainTitle ) X WHERE X.DDATE <=''' + fDate + ''' ) Y ) Z ' + TOPSTR +' ) ';

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.ExecSQL;

end;

procedure TForm1.CHART_FLOW_INSERT(STARTDT : STRING);
var
 sql,fDate,dSql, TOPSTR : string;
begin

          ADOQuery2.close;
          ADOQuery2.sql.Clear;
          dSql :='Delete from CHART_FLOW WHERE STARTDT = ''' + STARTDT + '''';
          ADOQuery2.sql.add(dSql);
          ADOQuery2.ExecSQL;


       //   ADOQuery2.Close;
       //   ADOQuery2.SQL.Clear;
       //   sql := 'EXEC [dbo].[FLOW_PTN_INSERT] '''',+''' + STARTDT +''',''' + STARTDT + '''';

          FDStoredProc1.ExecProc('FLOW_PTN_INSERT', ['', STARTDT, STARTDT]);


end;

procedure TForm1.TempCopy();
var
i : integer;

begin
   memo1.Clear;  memo6.Clear ; memo7.Clear;
   if listbox3.Count = 0 then exit;

   for i := 0 to listbox3.Count-1 do
   begin
        memo1.Lines.Add(listbox3.Items.Strings[i]);
        memo6.Lines.Add(listbox4.Items.Strings[i]);
        memo7.Lines.Add(memo2.Lines[i])
   end;

 //  ClipBoard.SetTextBuf(pChar(memo1.Lines.Text));
end;

procedure TForm1.TempPaste();
var
i : integer;

begin
   if memo1.Lines.Count =0 then exit;

   listbox3.Clear;
   listbox4.Clear;
   memo2.Clear;

   for i := 0 to memo1.Lines.Count-1 do
   begin
        listbox3.Items.Add(memo1.lines[i]);
        listbox4.Items.Add(memo6.lines[i]);
        memo2.Lines.Add(memo7.Lines[i])
   end;
   memo1.Clear;
   memo6.Clear;
   memo7.Clear;
end;

procedure TForm1.BuyStop();
var
 sql, sDate,JISU_INFO : string;
begin

       sDate := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

       ADOQuery2.Close;
       ADOQuery2.SQL.Clear;
       sql := 'SELECT A.CCODE, B.COMPANY + '': '' + FORMAT(A.ENDPRICE * 0.01,''##0.##'') +''('' + FORMAT(ROUND(ISNULL(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,0),2),''##0.##'') +''%)''  AS JISU_INFO ';
       sql :=  sql + 'FROM DAILY_KOSP A INNER JOIN main_comp B ON(A.CCODE =B.CCODE) WHERE A.CCODE IN(''990001'',''996001'', ''990413'',''990408'',''990410'') AND A.DDATE= ''' + sDate +'''';

       ADOQuery2.SQL.Add(sql);
       ADOQuery2.Open;
       while NOT ADOQuery2.Eof  do begin
          JISU_INFO := JISU_INFO + ADOQuery2.fieldvalues['JISU_INFO'] + ' / ';
          ADOQuery2.Next;
       end;
       FORM1.Caption := JISU_INFO;
       memo3.Text :=   JISU_INFO;


       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       sql := 'SELECT ROUND(DAYGAP * 0.01 / nullif(((ENDPRICE - DAYGAP)*0.01),0) * 100,2) AS BUYSTOCK,  ROUND((LOWPRICE - DAY20) * 0.01 / nullif(((DAY20)*0.01),0) * 100,2) AS STOPBUY ';
       sql := sql + ' FROM [dbo].[DAILY_KOSP] where ccode =''996001'' AND DDATE = ''' + sDate +'''';
       FDQuery1.SQL.Add(sql);
       FDQuery1.Open;
       IF NOT FDQuery1.Eof THEN
       BEGIN
           IF FDQuery1.fieldvalues['STOPBUY'] < -1.8 THEN BEGIN
                IF FDQuery1.fieldvalues['BUYSTOCK'] < -3.36 THEN
                   MEMO3.Font.Color :=clBlue
                ELSE
                   MEMO3.Font.Color :=clRed;
           END ELSE IF FDQuery1.fieldvalues['STOPBUY'] < 0 THEN BEGIN
                MEMO3.Font.Color :=clWebperu;
           END ELSE
                MEMO3.Font.Color :=clBlack;
       end;
end;



end.
