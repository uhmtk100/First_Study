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
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DateUtils, IdHTTP;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Button3: TButton;
    WebBrowser1: TWebBrowser;
    Button4: TButton;
    Edit3: TEdit;
    Label2: TLabel;
    IdHTTP1: TIdHTTP;
    Button10: TButton;
    CheckBox4: TCheckBox;
    Edit9: TEdit;
    Timer1: TTimer;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function GetHTML(addr: string):string;
    function GetHTMLSource(Doc: IHtmlDocument2): string;
    function GetData(Fstr:string; Lstr:string; memoln :string):string;
    function GetHTML2(addr2: string):TMemoryStream;

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






procedure TForm1.Button3Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql,SQL,UP_DATE,TO_Date, dSql: string ;
  i,j,k,n,m,cc:integer;
  HtmlMemo : Tmemo;
  ccode, company, curPrice, prePrice, upDown, orgPrice, TotalStock, DealAmount, DebtTotal,SalesProfit :string;
  SaleAmount, StockProfit, ForeignRate, sosok : string;
begin
    Timer1.Enabled :=false;
    HtmlMemo := TMemo.Create(Self);
    HtmlMemo.Parent := Self;
    HtmlMemo.Width :=2000;
    HtmlMemo.Visible :=false;
    cc:=0;

    TO_Date := formatdatetime('YYYYMMDD',now);
    SQL := 'select ISNULL(max(UP_DATE),''1990-01-01'') as UP_DATE from main_comp';

    ADOQuery1.close;
    ADOQuery1.sql.Clear;
    ADOQuery1.sql.add(SQL);
    ADOQuery1.Open;

    UP_DATE := StringReplace(ADOQuery1.fieldvalues['UP_DATE'], '-', '',[rfReplaceAll, rfIgnoreCase]);

    if TO_Date > UP_DATE then begin
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
                        iSql := iSql + ' SalesProfit, StockProfit, ForeignRate,sosok,up_date) Values(''' + ccode + ''','''+ company + ''','+curPrice+','+prePrice+','+upDown;
                        iSql := iSql +','+orgPrice+','+TotalStock+','+ DealAmount+','+ SaleAmount+','+DebtTotal+','+SalesProfit+','+ StockProfit+','+ ForeignRate+','+inttostr(k)+', GETDATE() )';
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
    Button4Click(nil);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 sql,iSql, iSql2, CCODE,SOSOK, LnHTML,SHTML, URL, fDate, StockTable, InputTable, getPrice,dSql,dSql2 : string;
 HtmlMemo2 :TMemo;
 i,cc:integer;
 PriceList: Tstringlist;
begin

      HtmlMemo2 := TMemo.Create(Self);
      HtmlMemo2.Parent := Self;
      HtmlMemo2.Width :=2000;
      HtmlMemo2.Visible :=false;
      PriceList := TStringList.Create;
      cc:=0;


      Sql := 'select * from Main_Comp order by ccode';


      ADOQuery1.close;
      ADOQuery1.sql.Clear;
      ADOQuery1.sql.add(Sql);
      ADOQuery1.Open;


      fDate := StringReplace(datetostr(DateTimePicker1.date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      while not ADOQuery1.Eof do begin
          CCODE :=TRIM(ADOQuery1.fieldvalues['ccode']);
          SOSOK :=TRIM(ADOQuery1.fieldvalues['sosok']);
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
          ADOQuery1.Next;
          HtmlMemo2.Clear;
          
      end;
      
      CLOSE;


end;




procedure TForm1.FormCreate(Sender: TObject);
var
   con_string :string;
begin
 DateTimePicker1.DateTime :=now;
 edit9.text := formatdatetime('YYYYMMDDhhmm',now);

 con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Data Source=stock.fruitcredit.com;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=';
 con_string := con_string + 'stock.fruitcredit.com;Use Encryption for Data=False;Tag with column collation when possible=False';
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


      HtmlMemo3 := TMemo.Create(Self);
      HtmlMemo3.Parent := Self;
      HtmlMemo3.Width :=2000;
      HtmlMemo3.Visible :=false;

      ADOQuery1.close;
      ADOQuery1.sql.Clear;
      CC:=0;

      Sql := 'select * from Main_Comp  order by ccode';
     
      ADOQuery1.sql.add(Sql);
      ADOQuery1.Open;
      while not ADOQuery1.Eof do begin
          CCODE :=TRIM(ADOQuery1.fieldvalues['ccode']);
          COMPANY :=TRIM(ADOQuery1.fieldvalues['COMPANY']);
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
          ADOQuery1.Next;
    end;

//    SHTML.Free;
    showmessage('완료');

end;

end.
