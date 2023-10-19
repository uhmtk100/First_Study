unit market_analysis;

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
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type

  TForm2 = class(TForm)
    DBChart1: TDBChart;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Series3: TLineSeries;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ADOQuery1: TADOQuery;
    Series4: TLineSeries;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
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
    Series5: TLineSeries;
    LineSeries7: TLineSeries;
    FDConnectionMysql1: TFDConnection;
    FDQueryMysql1: TFDQuery;
    Button13: TButton;
    LineSeries10: TBarSeries;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    DBChart4: TDBChart;
    LineSeries8: TLineSeries;
    LineSeries9: TLineSeries;
    LineSeries11: TLineSeries;
    LineSeries12: TLineSeries;
    LineSeries13: TLineSeries;
    DBChart6: TDBChart;
    BarSeries1: TBarSeries;
    LineSeries14: TLineSeries;
    DBChart7: TDBChart;
    LineSeries15: TLineSeries;
    LineSeries16: TLineSeries;
    LineSeries17: TLineSeries;
    LineSeries18: TLineSeries;
    LineSeries19: TLineSeries;
    DBChart8: TDBChart;
    BarSeries2: TBarSeries;
    LineSeries20: TLineSeries;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
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

  private
    { Private declarations }
  public
    { Public declarations }
    HtmlMemo: TMemo;
  end;

var
  Form2: TForm2;
  Urladd:string;
  cc:longint;
  timequit:boolean;
  standTime : Tdate;
  comStockTotal : longint;
  minTime : integer;
  PassButton : integer;

implementation

{$R *.dfm}

uses analisys;


procedure TForm2.Button11Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE : string;
   CCODE, ddStr, todayDate : string;
   dd, dcc : integer;
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
      goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 and C.DEBTTOTAL <= C.SALEAMOUNT * 0.55 ';


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
       sql := sql + ' WHERE A.TGURAE > 500000 AND A.UPGURAE > 1 AND A.TGURAE < 11 * A.UPGURAE AND A.TGURAE > 4 * B.GURAE40' ;
       sql := sql + ' AND ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) < ' + EDIT14.Text ;
       sql := sql + ' AND B.ENDPRICE < B.MAX240 AND B.ENDPRICE > B.DAY20 '  ;
       sql := sql +  goodsql;

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

          myDate :=StartDate; // STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
          myDate := IncDay(myDate, strToint(EDIT16.TEXT));
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
              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
              ELSE ListBox2.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX3.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));

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

procedure TForm2.Button12Click(Sender: TObject);
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

procedure TForm2.Button13Click(Sender: TObject);
var
   sql,sql2,compTable,fDate,fTime,DealRate,CCODE,EndDate : string;
   gubun : string;
   DD,TT : integer;
