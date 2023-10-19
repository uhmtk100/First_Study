unit stockinfo;

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
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DateUtils, IdHTTP,ShellAPI,StrUtils,System.Math;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    Edit3: TEdit;
    Label2: TLabel;
    IdHTTP1: TIdHTTP;
    Button5: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Timer1: TTimer;
    Button3: TButton;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ListBox2: TListBox;
    ListBox1: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    Button6: TButton;
    Button11: TButton;
    Label1: TLabel;
    Label3: TLabel;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    Button4: TButton;
    CheckBox2: TCheckBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    ListBox9: TListBox;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    FDConnection1: TFDConnection;
    FDQuery2: TFDQuery;
    FDQuery1: TFDQuery;
    ListBox10: TListBox;
    ListBox11: TListBox;
    ListBox12: TListBox;
    Button7: TButton;
    Button8: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    FDStoredProc1: TFDStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function GetHTML(addr: string):string;
    function GetHTMLSource(Doc: IHtmlDocument2): string;
    function GetData(Fstr:string; Lstr:string; memoln :string):string;
    function GetHTML2(addr2: string):TMemoryStream;
    function BytesToHex(aSource: TBytes): string;
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);

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
  Url_Host : string;
  cc:longint;
  timequit:boolean;
  comStockTotal : longint;

implementation

{$R *.dfm}


