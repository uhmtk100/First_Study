unit getstock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Psock, NMHttp, Buttons, DB, ADODB,
  OleCtrls, SHDocVw,mshtml,ActiveX;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    ADOQuery2: TADOQuery;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    function GetHTML(addr: string):string;
    function GetHTMLSource(Doc: IHtmlDocument2): string;
    function GetData(Fstr:string; Lstr:string; memoln :string):string;
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
     HtmlMemo: TMemo;
    { Public declarations }
  end;

var
  Form1: TForm1;
  Urladd:string;
  cc:longint;
  timequit:boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SHTML,LnHTML,URL,iSql: string ;
  i,j,n,m:integer;
  HtmlMemo : Tmemo;
  ccode, company, curPrice, prePrice, upDown, orgPrice, DealAmount, stNtotal,CurPriceTotal :string;
  SaleAmount, CurProfit, ForeignRate, sosok : string;
begin
    HtmlMemo := TMemo.Create(Self);
    HtmlMemo.Parent := Self;
    HtmlMemo.Width :=2000;
    HtmlMemo.Visible :=false;
    if RadioButton1.Checked then sosok :='0';
    if RadioButton1.Checked then sosok :='1';

    URL:=edit1.Text;
    for j:=1 to 25 do begin
        SHTML := GetHTML(URL+'sosok='+sosok+'&page='+inttostr(j));
        HtmlMemo.Text :=SHTML;
      //  j:=HtmlMemo.Lines.Count;

        for i:=0 to HtmlMemo.Lines.Count do begin
              LnHTML :=HtmlMemo.Lines[i];
              if  pos('<TD><A class=tltle href="/item/main.nhn?code=', LnHTML) > 0 then begin
                  ccode:=GetData('?code=', '">', HtmlMemo.Lines[i]);
                  company:=GetData('">', '</A>', HtmlMemo.Lines[i]);                                                                                                                                                                                            
                  curPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+1]);                                                                                                                                                                         
                  prePrice:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+2]);                                                                                                                                                                                      
                  upDown:=GetData('">', '</SPAN>', HtmlMemo.Lines[i+3]);                                                                                                                                                                                        
                  orgPrice:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+4]);                                                                                                                                                                         
                  DealAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+5]);
                  stNtotal:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+6]);
                  CurPriceTotal:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+7]);
                  SaleAmount:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+8]);                                                                                                                                                                       
                  CurProfit:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+9]);                                                                                                                                                                        
                  ForeignRate:=GetData('<TD class=number>', '</TD>', HtmlMemo.Lines[i+10]);                                                                                                                                                                     
                  memo1.Lines.Add(ccode + chr(9)+ company + chr(9)+ curPrice + chr(9)+ prePrice + chr(9)+ upDown + chr(9)+ orgPrice + chr(9)+ DealAmount + chr(9)+ stNtotal + chr(9)+ CurPriceTotal + chr(9)+ SaleAmount + chr(9)+ CurProfit + chr(9)+ ForeignRate);
                  ADOQuery1.close;
                  ADOQuery1.sql.Clear;
                  iSql := 'insert into Main_Comp(ccode, company, curPrice, prePrice, upDown, orgPrice, DealAmount, stNtotal,CurPriceTotal,';
                  iSql := iSql + ' SaleAmount, CurProfit, ForeignRate,sosok) Values(''' + ccode + ''','''+ company + ''','+curPrice+','+prePrice+','+upDown;
                  iSql := iSql +','+orgPrice+','+ DealAmount+','+ stNtotal+','+CurPriceTotal+','+SaleAmount+','+ CurProfit+','+ ForeignRate+','+sosok+')';
                  ADOQuery1.sql.add(iSql);
                  ADOQuery1.ExecSQL;
              end;
        end;
        HtmlMemo.Lines.Clear;
    end;

end;

function Tform1.GetHTML(addr: string):string;
var
  Hdata:string;
  i:longint;
  HTMLDoc: IHTMLDocument2;
 // WebBrowser : TWebBrowser;

begin
 //TRY
   if addr='' then exit;
//   WebBrowser :=TWebBrowser.Create(nil);
   WebBrowser1.Navigate(addr);
  // NMHTTP1.Get(addr);
 //  Hdata := NMHTTP1.Body;
 //  timer1.Enabled :=true;
   WebBrowser1.Silent := True;
   while (WebBrowser1.ReadyState<>READYSTATE_COMPLETE ) do //and (timequit=false)   do
       Application.ProcessMessages;
  // memo2.Text := WebBrowser1.OleObject.Document.DocumentElement.OuterHTML;

  // timer1.Enabled :=false;
   timequit:=false;
   HTMLDoc := WebBrowser1.Document as iHtmlDocument2;
  // Hdata:=GetHTMLSource(HTMLDoc);;
   result:= WebBrowser1.OleObject.Document.DocumentElement.OuterHTML;  //Hdata;
 // finally
 //   WebBrowser.Free;
  //  IDoc := nil;
 // end;
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
begin
    memoln:= StringReplace(memoln, ',', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:= StringReplace(memoln, 'N/A', '0',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '+', '',[rfReplaceAll, rfIgnoreCase]);
    memoln:=StringReplace(memoln, '%', '',[rfReplaceAll, rfIgnoreCase]);
  //  memoln:=StringReplace(memoln, '|', ',',[rfReplaceAll, rfIgnoreCase]);
    result :=copy(memoln, pos(Fstr,memoln)+ length(Fstr), pos(Lstr,memoln)-pos(Fstr,memoln)- length(Fstr));
end;


procedure TForm1.Button2Click(Sender: TObject);
var
 sql,iSql, CCODE,LnHTML,SHTML, URL, fDate, getPrice : string;
 HtmlMemo2 :TMemo;
 i:integer;
 PriceList: Tstringlist;
begin
      HtmlMemo2 := TMemo.Create(Self);
      HtmlMemo2.Parent := Self;
      HtmlMemo2.Width :=2000;
      HtmlMemo2.Visible :=false;
      PriceList := TStringList.Create;

      ADOQuery1.close;
      ADOQuery1.sql.Clear;
     // if RadioButton1.Checked then Sql := 'select * from Main_Comp where  sosok=0  and CCODE NOT IN(SELECT CCODE FROM dailyprice GROUP BY CCODE)  order by ccode'
     // else  Sql := 'select * from Main_Comp where  sosok=1 and CCODE NOT IN(SELECT CCODE FROM dailyprice_KOSD GROUP BY CCODE) order by ccode';
      if RadioButton1.Checked then Sql := 'select * from Main_Comp where  sosok=0  order by ccode'
      else  Sql := 'select * from Main_Comp where  sosok=1 order by ccode';

      ADOQuery1.sql.add(Sql);
      ADOQuery1.Open;
      fDate := StringReplace(datetostr(DateTimePicker1.date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      while not ADOQuery1.Eof do begin
          CCODE :=TRIM(ADOQuery1.fieldvalues['ccode']);
         // http://fchart.stock.naver.com/sise.nhn?symbol=005930&timeframe=day&startTime=20130709&count=100&requestType=2
          URL:='http://fchart.stock.naver.com/sise.nhn?symbol=' + CCODE +'&timeframe=day&startTime='+fDate +'&count=' + trim(edit3.text) +'&requestType=2';
          SHTML := GetHTML(URL);
          HtmlMemo2.Text :=SHTML;
          for i:=0 to HtmlMemo2.Lines.Count do begin
              LnHTML :=HtmlMemo2.Lines[i];
              if  pos('<SPAN class=t>item</SPAN>', LnHTML) > 0 then begin
                  getPrice:=GetData('</SPAN><B>', '</B>', HtmlMemo2.Lines[i]);

                  ADOQuery2.close;
                  ADOQuery2.sql.Clear;
                  PriceList.Delimiter := '|';
                  PriceList.DelimitedText := getPrice;
                  if RadioButton1.Checked then  iSql := 'insert into DailyPrice_KOSP(CCODE,dDate,StartPrice,HighPrice,LowPrice,EndPrice,Gurae) '
                  else  iSql := 'insert into DailyPrice_KOSD(CCODE,dDate,StartPrice,HighPrice,LowPrice,EndPrice,Gurae) ';
                  iSql := iSql + ' Values(''' + CCODE + ''','''+ PriceList[0] + ''',' + PriceList[1] + ',' + PriceList[2] + ',' + PriceList[3] +',' + PriceList[4] +',' + PriceList[5] +')';
                  ADOQuery2.sql.add(iSql);
                  ADOQuery2.ExecSQL;
                  PriceList.Clear;
               end;
          end;
          ADOQuery1.Next;
          HtmlMemo2.Clear;
      end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  HtmlMemo.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
URL,SHTML :string;
i:integer;
begin
  URL:='http://www.kaltour.com/ProductOverseas/OverseasList?LEFTMENU=FRF&PKGMOK=07&PKGARE=S&LMNU=2_3_0_0&MNU2COD=121&MNUCOD=';
 // URL:='http://fchart.stock.naver.com/sise.nhn?symbol=' + CCODE +'&timeframe=day&startTime='+fDate +'&count=' + trim(edit3.text) +'&requestType=2';
   for i:=0 to 100000 do
     SHTML := GetHTML(URL);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DateTimePicker1.DateTime :=now;
end;

end.