begin
   RadioButton1.Caption :='10분'; RadioButton2.Caption :='20분'; RadioButton3.Caption :='30분'; RadioButton4.Caption :='1시간';
   RadioButton5.Caption :='2시간'; RadioButton6.Caption :='4시간'; RadioButton9.Caption :='1일';



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
      FORM2.Caption :=ADOQuery2.fieldvalues['COMPANY'];
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
    //  sql :='SELECT A.CCODE, CONCAT(SUBSTRING(A.ALLTIME,1,10) , SUBSTRING(A.ALLTIME,11,2)) AS DDATE, A.STARTPRICE, A.ENDPRICE  AS DAY20, SUM(PMGURAE) AS GURAE, ';
    //  sql := sql + ' A.ENDPRICE, MAX(A.HIGHPRICE) AS HIGHPRICE, MIN(A.LOWPRICE) AS LOWPRICE FROM (select CCODE, DDATE, ALLTIME, ';
    //  sql := sql + 'FIRST_VALUE(STARTPRICE) OVER (PARTITION BY CONCAT(SUBSTRING(ALLTIME,1,10) , SUBSTRING(ALLTIME,11,2)) ORDER BY ALLTIME) AS STARTPRICE, ';
    //  sql := sql + ' FIRST_VALUE(ENDPRICE)   OVER (PARTITION BY CONCAT(SUBSTRING(ALLTIME,1,10) , SUBSTRING(ALLTIME,11,2)) ORDER BY ALLTIME DESC) AS ENDPRICE, ';
    //  sql := sql + ' HIGHPRICE,LOWPRICE,GURAE * SIGN(UPDOWNPRICE) AS PMGURAE FROM STOCK_MIN WHERE CCODE=''900280'' AND  DDATE = ''20170727'') A ';
    //  sql := sql + ' GROUP BY A.CCODE, A.DDATE,CONCAT(SUBSTRING(A.ALLTIME,1,10) , SUBSTRING(A.ALLTIME,11,2)), A.STARTPRICE, A.ENDPRICE ';

      sql :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, A.UPDOWNPRICE, A.ENDPRICE AS DAY20, ';
      sql :=sql + ' B.GURAE AS GTOTAL FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE = ''' + fDate + ''' AND ';
      sql :=sql + ' A.ALLTIME >= CONCAT(''' + fTime + ''' +(' + intTostr(TT) + ')/60 , ''00'' + (' + intTostr(TT) + ')%60) ';
      sql :=sql + ' AND A.ALLTIME <= CONCAT(''' + fTime + ''' +' + intTostr(DD + TT) + '/ 60 , ''00'' + ' + intTostr(DD + TT) + '%60) ORDER BY A.ALLTIME';

      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

      // if not ADOQuery1.Eof  then begin
        if (minTime =0) AND (ADOQuery3.Tag = 1)  then begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            sql2 :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, SUM(A.GURAE * SIGN(A.UPDOWNPRICE)) OVER (PARTITION BY A.CCODE) AS UPGURAE, A.UPDOWNPRICE, A.ENDPRICE AS DAY20, ';
            sql2 :=sql2 + ' B.GURAE AS GTOTAL FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE BETWEEN ''' + fDate + ''' AND ''' + EndDate +''' ORDER BY A.ALLTIME';
            ADOQuery3.SQL.Add(sql2);
            ADOQuery3.Open;
            ADOQuery3.Last;
            if ADOQuery1.fieldvalues['ENDPRICE'] <> null then EDIT6.Text := FormatFloat('#,###', ADOQuery3.fieldvalues['UPGURAE']);
            ADOQuery3.Tag :=0;
        end;

        if ADOQuery1.fieldvalues['ENDPRICE'] <> null then begin
           EDIT5.Text :=FormatFloat('#,###',ADOQuery1.fieldvalues['ENDPRICE']);
           EDIT10.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['HIGHPRICE']);
        end;
   end;

end;

procedure TForm2.Button14Click(Sender: TObject);
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

procedure TForm2.Button1Click(Sender: TObject);
var
   sql,sql2,DD,compTable,fDate,fToDay,DealRate : string;
   gubun : string;
begin
   RadioButton1.Caption :='10일'; RadioButton2.Caption :='20일'; RadioButton3.Caption :='40일'; RadioButton4.Caption :='60일';
   RadioButton5.Caption :='120일'; RadioButton6.Caption :='240일'; RadioButton9.Caption :='3년'; RadioButton7.Caption :='5년'; RadioButton8.Caption :='8년';

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



   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + trim(edit1.Text) +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin
      Listbox6.Clear;
      FORM2.Caption :=ADOQuery2.fieldvalues['COMPANY'];
      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];
     // memo2.Lines.Add(ADOQuery2.fieldvalues['COMPANY']);
      gubun  :=ADOQuery2.fieldvalues['sosok'];
      compTable := 'DAILY_KOSP';
      fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      fToDay:= formatdatetime('YYYYMMDD',now);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      sql :='SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql := sql + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, DDATE,DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE FROM ' + compTable + ' WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND DDATE <=  ''' + fDate +''' ) A ';      // DDATE <= convert(varchar, getdate(), 112)
      sql := sql + ' WHERE A.ROW < ' + DD + ' and ddate <=''' +fDate + ''' order by ddate';
      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      sql2 :='Select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql2 := sql2 + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, DDATE, DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE FROM ' + compTable + ' WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(EDIT1.TEXT) + '''  AND ';      // DDATE <= convert(varchar, getdate(), 112)
      sql2 := sql2 + ' DDate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''' order by ddate';
      ADOQuery3.SQL.Add(sql2);
      ADOQuery3.Open;
      ADOQuery3.Last;
      ADOQuery3.Tag :=1;



      EDIT5.Text :=FormatFloat('#,###',ADOQuery1.fieldvalues['ENDPRICE']);