procedure TForm1.Button3Click(Sender: TObject);
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
  GuraeTime, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE, MinSeq, SignUpDown : string;
  OldGuraeTime, OldEndPRICE,fileLoc, goodsql,ccExe,ccStr : string;
  StockF: TextFile;
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  StartInString: string;
begin

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;
      Progressbar1.Max :=0;

      try
         try


          CC:=0;


          StartDate := DateTimePicker1.Date;
          CallDay := FormatDateTime('YYYYMMDD', StartDate);

          if not checkbox2.Checked  then  Sql := 'select * from Main_Comp ' + company_gubun + ' order by ccode'
          else begin

              Sql := 'select A.CCODE, A.COMPANY, A.SOSOK from MAIN_COMP A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE) Where B.HIGHPRICE > B.STARTPRICE and B.ENDPRICE- B.DAYGAP <> 0 ';
              Sql := Sql  + ' AND  (B.HIGHPRICE - B.LOWPRICE)*100/(B.ENDPRICE- B.DAYGAP) > 10 and A.SaleAmount > 0 and  A.SalesProfit > 10 and A.DEBTTOTAL <= A.SALEAMOUNT * 0.6 and ';
              Sql := Sql  + ' B.DDATE = ''' + CallDay + '''';
          end;

          ADOQuery1.close;
          ADOQuery1.sql.Clear;
          ADOQuery1.sql.add(Sql);
          ADOQuery1.Open;
          Progressbar1.Max := ADOQuery1.Recordcount;


          if not DirectoryExists('c:\STOCK_DATA/') then
             CreateDir('c:/STOCK_DATA/');

          fileLoc := 'c:/STOCK_DATA/' + FormatDateTime('YYYYMMDD', StartDate);
          AssignFile(StockF, fileLoc);
          Rewrite(StockF);

          while not ADOQuery1.Eof do begin
              CCODE :=TRIM(ADOQuery1.fieldvalues['ccode']);
              COMPANY :=TRIM(ADOQuery1.fieldvalues['COMPANY']);
              sosok :=TRIM(ADOQuery1.fieldvalues['sosok']);



           //       CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

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

             //    StartDate :=IncDay(StartDate, 1);

              cc:=cc+1;

              Progressbar1.Position := Progressbar1.Position + 1;
              LABEL2.Caption :=intTostr(cc);
              GetStream.Clear;
              ADOQuery1.Next;
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

              FDQuery2.sql.add(Wsql);
              FDQuery2.ExecSQL;
          end;


         Except
            on E : Exception do
            begin
                 memo1.Lines.Add(formatdatetime('YYYYMMDD hhmm',now) + E.Message);
            end;
         end;

      finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
          if not checkbox1.Checked then timer1.Enabled :=true;
          edit1.Text := formatdatetime('YYYYMMDD hhmm',now);
      end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,timeMM : string;
   CCODE, ddStr, todayDate,goodsql,BuyPrice : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT,indexNum : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox9.Clear;
   listbox7.Clear;
   listbox8.Clear;



   goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;


   todayDate := formatdatetime('YYYYMMDD',now);
   StartDate := DateTimePicker1.Date;
   while StartDate <= EndDate  do begin
         if DAYOFTHEWEEK(StartDate) > 5 then begin
            StartDate :=IncDay(StartDate, 1);
            Continue;
         end;
    //   ddStr :=intTostr(dd);
       ddStr := formatdatetime('YYYYMMDD',StartDate);
       timeMM :=formatdatetime('hh:mm',now);


        sql :='select A.ddate AS DDATE, A.CCODE AS CCODE, B.COMPANY, A.STARTPRICE, A.ENDPRICE, A.HIGHPRICE, A.LOWPRICE, A.DAYGAP, A.SOSOK, C.yGurae, C.xLowprice, ';
        sql :=sql + ' C.yGurae * 0.00000001 *  C.xLowprice AS TGurae, (A.HIGHPRICE - A.LOWPRICE)*100/(A.ENDPRICE- A.DAYGAP) AS UPDOWN from DAILY_KOSP A  ';
        sql :=sql + ' INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) INNER JOIN (SELECT X.DDATE, X.CCODE, Y.GURAETATOL as yGurae, X.LOWPRICE as xLOWPRICE, X.GURAE FROM STOCK_MIN X INNER JOIN ';
        sql :=sql + '  (SELECT DDATE, CCODE, MAX(GURAE) AS GURAETATOL FROM STOCK_MIN  GROUP BY DDATE, CCODE) Y ON(X.DDATE=Y.DDATE AND X.CCODE =Y.CCODE AND X.GURAE=Y.GURAETATOL)) C   ON(A.CCODE=C.CCODE AND A.DDATE=C.DDATE) ';
        sql :=sql + '  Where A.HIGHPRICE > A.STARTPRICE and A.ENDPRICE- A.DAYGAP <> 0 and (A.HIGHPRICE - A.LOWPRICE)*100/(A.ENDPRICE- A.DAYGAP) > 10 AND C.yGurae * 0.001 *  C.xLowprice  > 500000  ';
        sql :=sql +  goodsql + ' and A.DDATE = ''' + ddstr + '''';


        ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add(sql);
        ADOQuery2.Open;
        while NOT ADOQuery2.Eof  do begin
            ENDPRICE :=ADOQuery2.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(ADOQuery2.fieldvalues['CCODE']);
            BuyPrice :=FormatFloat('#,###', ADOQuery2.fieldvalues['xLowprice']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := DateToStr(myDate);

            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            sql3 := 'SELECT COUNT(*) AS UPCOUNT FROM (SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, DDATE,CCODE, LOWPRICE, GURAE, GURAE5, GURAE20 FROM ';
            sql3 := sql3 + ' DAILY_KOSP WHERE ddate <=''' + ddStr + ''' and ccode=''' + CCODE + ''') A WHERE A.ROW <= 140 ) X JOIN (select DDATE, CCODE, ENDPRICE, GURAE,GURAE5, GURAE20 from DAILY_KOSP ';
            sql3 := sql3 + ' where ddate=''' + ddStr + ''') Y ON X.CCODE =Y.CCODE WHERE X.GURAE >Y.GURAE5 * 10 AND X.LOWPRICE > Y.ENDPRICE * 1.3';
                                                                                                //(CASE WHEN Y.GURAE20 > Y.GURAE5 THEN Y.GURAE5 ELSE Y.GURAE20 END)
            ADOQuery3.SQL.Add(sql3);
            ADOQuery3.Open;
            UPCOUNT :=ADOQuery3.fieldvalues['UPCOUNT'];
            if UPCOUNT > 0 then begin

                 indexNum :=0;
                 LISTBOX9.Items.Add(CCODE);

                 if LISTBOX10.Items.IndexOf(CCODE) < 0 then  begin
                    LISTBOX10.Items.Add(CCODE);
                    indexNum :=1;
                 end;


                 if ADOQuery2.fieldvalues['SOSOK'] = 0 then  begin
                      LISTBOX7.Items.Add(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')');
                      if indexNum =1 then  LISTBOX11.Items.Add(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')');
                 end ELSE begin
                      ListBox7.Items.AddObject(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')', Pointer(clGreen));
                      if indexNum =1 then  ListBox11.Items.AddObject(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')', Pointer(clGreen));
                 end;
                 LISTBOX8.Items.Add(copy(TRIM(ADOQuery2.fieldvalues['UPDOWN']),0,5) + '% - ' + timeMM);
                 if indexNum =1  then  LISTBOX12.Items.Add(copy(TRIM(ADOQuery2.fieldvalues['UPDOWN']),0,5) + '% - ' + timeMM);
            end;
        ADOQuery2.Next;
        end;
       StartDate :=IncDay(StartDate, 1);

   end;


  Screen.Cursor := crDefault;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2,goodsql,LOWPRICE : string;
   CCODE, ddStr, todayDate : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

   Screen.Cursor := crHourglass;
   compTable1 := 'DAILY_KOSP';

   listbox4.Clear;
   listbox5.Clear;
   listbox6.Clear;

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;

   goodsql :=' and C.SaleAmount > 0 and  C.SalesProfit > 10 and C.DEBTTOTAL <= C.SALEAMOUNT * 0.6 ';

   StartDate := DateTimePicker1.Date;

       if DAYOFTHEWEEK(StartDate) > 5 then begin
            exit;
       end;

       ddStr := formatdatetime('YYYYMMDD',StartDate);
       sql := 'SELECT B.CCODE, B.DDATE, B.SOSOK, C.COMPANY, B.ENDPRICE, ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) AS UPDOWN2 ';
       sql := sql + ' FROM (SELECT CCODE, DDATE, SUM(GURAE) AS TGURAE, SUM(GURAE * SIGN(UPDOWNPRICE)) AS UPGURAE ';
       sql := sql + ' FROM STOCK_MIN WHERE DDATE=''' + ddStr + '''  GROUP BY CCODE,DDATE) A INNER JOIN DAILY_KOSP B ';
       sql := sql + ' ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE)  INNER JOIN MAIN_COMP C ON(A.CCODE=C.CCODE) ';
       sql := sql + ' WHERE A.TGURAE > 500000 AND A.UPGURAE > 1 AND A.TGURAE < 11 * A.UPGURAE AND A.TGURAE > 4 * B.GURAE40' ;
       sql := sql + ' AND ISNULL(ROUND(((B.DAYGAP)/nullif(B.ENDPRICE-B.DAYGAP,0)) * 100,2),0) < 14 ' ;
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

          ADOQuery4.Close;
          ADOQuery4.SQL.Clear;
          ADOQuery4.SQL.Add(sql2);
          ADOQuery4.Open;
          LOWPRICE :=ADOQuery4.fieldvalues['LOWPRICE'];

          myDate :=StartDate;
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
                 listbox6.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end else if ENDMAX = ENDPRICE then begin
                 listbox6.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
              end else begin
                 listbox6.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
              end;


              IF FDQuery2.fieldvalues['SOSOK'] = 0 THEN ListBox4.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clBlack))
              ELSE ListBox4.Items.AddObject(FDQuery1.fieldvalues['COMPANY']+'('+ LOWPRICE + ')', Pointer(clGreen));
              LISTBOX5.Items.Add(TRIM(FDQuery1.fieldvalues['UPDOWN2']));

   end;



  Screen.Cursor := crDefault;



end;

procedure TForm1.Button1Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql, dSql: string ;
  i,j,k,n,m,cc:integer;
  HtmlMemo : Tmemo;
  ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, DebtTotal,SalesProfit,RESERVE_RATIO, PROPERTY_TOTAL :string;
  SaleAmount, StockProfit, ForeignRate,PER,ROE,ROA,PBR, sosok,DEBTRATIO,PSR : string;
begin

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
                  iSql := iSql + ' SalesProfit, StockProfit, ForeignRate,PER,ROE,ROA,PBR,RESERVE_RATIO,PSR,DEBTRATIO,sosok) Values(''' + ccode + ''',N'''+ company + ''','+curPrice+','+prePrice+','+upDown;
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

end;

procedure TForm1.Button2Click(Sender: TObject);
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

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;

      cc:=0;

      if checkbox2.Checked then Sql := 'select * from Main_Comp ' + company_gubun + ' order by ccode'
      else Sql := 'select * from Main_Comp order by ccode';

      StartDate := DateTimePicker1.Date;


   try
      ADOQuery1.close;
      ADOQuery1.sql.Clear;
      ADOQuery1.sql.add(Sql);
      ADOQuery1.Open;
      Progressbar1.Max := ADOQuery1.Recordcount;

      while not ADOQuery1.Eof do begin
          CCODE :=TRIM(ADOQuery1.fieldvalues['ccode']);
          SOSOK :=TRIM(ADOQuery1.fieldvalues['sosok']);


                   CallDay := FormatDateTime('YYYYMMDD', StartDate); // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

                   if DAYOFTHEWEEK(StartDate) > 5 then begin
                       StartDate :=IncDay(StartDate, 1);
                       Continue;
                   end;
                   URL:='http://mobilestock.etomato.com/mobilestock/device/chart2.aspx?t=d&s=' + CCODE +'&d='+ CallDay + '&n=1';
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
          ADOQuery1.Next;
          Application.ProcessMessages;
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


procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    if checkbox1.Checked  then  timer1.Enabled :=false
    else  timer1.Enabled :=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   con_string :string;
begin
   DateTimePicker1.DateTime :=now;
   con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
   con_string := con_string + 'localhost ;Use Encryption for Data=False;Tag with column collation when possible=False';
   ADOConnection1.ConnectionString := con_string;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    HtmlMemo.Free;
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


procedure TForm1.Button5Click(Sender: TObject);
var
  timeMM : integer;
begin
  timer1.Enabled :=false;
  DateTimePicker1.DateTime :=now;
  timeMM :=strToint(formatdatetime('hhmm',now));


  if (timeMM < 900) OR (timeMM > 1820) then  begin
      timer1.Enabled :=true;
      checkbox2.Checked :=true;
      exit;
  end else if (timeMM > 1810) and (timeMM < 1816)  then  begin
       checkbox2.Checked :=false;
       company_gubun :='';
     //  Button1Click(nil);
     //  Button2Click(nil);
     //  Button3Click(nil);
     //  Button6Click(nil);
     //  Button11Click(nil);
       form1.Caption :=  formatdatetime('YYYY-MM-DD hh:mm',now)
 // end else if ((rightstr(inttostr(timeMM),2) > '15') and (rightstr(inttostr(timeMM),2) < '25')) OR ((rightstr(inttostr(timeMM),2) > '45') and (rightstr(intTostr(timeMM),2) < '55'))   then begin
  end else if (timeMM > 900) and (timeMM < 1500) then begin
       company_gubun :=' WHERE CCODE IN(''990001'',''996001'') OR (sosok < 2) and curPrice > 1500 and SaleAmount > 0'; //and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.6';

       button2click(nil);
       Button7Click(nil);
       Button8Click(nil);
       form1.Caption :=  formatdatetime('YYYY-MM-DD hh:mm',now);

  end else if (timeMM > 1533) and (timeMM < 1535) then begin
    //   company_gubun :=' WHERE CCODE IN(''990001'',''996001'', ''990413'',''990408'',''990410'') OR (sosok < 2)  and curPrice > 1000 and SaleAmount > 0
       button2click(nil);
       Button3Click(nil);
  end;

     timer1.Enabled :=true;
     company_gubun :='';


end;

procedure TForm1.Button6Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,sql5,fDate,eDate, compTable1,compTable2 : string;
   CCODE, ddStr, todayDate,goodsql : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE,UPCOUNT : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin
  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;

   goodsql :=' and B.SaleAmount > 0 and  B.SalesProfit > 10 and B.DEBTTOTAL <= B.SALEAMOUNT * 0.6';

   StartDate := DateTimePicker1.Date;
   EndDate := StartDate;

   todayDate := formatdatetime('YYYYMMDD',now);

         if DAYOFTHEWEEK(StartDate) > 5 then begin
            exit;
         end;
         ddStr := formatdatetime('YYYYMMDD',StartDate);


         sql := 'SELECT * FROM (SELECT B.COMPANY AS COMPANY, A.ENDPRICE, A.CCODE AS CCODE, A.SOSOK, ';
         sql := sql + ' ISNULL(ROUND((A.DAY20SUM/nullif((ENDPRICE-DAY20SUM),0)) * 100,2),0) AS UPDOWN, DAY20COUNT';
         sql := sql + ' FROM ' + compTable1 + ' A INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) WHERE  A.DDATE=''' + ddStr + ''' AND DAY20COUNT < 20 - 14 '+ goodsql +') X WHERE X.UPDOWN < -21  ORDER BY X.SOSOK, X.UPDOWN';



        ENDPRICE:=0; ENDPRICE2:=0; ENDMIN:=0; ENDMAX:=0;
        ADOQuery3.Close;
        ADOQuery3.SQL.Clear;
        ADOQuery3.SQL.Add(sql);
        ADOQuery3.Open;
        while NOT ADOQuery3.Eof  do begin
            ENDPRICE :=ADOQuery3.fieldvalues['ENDPRICE'];
            CCODE :=TRIM(ADOQuery3.fieldvalues['CCODE']);
            myDate := STRTODATE(COPY(ddStr,1,4)+'-'+ COPY(ddStr,5,2)+'-'+COPY(ddStr,7,2));
            myDate := IncDay(myDate, 20);
            todayDate := StringReplace(datetostr(myDate), '-', '',[rfReplaceAll, rfIgnoreCase]);

            ADOQuery5.Close;
            ADOQuery5.SQL.Clear;
            sql5 := 'SELECT COUNT(*) AS UPCOUNT FROM (SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, DDATE,CCODE, LOWPRICE, GURAE, GURAE5, GURAE20 FROM ';
            sql5 := sql5 + ' DAILY_KOSP WHERE ddate <=''' + ddStr + ''' and ccode=''' + CCODE + ''') A WHERE A.ROW <= 120 ) X JOIN (select DDATE, CCODE, ENDPRICE, GURAE,GURAE5, GURAE20 from DAILY_KOSP ';
            sql5 := sql5 + ' where ddate=''' + ddStr + ''') Y ON X.CCODE =Y.CCODE WHERE X.GURAE >Y.GURAE5 * 10 AND X.LOWPRICE > Y.ENDPRICE * 1.3';
                                                                                                //(CASE WHEN Y.GURAE20 > Y.GURAE5 THEN Y.GURAE5 ELSE Y.GURAE20 END)
            ADOQuery5.SQL.Add(sql5);
            ADOQuery5.Open;
            UPCOUNT :=ADOQuery5.fieldvalues['UPCOUNT'];
            if UPCOUNT > 0 then begin

                sql4 :='SELECT TOP 1 ENDPRICE, MAX(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMAX,';
                sql4 :=sql4 + 'MIN(ENDPRICE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 120 FOLLOWING) AS ENDMIN, SOSOK FROM ';
                sql4 :=sql4 +  compTable1 + ' WHERE CCODE =''' + CCODE +''' and ddate between  ''' + ddStr + ''' and '''+ todayDate +'''';
                ADOQuery4.Close;
                ADOQuery4.SQL.Clear;
                ADOQuery4.SQL.Add(sql4);
                ADOQuery4.Open;
                ENDPRICE2 :=ADOQuery4.fieldvalues['ENDPRICE'];
                ENDMAX :=ADOQuery4.fieldvalues['ENDMAX'];
                ENDMIN :=ADOQuery4.fieldvalues['ENDMIN'];

                if ENDMAX > ENDPRICE then begin
                   ADDPRICE :=round((ENDMAX-ENDPRICE)/ENDPRICE * 100);
                   listbox3.items.Add(inttostr(ADDPRICE) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                end else if ENDMAX = ENDPRICE then begin
                   listbox3.items.Add(FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%');
                end else begin
                   listbox3.items.Add('-' + FormatFloat('0.##',(ENDPRICE-ENDMIN)/ENDPRICE * 100) + '%('+FormatFloat('0.##', (ENDPRICE2-ENDPRICE)/ENDPRICE * 100) + '%)');
                end;

                if ADOQuery4.fieldvalues['SOSOK'] = 0 then  LISTBOX1.Items.Add(TRIM(ADOQuery3.fieldvalues['COMPANY']))
                ELSE  ListBox1.Items.AddObject(TRIM(ADOQuery3.fieldvalues['COMPANY']), Pointer(clGreen));
                LISTBOX2.Items.Add(TRIM(ADOQuery3.fieldvalues['UPDOWN']));
            end;
            ADOQuery3.Next;
        end;


  Screen.Cursor := crDefault;



end;

procedure TForm1.Button7Click(Sender: TObject);
var
  SHTML, LnHTML,URL,iSql,sql,LdSql, dSql,Wsql, CallDay: string ;
  i,CC,dd,sPage :integer;
  IdHTTP: TIdHTTP;
  StartDate, EndDate : TDate;
  GetList : TStringList;
  UrlItem,ATextData:string;
  GetStream: TMemoryStream;
  CCODE, DDATE :string;
  sosok, fDate,eDate,UPDOWNPRICE: string;
  GuraeTimeBuff,StartBuff,  HighBuff, LowBuff, EndBuff, GuraeBuff : TBytes;
  GuraeTime, STARTPRICE, HIGHPRICE, LOWPRICE, ENDPRICE, GURAE, MinSeq,SignUpDown : string;
  OldGuraeTime, OldEndPRICE,fileLoc, goodsql,ccExe,ccStr : string;
  StockF: TextFile;
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  StartInString: string;
begin

      IdHTTP := TIdHTTP.Create(nil);
      GetList := TStringList.Create;
      GetStream := TMemoryStream.create;
      Progressbar1.Max :=0;

      try
         try


          CC:=0;

          StartDate := DateTimePicker1.Date;
          CallDay := FormatDateTime('YYYYMMDD', StartDate);

          if not checkbox2.Checked  then  Sql := 'select * from Main_Comp ' + company_gubun + ' order by ccode'
          else begin

              Sql := 'SELECT CCODE, DDATE FROM (SELECT CCODE, DDATE, (HIGHPRICE - PREPRICE1) * 100/NULLIF(PREPRICE1,0) AS MXRATE FROM DAILY_KOSP WHERE DDATE =''' + CallDay + ''') A WHERE A.MXRATE > 3 ';

          end;

          ADOQuery1.close;
          ADOQuery1.sql.Clear;
          ADOQuery1.sql.add(Sql);
          ADOQuery1.Open;
          Progressbar1.Max := ADOQuery1.Recordcount;


          if not DirectoryExists('c:\STOCK_DATA/') then
             CreateDir('c:/STOCK_DATA/');

          fileLoc := 'c:/STOCK_DATA/' + FormatDateTime('YYYYMMDD', StartDate);
          AssignFile(StockF, fileLoc);
          Rewrite(StockF);

          while not ADOQuery1.Eof do begin
              CCODE :=TRIM(ADOQuery1.fieldvalues['CCODE']);
              DDATE :=TRIM(ADOQuery1.fieldvalues['DDATE']);

                  FDQuery2.close;
                  FDQuery2.sql.Clear;
                  if (CCODE <> '') and (DDATE <>'') then
                      dSql :='Delete from Stock_min where CCODE= ''' + CCODE + ''' AND DDATE ='''+ DDATE + '''';
                  FDQuery2.sql.add(dSql);
                  FDQuery2.ExecSQL;

                  UrlItem :='http://mobilestock.etomato.com/mobilestock/device/chart2.aspx?t=1&s=';
                  UrlItem := UrlItem +CCODE + '&d=' + DDATE +'153000&n=391';
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

              cc:=cc+1;

              Progressbar1.Position := Progressbar1.Position + 1;
              LABEL2.Caption :=intTostr(cc);
              GetStream.Clear;
              ADOQuery1.Next;
              Application.ProcessMessages;

          end;
          CloseFile(StockF);

          if FileExists(fileLoc) then
          begin
              FDQuery2.Close;
           //   FDQueryMysql1.SQL.Text := 'LOAD DATA LOCAL INFILE "' + fileLoc + '" INTO TABLE Stock_min FIELDS TERMINATED BY ","  LINES TERMINATED BY "\r\n"';
              FDQuery2.SQL.Text := 'BULK INSERT STOCK_MIN FROM ''' + fileLoc + ''' WITH (FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')';
              FDQuery2.ExecSQL;

          end;


         Except
            on E : Exception do
            begin
                 memo1.Lines.Add(formatdatetime('YYYYMMDD hhmm',now) + E.Message);
            end;
         end;

      finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
          if not checkbox1.Checked then timer1.Enabled :=true;
          edit1.Text := formatdatetime('YYYYMMDD hhmm',now);
      end;

end;

procedure TForm1.Button8Click(Sender: TObject);
VAR
 sql : string;
 CCODE, DDATE, TIMEB, BUYPRICE,COMPANY :string;
 CallDay, sTime: string;
 StartDate, EndDate : TDate;


begin
        StartDate := DateTimePicker1.Date;
        CallDay := FormatDateTime('YYYYMMDD', StartDate);
        sTime := formatdatetime('hhmm',now);
        sTime := inttoStr((strToint(copy(sTime,1,2)) - 9) * 60 +  strToint(copy(sTime,3,2)));

        MEMO2.Clear;
        MEMO3.Clear;
        MEMO4.Clear;

        FDStoredProc1.ExecProc('MIN_TD_PROC', [CallDay, sTime]);

        ADOQuery3.Close;
        ADOQuery3.SQL.Clear;
        sql := 'SELECT A.CCODE, A.DDATE, B.COMPANY, A.TIMEB, A.ENDPRICE, A.BUYPRICE,A.NOUSE  FROM  MIN_TD_TEMP A INNER JOIN MAIN_COMP B ON(A.CCODE = B.CCODE)  WHERE NOUSE =0 AND OLD IS NULL ORDER BY TIMEA';
        ADOQuery3.SQL.Add(sql);
        ADOQuery3.Open;
        while NOT ADOQuery3.Eof  do begin
          if ADOQuery3.fieldvalues['NOUSE'] = 0  then begin
            CCODE :=ADOQuery3.fieldvalues['CCODE'];
            TIMEB :=TRIM(ADOQuery3.fieldvalues['TIMEB']);
            BUYPRICE :=FormatFloat('#,###', ADOQuery3.fieldvalues['BUYPRICE']);
            COMPANY :=ADOQuery3.fieldvalues['COMPANY'];
            MEMO2.Lines.ADD(CCODE + '/' + COMPANY);
            MEMO3.Lines.ADD(TIMEB);
            MEMO4.Lines.ADD(BUYPRICE);


            MEMO5.Lines.ADD(CCODE + '/' + COMPANY);
            MEMO6.Lines.ADD(TIMEB);
            MEMO7.Lines.ADD(BUYPRICE);
          end;
            ADOQuery3.Next;
        end;

end;

end.