//      EDIT6.Text :=FormatFloat('0.##',ADOQuery1.fieldvalues['UPDOWN'])+ '%';
      EDIT10.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['HIGHPRICE']);
      EDIT11.Text := FormatFloat('0.##', ADOQuery1.fieldvalues['UPDOWN2']) + '%';
      EDIT9.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['GURAE']);
      EDIT15.Text := FormatFloat('#,###', ADOQuery1.FieldByName('ENDPRICE').AsInteger - ADOQuery1.FieldByName('DAYGAP').AsInteger);
      if ADOQuery1.fieldvalues['GURAEWEIGHT'] <> null then EDIT6.Text :=FormatFloat('#,###', ADOQuery1.fieldvalues['GURAEWEIGHT']);
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

procedure TForm2.Button2Click(Sender: TObject);
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
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.55 ';


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

procedure TForm2.Button3Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql, dSql: string ;
  i,j,k,n,m,cc:integer;
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
    URL:='https://finance.naver.com/sise/sise_market_sum.nhn?';
    for j:=1 to 30 do begin

        SHTML := GetHTML(URL+'sosok='+inttostr(k)+'&page='+inttostr(j));
        HtmlMemo.Text :=SHTML;
        for i:=0 to HtmlMemo.Lines.Count do begin
              LnHTML :=HtmlMemo.Lines[i];
              if  pos('<TD><A class=tltle href="/item/main.nhn?code=', LnHTML) > 0 then begin
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
                     DEBTRATIO := FORMATFLOAT('#.##',(strToint(DebtTotal) * 100) / (strToint(PROPERTY_TOTAL) - strToint(DebtTotal)));
                  end;
                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  dSql :='delete from Main_Comp where ccode=''' + ccode + '''';
                  ADOQuery2.sql.add(dSql);
                  ADOQuery2.ExecSQL;

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  iSql := 'insert into Main_Comp(ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, SaleAmount,DebtTotal,';
                  iSql := iSql + ' SalesProfit, StockProfit, ForeignRate,PER,ROE,ROA,PBR,RESERVE_RATIO,PSR,DEBTRATIO,sosok) Values(''' + ccode + ''','''+ company + ''','+curPrice+','+prePrice+','+upDown;
                  iSql := iSql +','+orgPrice+','+TotalStock+','+ DealAmount+','+ SaleAmount+','+DebtTotal+','+SalesProfit+','+ StockProfit+','+ ForeignRate+','+ PER+','+ ROE+','+ ROA+','+ PBR+','+ RESERVE_RATIO+','+ PSR+','+ DEBTRATIO+','+inttostr(k)+')';
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

procedure TForm2.Button4Click(Sender: TObject);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, CallDay, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 i,cc:integer;
 GetList : TStringList;
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

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;

      cc:=0;


      if checkbox1.Checked  then
         Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''
      else Sql := 'select * from Main_Comp order by ccode';
      StartDate := DateTimePicker1.Date;
      EndDate :=StartDate;
      if checkbox6.Checked  then begin
         EndDate :=DateTimePicker2.Date;
      end;

   try
      ADOQuery4.close;
      ADOQuery4.sql.Clear;
      ADOQuery4.sql.add(Sql);
      ADOQuery4.Open;
      Progressbar1.Max := ADOQuery4.Recordcount;

      while not ADOQuery4.Eof do begin
          CCODE :=TRIM(ADOQuery4.fieldvalues['ccode']);
          SOSOK :=TRIM(ADOQuery4.fieldvalues['sosok']);
          StartDate := DateTimePicker1.Date;

//          while StartDate <= EndDate  do
//          begin
                   CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

                   if DAYOFTHEWEEK(StartDate) > 5 then begin
                       StartDate :=IncDay(StartDate, 1);
                       Continue;
                   end;
                   URL:='http://mobilestock.etomato.com/mobilestock/device/chart2.aspx?t=d&s=' + CCODE +'&d='+ CallDay + '&n=' + trim(edit3.text);
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

procedure TForm2.Button5Click(Sender: TObject);
var
   sql,sql3,CCODE, fDate, eDate,todayDate,ddStr,SOSOK, compTable,goodsql : string;
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
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.5';

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

          compTable := 'DAILY_KOSP';


          sql := 'SELECT B.COMPANY, A.CCODE AS CCODE, A.ENDPRICE AS ENDPRICE, ROUND(A.UPDOWN,2) AS UPDOWN,ROUND(A.UPDOWN2,2) AS UPDOWN2, A.SOSOK  FROM (SELECT  CCODE,';
          sql := sql + ' ((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100 AS UPDOWN, ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2,';
          sql := sql + ' ENDPRICE, SOSOK FROM '+ compTable +' WHERE DDATE = ''' + ddStr + ''' ) A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) ';
          if STRTOINT(EDIT4.TEXT) < 0 then sql := sql + ' WHERE A.UPDOWN2 <= ' + EDIT4.TEXT + goodsql + ' ORDER BY A.SOSOK, A.UPDOWN2 DESC '
          else  sql := sql + ' WHERE A.UPDOWN2 >= ' + EDIT4.TEXT + goodsql + ' ORDER BY A.SOSOK, A.UPDOWN DESC ';

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


              sql3 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
              sql3 :=sql3 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN FROM ';
              sql3 :=sql3 +  compTable + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + ddStr + ''' and '''+ todayDate +'''';
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

procedure TForm2.Button6Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2 : string;
   CCODE, ddStr, todayDate,goodsql : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
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
      goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.5';

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


			   if checkbox2.Checked  then  begin
         //  if RadioButton2.Checked then begin
               sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ';
               sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
               sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE  A.DDATE=''' + ddStr + ''' AND DAY20COUNT < 20 - ' + EDIT7.Text+ goodsql +') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.SOSOK, X.UPDOWN';
         //  end else if RadioButton3.Checked then begin
         //      sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ';
         //      sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT';
         //      sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE  B.SalesProfit > 10 and B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.5 AND A.DDATE=''' + ddStr + ''' AND DAY40COUNT < 40 - ' + EDIT7.Text+ ') X WHERE X.UPDOWN < ' + edit12.Text + ' ORDER BY X.SOSOK, X.UPDOWN';
        //   end;

        end else begin
         //  if RadioButton2.Checked then begin
               sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.VSTDEV, A.DAY10, ';
               sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT, A.SOSOK';
               sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE A.DDATE=''' + ddStr + ''' AND DAY20COUNT > ' + EDIT7.Text + goodsql ;
               sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY20SUM <> 0 ) X WHERE X.UPDOWN <> 0 ORDER BY X.SOSOK, X.UPDOWN DESC, VSTDEV ';
        //   end else if RadioButton3.Checked then begin
        //       sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE,  A.VSTDEV, A.DAY10,';
        //       sql := sql + ' ISNULL(ROUND((A.DAY40SUM/nullif((ENDPRICE-DAY40SUM),0)) * 100,2),0) AS UPDOWN, DAY40COUNT, SOSOK';
        //       sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE B.SalesProfit > 10 and B.CurPrice > 1000 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.5 AND A.DDATE=''' + ddStr + ''' AND DAY40COUNT > ' + EDIT7.Text;
        //       sql := sql + ' AND VSTDEV < ' + EDIT8.Text + ' AND ENDPRICE >=DAY10 AND VSTDEV <> 0 AND DAY40SUM <> 0 ) X WHERE X.SOSOK, X.UPDOWN <> 0 ORDER BY X.UPDOWN DESC, VSTDEV  ';
         //  end;

        end;


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

            sql4 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
            sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN, SOSOK FROM ';
            sql4 :=sql4 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + ddStr + ''' and '''+ todayDate +'''';
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

procedure TForm2.Button7Click(Sender: TObject);
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
      goodsql :=' AND D.SaleAmount > 0 and  D.SalesProfit > 10 and D.DEBTTOTAL <= D.SALEAMOUNT * 0.55 ';


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

procedure TForm2.Button8Click(Sender: TObject);
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

procedure TForm2.Button9Click(Sender: TObject);
begin
   PassButton :=1;
   Checkbox1.Checked  :=false;
   if checkbox7.Checked  then begin
       Button3Click(nil);
       Button4Click(nil);
       Button10Click(nil);

   end else begin
       button4click(nil);
       Button10Click(nil);
   end;

   Button11Click(nil);
   PassButton :=0;
end;

procedure TForm2.DateTimePicker1Change(Sender: TObject);
begin
   standTime :=DateTimePicker1.Date ;
   ADOQuery3.Tag := 1
end;

procedure TForm2.DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  UPDOWN, GTOTAL,UPDOWN2, STPRICE : string;
begin
  SeriesIndex := DBChart1.Series[0].Clicked(X, Y);

  DBChart1.ShowHint := SeriesIndex <> -1;
  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart1.ShowHint then
  begin
    ADOQuery1.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
      if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery1.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery1.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        DBChart1.Hint := ADOQuery1.FieldByName('ENDPRICE').AsString +'(' + UPDOWN2 +')/' + ADOQuery1.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN +'%)/'+ GTOTAL + '/' + ADOQuery1.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery1.FieldByName('LOWPRICE').AsString;
      end else begin
        DBChart1.Hint := ADOQuery1.FieldByName('ENDPRICE').AsString + '('+ADOQuery1.FieldByName('UPDOWN2').AsString +'%)/'+ ADOQuery1.FieldByName('STARTPRICE').AsString +'/' + ADOQuery1.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery1.FieldByName('LOWPRICE').AsString;
      end;

  end;
end;

procedure TForm2.DBChart2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1,DayGurae: Integer;
  GTOTAL,UPDOWN,UPDOWN2,STPRICE : string;
begin
  SeriesIndex1 := DBChart2.Series[0].Clicked(X, Y);

  DBChart2.ShowHint := SeriesIndex1 <> -1;
  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart2.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }

    if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery3.FieldByName('GURAE').AsInteger / ADOQuery3.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery3.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery3.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        DBChart2.Hint :=ADOQuery3.FieldByName('LOWPRICE').AsString + '(' + UPDOWN2 +')/' + ADOQuery3.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN + ')/' + ADOQuery3.FieldByName('GURAE').AsString  + '(' + GTOTAL +')' ;
    end else begin
       DayGurae := ADOQuery3.FieldByName('GURAE').Value;
       DBChart2.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ')';
    end;
  end;

end;

procedure TForm2.DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
  GTOTAL, UPDOWN,UPDOWN2,STPRICE :string;
begin
  SeriesIndex := DBChart3.Series[0].Clicked(X, Y);

  DBChart3.ShowHint := SeriesIndex <> -1;
  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart3.ShowHint then
  begin
    ADOQuery3.RecNo := SeriesIndex+1; { this may need to be SeriesIndex + 1 }
      if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery3.FieldByName('GURAE').AsInteger / ADOQuery3.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery3.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery3.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery3.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        DBChart3.Hint := ADOQuery3.FieldByName('ENDPRICE').AsString +'(' + UPDOWN2 +')/' + ADOQuery3.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN +'%)/'+ GTOTAL + '/' + ADOQuery3.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery3.FieldByName('LOWPRICE').AsString;
      end else begin
        DBChart3.Hint := ADOQuery3.FieldByName('ENDPRICE').AsString + '('+ADOQuery3.FieldByName('UPDOWN2').AsString +'%)/'+ ADOQuery3.FieldByName('STARTPRICE').AsString +'/' + ADOQuery3.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery3.FieldByName('LOWPRICE').AsString;
      end;

  end;

end;

procedure TForm2.DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex1,DayGurae: Integer;
  GTOTAL,UPDOWN,UPDOWN2,STPRICE: string;
begin
  SeriesIndex1 := DBChart5.Series[0].Clicked(X, Y);

  DBChart5.ShowHint := SeriesIndex1 <> -1;
  STPRICE := StringReplace(edit15.Text, ',', '',[rfReplaceAll, rfIgnoreCase]);
  if DBChart5.ShowHint then
  begin
    ADOQuery1.RecNo := SeriesIndex1+1; { this may need to be SeriesIndex + 1 }

    if RadioButton1.Caption ='10분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery1.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery1.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        DBChart5.Hint := ADOQuery1.FieldByName('LOWPRICE').AsString +'(' + UPDOWN2 +')/'+ ADOQuery1.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN + ')/' + ADOQuery1.FieldByName('GURAE').AsString  + '(' + GTOTAL +')' ;
    end else begin
       DayGurae := ADOQuery1.FieldByName('GURAE').Value;
       DBChart5.Hint := FormatFloat('##,###,##0',DayGurae ) + '(' +  FormatFloat('##0.##',DayGurae / (comStockTotal*10 ) ) + ')';

    end;
  end;


end;

procedure TForm2.Edit1DblClick(Sender: TObject);
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

procedure TForm2.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TForm2.Edit2DblClick(Sender: TObject);
begin
    MEMO2.Lines.Add(EDIT2.Text);
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm2.FormCreate(Sender: TObject);
var
   con_string :string;
begin
 DateTimePicker1.DateTime :=now;
 DateTimePicker2.DateTime :=now;
 standTime :=now;
 //edit9.text := formatdatetime('YYYYMMDDhhmm',now);
 ListBox2.Style := lbOwnerDrawFixed;
 con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
 con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';
 ADOConnection1.ConnectionString := con_string;
 DBChart1.Title.Text.Clear;
 DBChart5.Title.Text.Clear;
 DBChart3.Title.Text.Clear;
 DBChart2.Title.Text.Clear;


end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
    HtmlMemo.Free;
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
   edit1.Text := listbox1.items[listbox1.itemindex];;
   Button1Click(nil);
end;

procedure TForm2.ListBox2Click(Sender: TObject);
var
  chDate : string;
  futureDate : TDateTime;
begin
      edit1.Text := listbox1.items[listbox2.itemindex];
      chDate:= listbox7.items[listbox2.itemindex];
      if chDate <> '----------' then begin
          DateTimePicker1.Date  := StrToDate(copy(chDate,1,4) +'-'+ copy(chDate,5,2) +'-' +copy(chDate,7,2));
          futureDate := IncDay(DateTimePicker1.Date , strToint(EDIT16.TEXT));
          label2.Caption :=  DateToStr(futureDate);;
          Button1Click(nil);
      end;
end;

procedure TForm2.ListBox2DblClick(Sender: TObject);
var
  IE: OleVariant;
  ccode : string;
begin
  try
    IE:=CreateOleObject('Internetexplorer.Application');
    IE.Left:=0;
    IE.Top :=0;
    IE.Width :=1024;
    IE.Height:=800;

    IE.Toolbar  :=False;
    IE.Statusbar:=False;
    IE.Menubar  :=False;

    IE.Visible:=True;
    SetForegroundWindow(IE.HWND);
    ccode := listbox1.items[listbox2.itemindex];
    IE.Navigate('http://finance.naver.com/item/fchart.nhn?code='+ ccode);
  finally
    IE:=Unassigned;
  end;


//      listbox4.items.Add(listbox2.items[listbox2.itemindex]);
end;

procedure TForm2.ListBox2DrawItem(Control: TWinControl; Index: Integer;
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

procedure TForm2.ListBox7DblClick(Sender: TObject);
begin
   edit1.Text := listbox7.items[listbox7.itemindex];;
   Button1Click(nil);
end;

procedure TForm2.Memo1DblClick(Sender: TObject);
begin
   edit1.Text := memo1.Text;
   memo1.SetFocus;
   Button1Click(nil);
end;

procedure TForm2.Memo2DblClick(Sender: TObject);
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



procedure TForm2.RadioButton4Click(Sender: TObject);
begin
    ScrollBar1.Position :=0;
    if RadioButton1.Caption ='10분' then  Button13Click(nil)
    else Button1Click(nil);

end;

procedure TForm2.ScrollBar1Change(Sender: TObject);
begin
    if RadioButton1.Caption ='10분' then begin
       minTime := ScrollBar1.Position ;
       Button13Click(nil);
    end else begin
       DateTimePicker1.Date := standTime +  ScrollBar1.Position ;
       Button1Click(nil);
    end;

end;

procedure TForm2.Series1BeforeDrawValues(Sender: TObject);
begin
   //DBChart1.Series[0].  .YValue[3]:=1000;
end;



function TForm2.GetData(Fstr:string; Lstr:string; memoln :string):string;
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

function TForm2.GetHTML2(addr2: string):TMemoryStream;
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


procedure TForm2.Button10Click(Sender: TObject);
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
  GuraeTime, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE : string;
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
       //   if checkbox3.Checked  then
       //      goodsql :=' where SaleAmount > 0 and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.5'
       //   else
          goodsql :='  where SaleAmount > 0 ';   // AND CCODE not in(select cCode from main_comp where SaleAmount > 0 and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.5)';      // AND CCODE not in(select cCode from STOCK_TEMP)

          if checkbox1.Checked  then  Sql := 'select * from Main_Comp where ccode=''' + edit1.Text +''''
          else Sql := 'select * from Main_Comp ' + goodsql + ' order by ccode';


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
                  UrlItem := UrlItem +CCODE + '&d=' + CallDay +'153000&n=391';
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
                          //    FDQueryMysql1.close;
                          //    FDQueryMysql1.sql.Clear;
                          //    iSql := 'insert into Stock_Min (CCODE, DDATE, ALLTIME, STARTPRICE, HIGHPRICE,LOWPRICE,ENDPRICE,GURAE,sosok,UPDOWNPRICE) ';
                          //    iSql := iSql + ' Values(''' + CCODE + ''','''+ CallDay + ''','+ GuraeTime + ',' + STARTPRICE+ ',' + HIGHPRICE  + ',';
                          //    iSql := iSql + LOWPRICE + ',' + ENDPRICE +',' + GURAE +',' + sosok +',' + UPDOWNPRICE +')';
                          //    FDQueryMysql1.sql.add(iSql);
                         //     FDQueryMysql1.ExecSQL;

                              LdSql :=','+ CCODE + ','+ CallDay + ','+ GuraeTime + ',' + STARTPRICE+ ',' + HIGHPRICE  + ',';
                              LdSql := LdSql + LOWPRICE + ',' + ENDPRICE +',' + GURAE +',' + sosok +',' + UPDOWNPRICE ;

                              WriteLn(StockF,LdSql);
                         //  end;

                //       Memo1.Lines.Add(strGuraeTime +'/' + strStartBuff +'/' + strHighBuff +'/' +  strLowBuff +'/' +  strEndBuff +'/' + strGuraeBuff );
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

function TForm2.BytesToHex(aSource: TBytes): string;
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

procedure TForm2.getStockData(cName :string);
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

procedure TForm2.getMinData(cName :string);
var
  SHTML, LnHTML,URL,iSql,sql,LdSql, dSql,CallDay: string ;
  i,CC,dd,sPage :integer;
  IdHTTP: TIdHTTP;
  StartDate, EndDate : TDate;
  GetList : TStringList;
  UrlItem,ATextData:string;
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
                  UrlItem := UrlItem +CCODE + '&d=' + CallDay +'153000&n=391';
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
                              LdSql :=','+ CCODE + ','+ CallDay + ','+ GuraeTime + ',' + STARTPRICE+ ',' + HIGHPRICE  + ',';
                              LdSql := LdSql + LOWPRICE + ',' + ENDPRICE +',' + GURAE +',' + sosok +',' + UPDOWNPRICE ;

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

function TForm2.GetHTML(addr: string):string;
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

end.
