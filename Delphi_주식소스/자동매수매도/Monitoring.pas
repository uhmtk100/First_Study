unit Monitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, OleCtrls,
  XA_DATASETLib_TLB, Vcl.Grids, VclTee.TeeGDIPlus, Data.DB,DateUtils, VCLTee.Series,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Data.Win.ADODB,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,ShellApi, SHDocVw,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSSQL,Math,
  FireDAC.Phys.MSSQLDef;

type
  Tfrm5100 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel10: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    MgntrnCode: TComboBox;
    edtPrc: TEdit;
    edtQty: TEdit;
    cbOrdType: TComboBox;
    edtCode: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Panel8: TPanel;
    sgResult: TStringGrid;
    XAQuery2: TXAQuery;
    XAReal1: TXAReal;
    XAReal2: TXAReal;
    Button5: TButton;
    XAReal3: TXAReal;
    OrdGrid: TStringGrid;
    OrdList: TStringGrid;
    JangoGrid: TStringGrid;
    ComboBox1: TComboBox;
    Button6: TButton;
    XAQuery1: TXAQuery;
    XAQuery3: TXAQuery;
    XAQuery4: TXAQuery;
    Button4: TButton;
    XAQuery5: TXAQuery;
    ProfitGrid: TStringGrid;
    Button7: TButton;
    XAQuery6: TXAQuery;
    edtPass: TEdit;
    cbAccount: TComboBox;
    Label1: TLabel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton9: TRadioButton;
    ListBox1: TListBox;
    Button8: TButton;
    Button13: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ProgressBar1: TProgressBar;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    DBChart5: TDBChart;
    LineSeries10: TBarSeries;
    Series6: TLineSeries;
    Edit15: TEdit;
    Button17: TButton;
    ADOQuery4: TADOQuery;
    Button10: TButton;
    Button9: TButton;
    WebBrowser1: TWebBrowser;
    IdHTTP1: TIdHTTP;
    CheckBox1: TCheckBox;
    Button11: TButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Label3: TLabel;
    Panel9: TPanel;
    Edit6: TEdit;
    FDConnection1: TFDConnection;
    FDQuery2: TFDQuery;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    PriceSearch: TListBox;
    Button12: TButton;
    Button14: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XAQuery1ReceiveData(ASender: TObject;
      const szBlockName: WideString);
    procedure XAQuery1ReceiveMessage(ASender: TObject;
      bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
    procedure Button5Click(Sender: TObject);
    procedure XAQuery2ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String = '' );
    procedure XAReal1ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure XAReal2ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure Button3Click(Sender: TObject);
    procedure XAQuery2ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery3ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAReal3ReceiveRealData(ASender: TObject;
      const szTrCode: WideString);
    procedure sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure OrdGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure XAQuery4ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure XAQuery4ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery3ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure Button4Click(Sender: TObject);
    procedure XAQuery5ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery5ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure Button7Click(Sender: TObject);
    procedure XAQuery6ReceiveData(ASender: TObject; const szTrCode: WideString);
    procedure XAQuery6ReceiveMessage(ASender: TObject; bIsSystemError: WordBool;
      const nMessageCode, szMessage: WideString);
    procedure OrdListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button13Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    function BytesToHex(aSource: TBytes): string;
    procedure ListBox2Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ListPrice ( OrgPrice : Integer);
    procedure PriceSearchDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure PriceSearchClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure AutoSizeGridColumn(Grid : TStringGrid; column : integer);
    procedure ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button14Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm5100: Tfrm5100;
   minTime : integer;
   comStockTotal : longint;
   PREPRICE : integer;
implementation

uses MAIN, about;

{$R *.dfm}

procedure Tfrm5100.FormShow(Sender: TObject);
var
  I : Integer;
  szAcc : WideString;
begin

  for I := 0 to MainForm.XASession1.GetAccountListCount - 1 do
  begin
    szAcc := MainForm.XASession1.GetAccountList( I );
    cbAccount.Items.Add( szAcc )
  end;

  If cbAccount.Items.Count > 0 then
    cbAccount.ItemIndex := 0;
  cbOrdType.ItemIndex := 0;
  ComboBox1.ItemIndex := 0;
  //Memo1.Text := XAQuery1.GetResData;

  OrdGrid.Cells[0,0] := '레코드수';
  OrdGrid.Cells[1,0] := '종목번호';
  OrdGrid.Cells[2,0] := '주문수량';
  OrdGrid.Cells[3,0] := '주문가';
  OrdGrid.Cells[4,0] := '매매구분';
  OrdGrid.Cells[5,0] := '호가유형코드';
  OrdGrid.Cells[6,0] := '신용거래코드';

  OrdGrid.Cells[7,0] := '주문번호';
  OrdGrid.Cells[8,0] := '주문유형코드';
  OrdGrid.Cells[9,0] := '주문금액';
  OrdGrid.Cells[10,0] := '현금주문금액';
  OrdGrid.Cells[11,0] := '대용주문금액';
  OrdGrid.Cells[12,0] := '종목명';
  /////////////////////////////////////////////////////////

  OrdList.Cells[0,0] := '주문일';
  OrdList.Cells[1,0] := '종목번호';
  OrdList.Cells[2,0] := '종목명';
  OrdList.Cells[3,0] := '주문번호';
  OrdList.Cells[4,0] := '매매구분';
  OrdList.Cells[5,0] := '주문수량';
  OrdList.Cells[6,0] := '주문가격';
  OrdList.Cells[7,0] := '체결수량';
  OrdList.Cells[8,0] := '체결가';
  OrdList.Cells[9,0] := '최종체결시각';
  //  OrdList.Cells[11,0] := '대용주문금액';

  ////////////////////////////////////////////////////

  JangoGrid.Cells[0,0] := '주문가능금액';
  JangoGrid.Cells[1,0] := '출금가능금액';
  JangoGrid.Cells[2,0] := '거래소금액';
  JangoGrid.Cells[3,0] := '코스닥금액';
  JangoGrid.Cells[4,0] := '잔고평가금액';
  JangoGrid.Cells[5,0] := '미수금액';
  JangoGrid.Cells[6,0] := '예탁자산총액';
  JangoGrid.Cells[7,0] := '손익율';
  JangoGrid.Cells[8,0] := '투자원금';
  JangoGrid.Cells[9,0] := '투자손익금액';
  JangoGrid.Cells[10,0] := '담보부족금액';
  JangoGrid.Cells[11,0] := '예수금';
  JangoGrid.Cells[12,0] := '대용금액';
  JangoGrid.Cells[13,0] := 'D1예수금';
  JangoGrid.Cells[14,0] := 'D2예수금';
  JangoGrid.Cells[15,0] := '현금미수금액';
  JangoGrid.Cells[16,0] := '증거금률35%';
  JangoGrid.Cells[17,0] := '증거금률50%액';

  ////////////////////////////////////////////////////

  ProfitGrid.Cells[0,0] := '종목번호';
  ProfitGrid.Cells[1,0] := '종목명';
  ProfitGrid.Cells[2,0] := '잔고수량';
  ProfitGrid.Cells[3,0] := '매매기준잔고수량';
  ProfitGrid.Cells[4,0] := '금일매수체결수량';
  ProfitGrid.Cells[5,0] := '금일매도체결수량';
  ProfitGrid.Cells[6,0] := '매도가';

  ProfitGrid.Cells[7,0] := '매수가';
  ProfitGrid.Cells[8,0] := '매도손익금액';
  ProfitGrid.Cells[9,0] := '손익율';
  ProfitGrid.Cells[10,0] :='현재가';
  ProfitGrid.Cells[11,0] := '신용금액';
  ProfitGrid.Cells[12,0] := '평균단가';
  ProfitGrid.Cells[13,0] := '매도가능수량';
  ProfitGrid.Cells[14,0] := '매도주문수량';
  ProfitGrid.Cells[15,0] := '금일매수체결금액';
  ProfitGrid.Cells[16,0] := '금일매도체결금액';
  ProfitGrid.Cells[17,0] := '잔고평가금액';
  ProfitGrid.Cells[18,0] := '평가손익';

  Button6Click(nil);
  Button7Click(nil);
  Button4Click(nil);

end;

procedure Tfrm5100.ListBox2Click(Sender: TObject);
var
  chDate : string;
  futureDate : TDateTime;
begin
      edtCode.Text := listbox1.items[listbox2.itemindex];

      if chDate <> '----------' then begin

          Button5Click(nil);
      end;

end;

procedure Tfrm5100.OrdGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=7) and (ARow >=1)  then begin
          Panel7.Caption := OrdGrid.Cells[ACol,ARow];
          edtQty.Text := OrdGrid.Cells[2,ARow];
          edtCode.Text :=  OrdGrid.Cells[1,ARow];
      end;
end;

procedure Tfrm5100.OrdListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=3) and (ARow >=1)  then begin
          Panel7.Caption := OrdList.Cells[ACol,ARow];
          edtQty.Text := OrdList.Cells[5,ARow];
          edtCode.Text :=   StringReplace(OrdList.Cells[1,ARow], 'A', '',[rfReplaceAll, rfIgnoreCase]);
      end else if (ACol=1) and (ARow >=1)  then begin
          Panel7.Caption := OrdList.Cells[ACol,ARow];
          edtQty.Text := OrdList.Cells[5,ARow];
          edtCode.Text :=   StringReplace(OrdList.Cells[1,ARow], 'A', '',[rfReplaceAll, rfIgnoreCase]);
          Button5Click(nil);
      end;

end;

procedure Tfrm5100.PriceSearchClick(Sender: TObject);
var
  listStr : string;
begin
   listStr := PriceSearch.items[PriceSearch.ItemIndex];
   edtPrc.Text :=trim(copy(listStr, 1, pos(' ', listStr)));
end;

procedure Tfrm5100.PriceSearchDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  item : string;
begin
    item := PriceSearch.Items[Index];
    if strTofloat(item) > 0 then
         PriceSearch.Canvas.Font.Color := clred
     else if strTofloat(item) > 0 then
         PriceSearch.Canvas.Font.Color := clblue
     else PriceSearch.Canvas.Font.Color := clBlack;
end;

procedure Tfrm5100.ProfitGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: string;
  SavedAlign: word;
begin
//  if ARow <> 1 then begin  // ACol is zero based
//    S := ProfitGrid.Cells[ACol, ARow]; // cell contents
//    SavedAlign := SetTextAlign(ProfitGrid.Canvas.Handle, TA_RIGHT);
//  //  ProfitGrid.Canvas.TextRect(Rect,
////      Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 2, S);
//    SetTextAlign(ProfitGrid.Canvas.Handle, SavedAlign);
//  end;

end;

procedure Tfrm5100.ProfitGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=0) and (ARow >=1)  then begin
          edtCode.Text := copy(ProfitGrid.Cells[ACol,ARow],2,6);
          edtQty.Text := ProfitGrid.Cells[3,ARow];


          Button5Click(nil);
      end;
end;

procedure Tfrm5100.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Caption ='10분' then  Button13Click(nil)
    else Button8Click(nil);
end;

procedure Tfrm5100.Button10Click(Sender: TObject);
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

          CC:=0;
          StartDate := DateTimePicker1.Date;
          EndDate :=StartDate;
          CallDay := FormatDateTime('YYYYMMDD', StartDate);

          if checkbox1.Checked  then  Sql := 'select * from Main_Comp where ccode=''' + edtCode.Text +''''
          else begin
            //  Sql := 'select * from Main_Comp where sosok < 2 and curPrice > 1000 and SaleAmount > 0 and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.5 order by ccode';

              Sql := 'select A.CCODE, A.COMPANY, A.SOSOK from MAIN_COMP A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE) Where B.HIGHPRICE > B.STARTPRICE and B.ENDPRICE- B.DAYGAP <> 0 ';
              Sql := Sql  + ' AND  (B.HIGHPRICE - B.LOWPRICE)*100/(B.ENDPRICE- B.DAYGAP) > 10 and A.SaleAmount > 0 and  A.SalesProfit > 10 and A.DEBTTOTAL <= A.SALEAMOUNT * 0.6 and ';
              Sql := Sql  + ' B.DDATE = ''' + CallDay + '''';
          end;


          ADOQuery4.close;
          ADOQuery4.sql.Clear;
          ADOQuery4.sql.add(Sql);
          ADOQuery4.Open;
          Progressbar1.Max := ADOQuery4.Recordcount;


          fileLoc := 'c:/STOCK_DATA/' + FormatDateTime('YYYYMMDD', StartDate);
          AssignFile(StockF, fileLoc);
          Rewrite(StockF);

          while not ADOQuery4.Eof do begin
              CCODE :=TRIM(ADOQuery4.fieldvalues['ccode']);
              COMPANY :=TRIM(ADOQuery4.fieldvalues['COMPANY']);
              sosok :=TRIM(ADOQuery4.fieldvalues['sosok']);

                 // intTostr(dd);  //StringReplace(DateToStr(IncDay(strTodate(callvar)- dd)),'-','',[rfReplaceAll, rfIgnoreCase]);

                  if DAYOFTHEWEEK(StartDate) > 5 then begin
                     StartDate :=IncDay(StartDate, 1);
                     Continue;
                  end;
                  ADOQuery3.close;
                  ADOQuery3.sql.Clear;
                  if (CCODE <> '') and (CallDay <>'') then
                      dSql :='Delete from Stock_min where CCODE= ''' + CCODE + ''' AND DDATE ='''+ CallDay + '''';
                  ADOQuery3.sql.add(dSql);
                  ADOQuery3.ExecSQL;

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

              cc:=cc+1;

              Progressbar1.Position := Progressbar1.Position + 1;
              Panel9.Caption :=intTostr(cc);
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
              if checkbox1.Checked  then  Wsql := Wsql + ' AND B.CCODE=''' + edtCode.Text +'''';
              FDQuery2.sql.add(Wsql);
              FDQuery2.ExecSQL;
          end;

      finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
      end;

end;

procedure Tfrm5100.Button11Click(Sender: TObject);
begin

   Checkbox1.Checked  :=false;

       button9click(nil);
       Button10Click(nil);
       Button17Click(nil);
    Checkbox1.Checked  :=true;

end;

procedure Tfrm5100.Button12Click(Sender: TObject);
begin
    ListPrice(PREPRICE);
end;

procedure Tfrm5100.Button13Click(Sender: TObject);
var
   sql,sql2,compTable,fDate,fTime,DealRate,CCODE,EndDate : string;
   gubun : string;
   DD,TT : integer;
begin
//   RadioButton1.Caption :='10분'; RadioButton2.Caption :='20분'; RadioButton3.Caption :='30분'; RadioButton4.Caption :='1시간';
//   RadioButton5.Caption :='2시간'; RadioButton6.Caption :='4시간'; RadioButton9.Caption :='1일';

   RadioButton1.Caption :='1분';

   CCODE :=edtCode.Text;

   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + CCODE +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin

 //     FORM1.Caption :=ADOQuery2.fieldvalues['COMPANY'];
      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];


      gubun  :=ADOQuery2.fieldvalues['sosok'];
      compTable := 'DAILY_KOSP';
      fDate := formatdatetime('YYYYMMDD',DateTimePicker1.Date);
      EndDate := fDate;

      fTime:=fDate + '09'; //StringReplace(datetostr(now), '-', '',[rfReplaceAll, rfIgnoreCase]);

 //     ADOQuery1.Close;
 //     ADOQuery1.SQL.Clear;
 //     sql :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, A.UPDOWNPRICE, A.ENDPRICE AS DAY20, ';
 //     sql :=sql + ' B.GURAE AS GTOTAL FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE = ''' + fDate + ''' AND ';
 //     sql :=sql + ' A.ALLTIME >= CONCAT(''' + fTime + ''' +(' + intTostr(TT) + ')/60 , ''00'' + (' + intTostr(TT) + ')%60) ';
 //     sql :=sql + ' AND A.ALLTIME <= CONCAT(''' + fTime + ''' +' + intTostr(DD + TT) + '/ 60 , ''00'' + ' + intTostr(DD + TT) + '%60) ORDER BY A.ALLTIME';

 //     ADOQuery1.SQL.Add(sql);
 //     ADOQuery1.Open;
 //     ADOQuery1.Last;

      // if not ADOQuery1.Eof  then begin
 //       if (minTime =0) AND (ADOQuery3.Tag = 1)  then begin
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            sql2 :='SELECT A.ALLTIME AS DDATE,A.STARTPRICE, A.HIGHPRICE, A.LOWPRICE, A.ENDPRICE, A.GURAE * SIGN(A.UPDOWNPRICE) AS GURAE, 0 AS GURAEWEIGHT, SUM(A.GURAE * SIGN(A.UPDOWNPRICE)) OVER (PARTITION BY A.CCODE) AS UPGURAE, A.UPDOWNPRICE, A.ENDPRICE AS DAY20, ';
            sql2 :=sql2 + ' B.GURAE AS GTOTAL FROM STOCK_MIN A INNER JOIN DAILY_KOSP B ON(A.CCODE=B.CCODE AND A.DDATE=B.DDATE) WHERE A.CCODE=''' + CCODE + ''' AND  A.DDATE BETWEEN ''' + fDate + ''' AND ''' + EndDate +''' ORDER BY A.ALLTIME';
            ADOQuery1.SQL.Add(sql2);
            ADOQuery1.Open;
            ADOQuery1.Last;
            EDIT6.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['UPGURAE']);
 //           ADOQuery3.Tag :=0;
 //       end;

     //   if ADOQuery1.fieldvalues['ENDPRICE'] <> null then begin
         // EDIT5.Text :=FormatFloat('#,###',ADOQuery1.fieldvalues['ENDPRICE']);
         //  EDIT10.Text := FormatFloat('#,###', ADOQuery1.fieldvalues['HIGHPRICE']);
     //   end;
   end;

end;

procedure Tfrm5100.Button14Click(Sender: TObject);
begin
    Button4Click(nil);
    if (edtPrc.Text <> '') and  (JangoGrid.Cells[17,1] <> '') then begin
         edtQty.Text := intTostr(strToint(StringReplace(JangoGrid.Cells[17,1],',','', [rfReplaceAll, rfIgnoreCase])) div strToint(StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase])));
    end else
        showmessage('Set Buying Price~!');
end;

procedure Tfrm5100.Button17Click(Sender: TObject);
var
   sql,sql2,sql3,sql4,fDate,eDate, compTable1,compTable2 : string;
   CCODE, ddStr, todayDate,goodsql,BuyPrice : string;
   dd, dcc : integer;
   ENDPRICE,ENDPRICE2, ENDMIN,ENDMAX,ADDPRICE, UPCOUNT : integer;
   myDate : TDateTime;
   StartDate, EndDate : TDate;
begin

  Screen.Cursor := crHourglass;
  compTable1 := 'DAILY_KOSP';


   listbox1.Clear;
   listbox2.Clear;
   listbox3.Clear;


   if RadioButton1.Checked then  RadioButton2.Checked := true;
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


        sql :='select A.ddate AS DDATE, A.CCODE AS CCODE, B.COMPANY, A.STARTPRICE, A.ENDPRICE, A.HIGHPRICE, A.LOWPRICE, A.DAYGAP, A.SOSOK, C.yGurae, C.xLowprice, ';
        sql :=sql + ' C.yGurae * 0.00000001 *  C.xLowprice AS TGurae, (A.HIGHPRICE - A.LOWPRICE)*100/(A.ENDPRICE- A.DAYGAP) AS UPDOWN from DAILY_KOSP A  ';
        sql :=sql + ' INNER JOIN MAIN_COMP B ON(A.CCODE=B.CCODE) INNER JOIN (SELECT X.DDATE, X.CCODE, Y.GURAETATOL as yGurae, X.LOWPRICE as xLOWPRICE, X.GURAE FROM STOCK_MIN X INNER JOIN ';
        sql :=sql + '  (SELECT DDATE, CCODE, MAX(GURAE) AS GURAETATOL FROM STOCK_MIN  GROUP BY DDATE, CCODE) Y ON(X.DDATE=Y.DDATE AND X.CCODE =Y.CCODE AND X.GURAE=Y.GURAETATOL)) C   ON(A.CCODE=C.CCODE AND A.DDATE=C.DDATE) ';
        sql :=sql + '  Where A.HIGHPRICE > A.STARTPRICE and A.ENDPRICE- A.DAYGAP <> 0 and (A.HIGHPRICE - A.LOWPRICE)*100/(A.ENDPRICE- A.DAYGAP) > 10 and B.SaleAmount > 0 and  B.SalesProfit > 10   AND C.yGurae * 0.001 *  C.xLowprice  > 500000  ';
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


                 LISTBOX1.Items.Add(CCODE);
                 if ADOQuery2.fieldvalues['SOSOK'] = 0 then  LISTBOX2.Items.Add(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')')
                 ELSE  ListBox2.Items.AddObject(TRIM(ADOQuery2.fieldvalues['COMPANY']) + '('+ BuyPrice +')', Pointer(clGreen));
                 LISTBOX3.Items.Add(copy(TRIM(ADOQuery2.fieldvalues['UPDOWN']),0,5) + '%');
            end;
        ADOQuery2.Next;
        end;
       StartDate :=IncDay(StartDate, 1);

   end;


  Screen.Cursor := crDefault;


end;

procedure Tfrm5100.Button1Click(Sender: TObject);
begin
//  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'reccnt', 0, '1' );
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0, edtCode.Text );      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, edtQty.Text  );            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase]));         // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '2');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, '000' );                                     // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );




end;

procedure Tfrm5100.Button2Click(Sender: TObject);
begin
   if Panel7.Caption <> '' then begin

     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrgOrdNo', 0, Panel7.Caption  );     	// 원주문번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'InptPwd', 0,  edtPass.Text );      // 입력비밀번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'IsuNo', 0, StringReplace(edtCode.Text,'A','', [rfReplaceAll, rfIgnoreCase]));        // 종목번호
     XAQuery4.SetFieldData( 'CSPAT00800InBlock1', 'OrdQty', 0, edtQty.Text);            // 주문수량
     XAQuery4.Request( FALSE );
   end;
end;

procedure Tfrm5100.Button3Click(Sender: TObject);
begin
//  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'reccnt', 0, '1' );
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'IsuNo', 0,  edtCode.Text );      // 종목번호
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdQty', 0, edtQty.Text  );            // 주문수량
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdPrc', 0, StringReplace(edtPrc.Text,',','', [rfReplaceAll, rfIgnoreCase]));               // 주문가, Header Type이 B 인 경우 Data Type이 실수면 소수점을 포함해야 한다.
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'BnsTpCode', 0, '1');       // 매매구분
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdprcPtnCode', 0, Copy( cbOrdType.Text, 1, 2 ) );          // 호가유형코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'MgntrnCode', 0, '000' );                                     // 신용거래코드
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'LoanDt', 0, '' );                                             // 대출일
  XAQuery1.SetFieldData( 'CSPAT00600InBlock1', 'OrdCndiTpCode', 0, '0' );                                       // 주문조건구분
  XAQuery1.Request( FALSE );
end;

procedure Tfrm5100.Button4Click(Sender: TObject);
begin
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'RecCnt', 0, '1' );     	   // 레코드갯수
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'MgmtBrnNo', 0, '0' );     	     // 관리지점번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'AcntNo', 0, cbAccount.Text );        // 계좌번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'Pwd', 0, edtPass.Text );         // 비밀번호
     XAQuery5.SetFieldData( 'CSPAQ12200InBlock1', 'BalCreTp', 0, '0'  );                // 잔고생성구분
     XAQuery5.Request( FALSE );
end;

procedure Tfrm5100.Button5Click(Sender: TObject);
begin
  XAReal1.UnadviseRealData;
//  XAReal2.UnadviseRealData;
  XAReal3.UnadviseRealData;
  XAQuery2.SetFieldData( 't1101InBlock', 'shcode', 0, edtCode.Text );
  XAQuery2.Request( FALSE );
  if Copy( cbOrdType.Text, 1, 2 ) = '82'  then begin
      XAReal1.ResFileName :='IO/H2_.res';
      XAReal3.ResFileName :='IO/HB_.res';
      XAReal1.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
      XAReal3.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
  end else begin
      XAReal1.ResFileName :='IO/H1_.res';
      XAReal3.ResFileName :='IO/HA_.res';
      XAReal1.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
//  XAReal2.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
      XAReal3.SetFieldData( 'InBlock', 'shcode', edtCode.Text );
  end;
   Button8Click(nil);
end;

procedure Tfrm5100.Button6Click(Sender: TObject);
var
OrderDay : string;
begin

  OrderDay := FormatDateTime('YYYYMMDD', DateTimePicker1.Date);

  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'RecCnt', 0, '1' );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'InptPwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdMktCode', 0, '00' );         // 주문시장코드
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BnsTpCode', 0, '0'  );                // 매매구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'IsuNo', 0,'' );                 //종목번호
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'ExecYn', 0,  Copy(ComboBox1.Text, 1, 1 )  );   // 체결여부
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdDt', 0, '' );                 // 주문일
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'SrtOrdNo2', 0, '0');       // 시작주문번호2
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'BkseqTpCode', 0, '1' );          // 역순구분
  XAQuery3.SetFieldData( 'CSPAQ13700InBlock1', 'OrdPtnCode', 0, '00' );          // 주문유형코드
  XAQuery3.Request( FALSE );
end;

procedure Tfrm5100.Button7Click(Sender: TObject);
begin
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'RecCnt', 0, '1' );   //  레코드갯수
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'AcntNo', 0, cbAccount.Text );     	// 계좌번호
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'Pwd', 0, edtPass.Text );        // 입력비밀번호
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'BalCreTp', 0, '0'  );                // 잔고생성구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'CmsnAppTpCode', 0,'1' );                 //수수료적용구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'D2balBaseQryTp', 0,  '0' );   // D2잔고기준조회구분
  XAQuery6.SetFieldData( 'CSPAQ12300InBlock1', 'UprcTpCode', 0, '0' );         // 단가구분

  XAQuery6.Request( FALSE );
end;

procedure Tfrm5100.Button8Click(Sender: TObject);
var
   sql,sql2,DD,compTable,fDate,fToDay,DealRate : string;
   gubun : string;

begin
   RadioButton1.Caption :='10일'; RadioButton2.Caption :='20일'; RadioButton3.Caption :='40일'; RadioButton4.Caption :='60일';
   RadioButton5.Caption :='120일'; RadioButton6.Caption :='240일'; RadioButton9.Caption :='3년';


   if RadioButton1.Checked then  DD:='10'
   else if RadioButton2.Checked then DD:='20'
   else if RadioButton3.Checked then DD:='40'
   else if RadioButton4.Checked then DD:='60'
   else if RadioButton5.Checked then DD:='120'
   else if RadioButton6.Checked then DD:='240'
   else if RadioButton9.Checked then DD:='620';




   ADOQuery2.Close;
   ADOQuery2.SQL.Clear;
   sql :='select * from main_comp where ccode=''' + trim(edtCode.Text) +'''';
   ADOQuery2.SQL.Add(sql);
   ADOQuery2.Open;
   if not ADOQuery2.Eof  then begin
      EDIT2.Text  :=ADOQuery2.fieldvalues['COMPANY'];
     // memo2.Lines.Add(ADOQuery2.fieldvalues['COMPANY']);
      gubun  :=ADOQuery2.fieldvalues['sosok'];
      compTable := 'DAILY_KOSP';
      fDate := StringReplace(datetostr(DateTimePicker1.Date), '-', '',[rfReplaceAll, rfIgnoreCase]);
      fToDay:= formatdatetime('YYYYMMDD',now);
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      sql :='SELECT * FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
      sql := sql + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, DDATE,DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT,';
      sql :=sql + ' STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE FROM ' + compTable + ' WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(edtCode.TEXT) + '''  AND DDATE <=  ''' + fDate +''' ) A ';
      sql := sql + ' WHERE A.ROW < ' + DD + ' and ddate <=''' +fDate + ''' order by ddate';
      ADOQuery1.SQL.Add(sql);
      ADOQuery1.Open;
      ADOQuery1.Last;

//      ADOQuery3.Close;
//      ADOQuery3.SQL.Clear;
 //     sql2 :='Select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW, ISNULL(ROUND(((ENDPRICE - STARTPRICE)/nullif(STARTPRICE,0)) * 100,2),0) AS UPDOWN,';
 //     sql2 := sql2 + ' ISNULL(ROUND(((DAYGAP)/nullif(ENDPRICE-DAYGAP,0)) * 100,2),0) AS UPDOWN2, DDATE, DAY20, DAYGAP, GURAE * (CASE WHEN DAYGAP >=0 THEN 1 ELSE -1 END) AS GURAE, GURAEWEIGHT, STARTPRICE,HIGHPRICE,LOWPRICE, ENDPRICE FROM ' + compTable ;
 //     sql2 := sql2 + ' WHERE SOSOK =' + gubun +' AND CCODE=''' + TRIM(edtCode.TEXT) + '''  AND ';      // DDATE <= convert(varchar, getdate(), 112)
 //     sql2 := sql2 + ' DDate BETWEEN ''' +fDate  + ''' and ''' +fToDay + ''' order by ddate';
 //     ADOQuery3.SQL.Add(sql2);
//      ADOQuery3.Open;
 //     ADOQuery3.Last;
  //    ADOQuery3.Tag :=1;
        PREPRICE := ADOQuery1.FieldByName('ENDPRICE').AsInteger - ADOQuery1.FieldByName('DAYGAP').AsInteger;
        EDIT9.Text :=  FormatFloat('#0,###', ADOQuery1.fieldvalues['STARTPRICE']) + '(' + FormatFloat('0.##%', ( ADOQuery1.FieldByName('STARTPRICE').AsInteger -PREPRICE) *100 / PREPRICE ) +')';
        EDIT10.Text := FormatFloat('#0,###', ADOQuery1.fieldvalues['HIGHPRICE'])+   '(' + FormatFloat('0.##%', ( ADOQuery1.FieldByName('HIGHPRICE').AsInteger -PREPRICE) *100 / PREPRICE ) +')';
        EDIT11.Text := FormatFloat('#0,###', ADOQuery1.fieldvalues['LOWPRICE'])+    '(' + FormatFloat('0.##%', ( ADOQuery1.FieldByName('LOWPRICE').AsInteger  -PREPRICE) *100/ PREPRICE ) +')';
        EDIT12.Text := FormatFloat('#0,###', ADOQuery1.fieldvalues['ENDPRICE'])+    '(' + FormatFloat('0.##%', ( ADOQuery1.FieldByName('ENDPRICE').AsInteger  -PREPRICE) *100/ PREPRICE ) +')';
        EDIT13.Text := FormatFloat('0.##%', ADOQuery1.fieldvalues['UPDOWN2']);
        EDIT14.Text := FormatFloat('#0,###', ADOQuery1.fieldvalues['GURAE']);
        EDIT15.Text := FormatFloat('#0,###',PREPRICE);
        if ADOQuery1.fieldvalues['GURAEWEIGHT'] <> null then EDIT6.Text :=FormatFloat('#,###', ADOQuery1.fieldvalues['GURAEWEIGHT']);

      PriceSearch.Clear;
      comStockTotal := ADOQuery2.fieldvalues['TotalStock'];
 //     DealRate := floatTostr(ADOQuery2.fieldvalues['DealAmount']/comStockTotal*0.1);

   end;

end;

procedure Tfrm5100.Button9Click(Sender: TObject);
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
      if checkbox1.Checked  then
         Sql := 'select * from Main_Comp where ccode=''' + edtCode.Text +''''
      else Sql := 'select * from Main_Comp where sosok < 2 and curPrice > 1000 and SaleAmount > 0 and  SalesProfit > 10 and DEBTTOTAL <= SALEAMOUNT * 0.6 order by ccode';
      StartDate := DateTimePicker1.Date;
      EndDate :=StartDate;


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

                           ADOQuery2.ExecSQL;

                       GetStream.Position  := GetStream.Position + 4;
                       cc := cc+1;
                   end;

                   GuraeDay:='';
                   EndPRICE:='';STARTPRICE:='';HIGHPRICE:='';LOWPRICE:='';GURAE:='';

          //cc := cc+1;
          Panel9.Caption :=inttostr(cc);
          Progressbar1.Position := Progressbar1.Position + 1;
          GetStream.Clear;
          ADOQuery4.Next;
          Application.ProcessMessages;
      end;

   finally
          GetList.Free;
          GetStream.Free;
          IdHTTP.Free;
   end;

end;

procedure Tfrm5100.DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
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
      if RadioButton1.Caption ='1분' then begin
        GTOTAL := FormatFloat('0.00',ADOQuery1.FieldByName('GURAE').AsInteger / ADOQuery1.FieldByName('GTOTAL').AsInteger  * 100);
        UPDOWN := FormatFloat('0.00',ADOQuery1.FieldByName('UPDOWNPRICE').AsInteger / ADOQuery1.FieldByName('STARTPRICE').AsInteger  * 100);
        UPDOWN2 := FormatFloat('0.00',(ADOQuery1.FieldByName('ENDPRICE').AsInteger - strToint(STPRICE)) / strToint(STPRICE)  * 100);
        DBChart1.Hint := ADOQuery1.FieldByName('ENDPRICE').AsString +'(' + UPDOWN2 +')/' + ADOQuery1.FieldByName('UPDOWNPRICE').AsString +'('+ UPDOWN +'%)/'+ GTOTAL + '/' + ADOQuery1.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery1.FieldByName('LOWPRICE').AsString;
      end else begin
        DBChart1.Hint := ADOQuery1.FieldByName('ENDPRICE').AsString + '('+ADOQuery1.FieldByName('UPDOWN2').AsString +'%)/'+ ADOQuery1.FieldByName('STARTPRICE').AsString +'/' + ADOQuery1.FieldByName('HIGHPRICE').AsString +'/' +ADOQuery1.FieldByName('LOWPRICE').AsString;
      end;

  end;

end;

procedure Tfrm5100.DBChart5MouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure Tfrm5100.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin

       LISTBOX1.Clear;
       LISTBOX2.Clear;
       listbox3.Clear;



       FDQuery2.Close;
       FDQuery2.SQL.Clear;
       sql := 'SELECT COMPANY, CCODE FROM MAIN_COMP WHERE COMPANY like ''%' + edit2.Text + '%''';
       FDQuery2.SQL.Add(sql);
       FDQuery2.Open;
       while NOT FDQuery2.Eof  do begin
           LISTBOX1.Items.Add(TRIM(FDQuery2.fieldvalues['CCODE']));
           LISTBOX2.Items.Add(TRIM(FDQuery2.fieldvalues['COMPANY']));
        //   LISTBOX3.Items.Add());
           FDQuery2.Next;
       end;
   end;
end;

procedure Tfrm5100.edtCodeKeyPress(Sender: TObject; var Key: Char);
var
 sql : string;
begin
   if Key = #13 then begin
       Button5Click(nil);
   end;

end;

procedure Tfrm5100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure Tfrm5100.FormCreate(Sender: TObject);
var
   con_string1 :string;
begin
 DateTimePicker1.DateTime :=now;

 ListBox2.Style := lbOwnerDrawFixed;
// con_string := 'Provider=SQLOLEDB.1;Password=Link2sky;Persist Security Info=True;User ID=sa;Initial Catalog=STOCK_INFO;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID= ';
// con_string := con_string + 'localhost  ;Use Encryption for Data=False;Tag with column collation when possible=False';
 ADOConnection1.ConnectionString := con_string;
 DBChart1.Title.Text.Clear;
 DBChart5.Title.Text.Clear;


end;

procedure Tfrm5100.XAQuery1ReceiveData(ASender: TObject; const szBlockName: WideString);
begin
  //   Data := strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'ordno', 0 ));

     OrdGrid.Cells[0,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'RecCnt', 0 ))); // '레코드수';
     OrdGrid.Cells[1,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'IsuNo', 0 ); // '종목번호';
     OrdGrid.Cells[2,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'OrdQty', 0 ))); // '주문수량';
     OrdGrid.Cells[3,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'OrdPrc', 0 ))); // '주문가';
     OrdGrid.Cells[4,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'BnsTpCode', 0 ); // '매매구분';
     OrdGrid.Cells[5,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'OrdprcPtnCode', 0 ); // '호가유형코드';
     OrdGrid.Cells[6,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock1', 'MgntrnCode', 0 ); // '신용거래코드';

     OrdGrid.Cells[7,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'OrdNo', 0 ); // '주문번호';
     OrdGrid.Cells[8,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'OrdPtnCode', 0 ); // '주문유형코드';
     OrdGrid.Cells[9,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'OrdAmt', 0 ))); // '주문금액';
     OrdGrid.Cells[10,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'MnyOrdAmt', 0 ))); // '현금주문금액';
     OrdGrid.Cells[11,1] := formatfloat('#0,', strTofloat(XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'SubstOrdAmt', 0 ))); // '대용주문금액';
     OrdGrid.Cells[12,1] := XAQuery1.GetFieldData( 'CSPAT00600OutBlock2', 'IsuNm', 0 ); // '종목명';

     AutoSizeGridColumn(OrdGrid, 13);
end;

procedure Tfrm5100.XAQuery1ReceiveMessage(ASender: TObject;  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage);
end;


procedure Tfrm5100.XAQuery2ReceiveData(ASender: TObject;
  const szTrCode: WideString);
begin
    edit2.Text := XAQuery2.GetFieldData( 't1101OutBlock', 'hname', 0 );
    if edit2.Text ='' then begin

       memo1.Lines.Add( FormatDateTime('hh:mm:ss', now));
       exit;
    end;
    SetData ( 1,23, 'hotime', szTrCode );


    SetData ( 0, 0, 'jnilclose' );
    SetData ( 0,1, 'price'  );


 //   SetData (1,1, 'change'  );     //xx
 //   SetData (1,2, 'jnilclose'  );  //xx

    SetData ( 0,2, 'diff'  );
    SetData ( 0,3, 'volume'  );


    SetData ( 11,1, 'offerho1'  );
    SetData ( 10,1, 'offerho2'  );
    SetData ( 9,1, 'offerho3'  );
    SetData ( 8,1, 'offerho4'  );
    SetData ( 7,1, 'offerho5'  );
    SetData ( 6,1, 'offerho6'  );
    SetData ( 5,1, 'offerho7'  );
    SetData ( 4,1, 'offerho8'  );
    SetData ( 3,1, 'offerho9'  );
    SetData ( 2,1, 'offerho10'  );

    SetData ( 11,0,'offerrem1'  );
    SetData ( 10,0, 'offerrem2'  );
    SetData ( 9,0, 'offerrem3'  );
    SetData ( 8,0, 'offerrem4'  );
    SetData ( 7,0, 'offerrem5'  );
    SetData ( 6,0, 'offerrem6'  );
    SetData ( 5,0, 'offerrem7'  );
    SetData ( 4,0, 'offerrem8'  );
    SetData ( 3,0, 'offerrem9'  );
    SetData ( 2,0, 'offerrem10'  );

    SetData ( 12,1, 'bidho1'  );
    SetData ( 13,1, 'bidho2'  );
    SetData ( 14,1, 'bidho3'  );
    SetData ( 15,1, 'bidho4'  );
    SetData ( 16,1, 'bidho5'  );
    SetData ( 17,1, 'bidho6'  );
    SetData ( 18,1, 'bidho7'  );
    SetData ( 19,1, 'bidho8'  );
    SetData ( 20,1, 'bidho9'  );
    SetData ( 21,1, 'bidho10' );

    SetData ( 12,3, 'bidrem1'  );
    SetData ( 13,3, 'bidrem2'  );
    SetData ( 14,3, 'bidrem3'  );
    SetData ( 15,3, 'bidrem4'  );
    SetData ( 16,3, 'bidrem5'  );
    SetData ( 17,3, 'bidrem6'  );
    SetData ( 18,3, 'bidrem7'  );
    SetData ( 19,3, 'bidrem8'  );
    SetData ( 20,3, 'bidrem9'  );
    SetData ( 21,3, 'bidrem10' );

    SetData ( 23,0, 'offer'  );
    SetData ( 23,3, 'bid'  );

    XAReal1.AdviseRealData;
//    XAReal2.AdviseRealData;
    XAReal3.AdviseRealData;
end;

procedure Tfrm5100.XAQuery2ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
    Panel8.Caption := Trim(szMessage);
end;

procedure Tfrm5100.XAQuery3ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  I, J, x,y : Integer;
  nRecordCount : Integer;
  Jongmok :string;
begin
     nRecordCount := XAQuery3.GetBlockCount( 'CSPAQ13700OutBlock3' );
     for x := 1 to OrdList.RowCount -1 do begin
         for y := 0 to OrdList.ColCount -1  do begin
             OrdList.Cells[y,x] :='';
         end;
     end;


     for I := 1 to nRecordCount  do begin
         Jongmok := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 );
//         if Jongmok <> '' then BEGIN

         //      OrdList.Cells[2,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock1', 'IsuNo', I-1 ); // '종목번호';
         //      OrdList.Cells[3,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock1', 'ExecYn', I-1 ); // '체결여부';
         //      OrdList.Cells[4,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock1', 'OrdDt', I-1 ); // '주문일';

         //      OrdList.Cells[5,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'SellExecAmt', I-1 ); // '매도체결금액';
         //      OrdList.Cells[6,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'BuyExecAmt', I-1 ); // '매수체결금액';
         //      OrdList.Cells[7,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'SellExecQty', I-1 ) + '(' + XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'SellOrdQty', 0 ) +')'; // '매도체결수량(매도주문수량)';
         //      OrdList.Cells[8,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'BuyExecQty', I-1 )  + '(' + XAQuery3.GetFieldData( 'CSPAQ13700OutBlock2', 'BuyOrdQty', 0 )  +')'; // '매수체결수량(매수주문수량)';


               OrdList.Cells[0,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdDt', I-1 ); // '주문일';
               OrdList.Cells[1,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNo', I-1 ); // '종목번호';
               OrdList.Cells[2,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'IsuNm', I-1 ); // '종목명';
               OrdList.Cells[3,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdNo', I-1 ); // '주문번호';    BnsTpNm
               OrdList.Cells[4,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'BnsTpNm', I-1 ); // '매매구분';

               OrdList.Cells[5,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdQty', I-1 ))); // '주문수량';
               OrdList.Cells[6,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'OrdPrc', I-1 ))); // '주문가격';
               OrdList.Cells[7,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'ExecQty', I-1 ))); // '체결수량';
               OrdList.Cells[8,I] := formatfloat('#0,', strTofloat(XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'ExecPrc', I-1))); // '체결가';
               OrdList.Cells[9,I] := XAQuery3.GetFieldData( 'CSPAQ13700OutBlock3', 'LastExecTime', I-1 ); // '최종체결시각 ';

 //        END

     end;

     AutoSizeGridColumn(OrdList, 10);
end;

procedure Tfrm5100.XAQuery3ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
       Panel8.Caption := Trim(szMessage);
end;

procedure Tfrm5100.XAQuery4ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
  i : integer;
  iData : widestring;
begin
     iData := XAQuery4.GetFieldData( 'CSPAT00800OutBlock1', 'OrgOrdNo', 0 ); // '주문번호';
     if iData = Panel7.Caption then begin
          Panel7.Caption :='';
          for i := 0 to 12 do
              OrdGrid.Cells[i,1] := '';
     end;
end;

procedure Tfrm5100.XAQuery4ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage);

end;

procedure Tfrm5100.XAQuery5ReceiveData(ASender: TObject;
  const szTrCode: WideString);
begin
     JangoGrid.Cells[0,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyOrdAbleAmt', 0 ))); // '현금주문가능금액';
     JangoGrid.Cells[1,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyoutAbleAmt', 0 ))); // '출금가능금액';
     JangoGrid.Cells[2,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'SeOrdAbleAmt', 0 ))); // '거래소금액';
     JangoGrid.Cells[3,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'KdqOrdAbleAmt', 0 ))); // '코스닥금액';
     JangoGrid.Cells[4,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'BalEvalAmt', 0 ))); // '잔고평가금액';
     JangoGrid.Cells[5,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'RcvblAmt', 0 ))); // '미수금액';
     JangoGrid.Cells[6,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'DpsastTotamt', 0 ))); // '예탁자산총액';

     JangoGrid.Cells[7,1] := formatfloat('0.##%', strTofloat(XAQuery5.GetFieldData( 'CSPAQ12200OutBlock2', 'PnlRat', 0 ))); // '손익율';
     JangoGrid.Cells[8,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'InvstOrgAmt', 0 ))); // '투자원금';
     JangoGrid.Cells[9,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'InvstPlAmt', 0 ))); // '투자손익금액';
     JangoGrid.Cells[10,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'PdlckAmt', 0 ))); // '담보부족금액';
     JangoGrid.Cells[11,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'Dps', 0 ))); // '예수금';
     JangoGrid.Cells[12,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'SubstAmt', 0 ))); // '대용금액';
     JangoGrid.Cells[13,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'D1Dps', 0 ))); // 'D1예수금';
     JangoGrid.Cells[14,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'D2Dps', 0 ))); // 'D2예수금';
     JangoGrid.Cells[15,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MnyrclAmt', 0 ))); // '현금미수금액';
     JangoGrid.Cells[16,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MgnRat35ordAbleAmt', 0 ))); // 'D2예수금';
     JangoGrid.Cells[17,1] := formatfloat('#0,', strTofloat(XAQuery5.GetFieldData('CSPAQ12200OutBlock2', 'MgnRat50ordAbleAmt', 0 ))); // '현금미수금액';

     AutoSizeGridColumn(JangoGrid, 18);
end;

procedure Tfrm5100.XAQuery5ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
   Panel8.Caption := Trim(szMessage);
end;

procedure Tfrm5100.XAQuery6ReceiveData(ASender: TObject;
  const szTrCode: WideString);
var
 nRecordCount, I : integer;
begin

     nRecordCount := XAQuery6.GetBlockCount ( 'CSPAQ12300OutBlock3' );
     ProfitGrid.RowCount := nRecordCount + 1;
     for I := 1 to nRecordCount  do begin

          ProfitGrid.Cells[0,I] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNo', I-1 );     //'종목번호';
          ProfitGrid.Cells[1,I] := XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'IsuNm', I-1 );     //'종목명';
          ProfitGrid.Cells[2,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BalQty', I-1 )));     //'잔고수량';
          ProfitGrid.Cells[3,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BnsBaseBalQty', I-1 )));     //'매매기준잔고수량';
          ProfitGrid.Cells[4,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdayBuyExecQty', I-1)) );     //'금일매수체결수량';
          ProfitGrid.Cells[5,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdaySellExecQty',I-1 )));     //'금일매도체결수량';
          ProfitGrid.Cells[6,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellPrc',I-1)));     //'매도가';

          ProfitGrid.Cells[7,I] :=formatfloat('#0,',  strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BuyPrc', I-1 )));     // 매수가
          ProfitGrid.Cells[8,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellPnlAmt', I-1)));     //'매도손익금액';
          ProfitGrid.Cells[9,I] := formatfloat('0.##%', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'PnlRat', I-1 )) * 100 );     //'손익율';
          ProfitGrid.Cells[10,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'NowPrc', I-1)));    //'현재가';
          ProfitGrid.Cells[11,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdtAmt',I-1 )));     //'신용금액';
          ProfitGrid.Cells[12,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'AvrUprc', I-1 )));     //'평균단가';
          ProfitGrid.Cells[13,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellAbleQty', I-1)));     //'매도가능수량';
          ProfitGrid.Cells[14,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'SellOrdQty', I-1 )));     //'매도주문수량';
          ProfitGrid.Cells[15,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdayBuyExecAmt',I-1)) );     //'금일매수체결금액';
          ProfitGrid.Cells[16,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'CrdaySellExecAmt', I-1 )));     //'금일매도체결금액';
          ProfitGrid.Cells[17,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'BalEvalAmt', I-1 )));     //'잔고평가금액';
          ProfitGrid.Cells[18,I] := formatfloat('#0,', strTofloat(XAQuery6.GetFieldData( 'CSPAQ12300OutBlock3', 'EvalPnl', I-1 )));    //'평가손익';

     end;
     AutoSizeGridColumn(ProfitGrid, 18);
end;

procedure Tfrm5100.XAQuery6ReceiveMessage(ASender: TObject;
  bIsSystemError: WordBool; const nMessageCode, szMessage: WideString);
begin
     Panel8.Caption := Trim(szMessage);
end;

procedure Tfrm5100.XAReal1ReceiveRealData(ASender: TObject;  const szTrCode: WideString);
begin

    SetData ( 1,23, 'hotime', szTrCode );

    SetData ( 11,1, 'offerho1', szTrCode );
    SetData ( 10,1, 'offerho2', szTrCode );
    SetData ( 9,1, 'offerho3', szTrCode );
    SetData ( 8,1, 'offerho4', szTrCode );
    SetData ( 7,1, 'offerho5', szTrCode );
    SetData ( 6,1, 'offerho6', szTrCode );
    SetData ( 5,1, 'offerho7', szTrCode );
    SetData ( 4,1, 'offerho8', szTrCode );
    SetData ( 3,1, 'offerho9', szTrCode );
    SetData ( 2,1, 'offerho10', szTrCode );

    SetData ( 11,0,'offerrem1', szTrCode );
    SetData ( 10,0, 'offerrem2', szTrCode );
    SetData ( 9,0, 'offerrem3', szTrCode );
    SetData ( 8,0, 'offerrem4', szTrCode );
    SetData ( 7,0, 'offerrem5', szTrCode );
    SetData ( 6,0, 'offerrem6', szTrCode );
    SetData ( 5,0, 'offerrem7', szTrCode );
    SetData ( 4,0, 'offerrem8', szTrCode );
    SetData ( 3,0, 'offerrem9', szTrCode );
    SetData ( 2,0, 'offerrem10', szTrCode );

    SetData ( 12,1, 'bidho1', szTrCode );
    SetData ( 13,1, 'bidho2', szTrCode );
    SetData ( 14,1, 'bidho3', szTrCode );
    SetData ( 15,1, 'bidho4', szTrCode );
    SetData ( 16,1, 'bidho5', szTrCode );
    SetData ( 17,1, 'bidho6', szTrCode );
    SetData ( 18,1, 'bidho7', szTrCode );
    SetData ( 19,1, 'bidho8', szTrCode );
    SetData ( 20,1, 'bidho9', szTrCode );
    SetData ( 21,1, 'bidho10', szTrCode );

    SetData ( 12,3, 'bidrem1', szTrCode );
    SetData ( 13,3, 'bidrem2', szTrCode );
    SetData ( 14,3, 'bidrem3', szTrCode );
    SetData ( 15,3, 'bidrem4', szTrCode );
    SetData ( 16,3, 'bidrem5', szTrCode );
    SetData ( 17,3, 'bidrem6', szTrCode );
    SetData ( 18,3, 'bidrem7', szTrCode );
    SetData ( 19,3, 'bidrem8', szTrCode );
    SetData ( 20,3, 'bidrem9', szTrCode );
    SetData ( 21,3, 'bidrem10', szTrCode );

end;

procedure Tfrm5100.XAReal2ReceiveRealData(ASender: TObject;
  const szTrCode: WideString);
begin
   // SetData ( 0,1, 'price', szTrCode  );
end;

procedure Tfrm5100.XAReal3ReceiveRealData(ASender: TObject;
  const szTrCode: WideString);
begin

    SetData ( 1,23, 'hotime', szTrCode );


    SetData ( 11,1, 'offerho1', szTrCode );
    SetData ( 10,1, 'offerho2', szTrCode );
    SetData ( 9,1, 'offerho3', szTrCode );
    SetData ( 8,1, 'offerho4', szTrCode );
    SetData ( 7,1, 'offerho5', szTrCode );
    SetData ( 6,1, 'offerho6', szTrCode );
    SetData ( 5,1, 'offerho7', szTrCode );
    SetData ( 4,1, 'offerho8', szTrCode );
    SetData ( 3,1, 'offerho9', szTrCode );
    SetData ( 2,1, 'offerho10', szTrCode );

    SetData ( 11,0,'offerrem1', szTrCode );
    SetData ( 10,0, 'offerrem2', szTrCode );
    SetData ( 9,0, 'offerrem3', szTrCode );
    SetData ( 8,0, 'offerrem4', szTrCode );
    SetData ( 7,0, 'offerrem5', szTrCode );
    SetData ( 6,0, 'offerrem6', szTrCode );
    SetData ( 5,0, 'offerrem7', szTrCode );
    SetData ( 4,0, 'offerrem8', szTrCode );
    SetData ( 3,0, 'offerrem9', szTrCode );
    SetData ( 2,0, 'offerrem10', szTrCode );

    SetData ( 12,1, 'bidho1', szTrCode );
    SetData ( 13,1, 'bidho2', szTrCode );
    SetData ( 14,1, 'bidho3', szTrCode );
    SetData ( 15,1, 'bidho4', szTrCode );
    SetData ( 16,1, 'bidho5', szTrCode );
    SetData ( 17,1, 'bidho6', szTrCode );
    SetData ( 18,1, 'bidho7', szTrCode );
    SetData ( 19,1, 'bidho8', szTrCode );
    SetData ( 20,1, 'bidho9', szTrCode );
    SetData ( 21,1, 'bidho10', szTrCode );

    SetData ( 12,3, 'bidrem1', szTrCode );
    SetData ( 13,3, 'bidrem2', szTrCode );
    SetData ( 14,3, 'bidrem3', szTrCode );
    SetData ( 15,3, 'bidrem4', szTrCode );
    SetData ( 16,3, 'bidrem5', szTrCode );
    SetData ( 17,3, 'bidrem6', szTrCode );
    SetData ( 18,3, 'bidrem7', szTrCode );
    SetData ( 19,3, 'bidrem8', szTrCode );
    SetData ( 20,3, 'bidrem9', szTrCode );
    SetData ( 21,3, 'bidrem10', szTrCode );
end;

procedure Tfrm5100.SetData ( ARow   : Integer; BCol : Integer; szName : WideString; szRealName : String );
var
  firstCol : Widestring;
  Data : double;
  jnilclose : double;
begin
  If szRealName = 'H1_' then
       Data := strTofloat(XAReal1.GetFieldData( 'OutBlock', szName ))
//  else If szRealName = 'S3_' then
//       Data := strTofloat(XAReal2.GetFieldData( 'OutBlock', szName ))
  else If szRealName = 'HA_' then
       Data := strTofloat(XAReal3.GetFieldData( 'OutBlock', szName ))
  else if (ARow = 0) and (BCol mod 2 = 0) then
       firstCol := XAQuery2.GetFieldData( 't1101OutBlock', szName, 0 )
  else
       Data := strTofloat(XAQuery2.GetFieldData( 't1101OutBlock', szName, 0 ));



  if (ARow = 0) and (BCol mod 2 = 0) then
      sgResult.Cells[BCol, ARow ] := firstCol
  else if BCol=1 then begin
     jnilclose := strToInt(XAQuery2.GetFieldData( 't1101OutBlock', 'jnilclose', 0 ));
     sgResult.Cells[BCol, ARow ] := formatfloat('#0,',Data);
     sgResult.Cells[BCol+1, ARow ] := formatfloat('0.##',(Data - jnilclose)*100/jnilclose)+'%';
  end else
     sgResult.Cells[BCol, ARow ] := formatfloat('#0,',Data);
end;


procedure Tfrm5100.sgResultDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  //  if ((1 <= ACol) and (ACol <= 2)) and ((1 <= ARow) and  (ARow <=12))then begin
 //          sgResult.Canvas.Font.Color := clRed;
 //          sgResult.Canvas.TextOut(Rect.Left, Rect.Top, sgResult.Cells[ACol,ARow]) ;
 //   end;

end;

procedure Tfrm5100.sgResultSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (ACol=1) and ((ARow >=1) and (ARow <=22)) then
          edtPrc.Text := sgResult.Cells[ACol,ARow];
end;



function Tfrm5100.BytesToHex(aSource: TBytes): string;
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



procedure Tfrm5100.ComboBox1Change(Sender: TObject);
begin
  Button6Click(nil);
end;

procedure Tfrm5100.ListPrice ( OrgPrice : Integer);
var
   UUprice : integer;
   UUx, DDx : string;
   maxPrice,Loc : integer;
   i,j : integer;
begin
   PriceSearch.Clear;
   i:=0; UUx:='0'; UUprice:=0; maxPrice:=0;
 try


   while StrTofloat(UUx) >= -30 do begin

       if OrgPrice > 500000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 1000;
            UUprice := maxPrice - (i * 1000);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) + '%';
       end else if OrgPrice > 100000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 500;
            UUprice := maxPrice - (i * 500);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end else if OrgPrice > 500000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 100;
            UUprice := maxPrice - (i * 100);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end else if OrgPrice > 10000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 50;
            UUprice := maxPrice - (i * 50);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end else if OrgPrice > 5000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 10;
            UUprice := maxPrice - (i * 10);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end else if OrgPrice > 1000 then begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3) mod 5;
            UUprice := maxPrice - (i * 5);
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end else begin
            maxPrice := floor(OrgPrice * 1.3) - floor(OrgPrice * 1.3);
            UUprice := maxPrice - i ;
            UUx := formatfloat('0.##',(UUprice - OrgPrice)*100 / OrgPrice) ;
       end;

       if StrTofloat(UUx) = 0 then Loc:= i;


       PriceSearch.Items.Add(formatfloat('#0,',UUprice) + '  (' + UUx + '%)' );

       i:=i+1;
   end;

       PriceSearch.ItemIndex := Loc;
       exit;
 finally
   //  showmessage( inttostr(OrgPrice) +'/' +  formatfloat('#0,',UUprice) + '  (' + UUx + '%)');

 end;
end;

procedure Tfrm5100.AutoSizeGridColumn(Grid : TStringGrid; column : integer);
var
i,j : integer;
temp : integer;
max : integer;
begin

  for i := 0 to Column -1 do begin
    max :=0;
    for j := 0 to (Grid.RowCount-1) do begin
        temp := Grid.Canvas.TextWidth(grid.cells[i, j]);
        if temp > max then
           max := temp;
    end;
    Grid.ColWidths[i] := max + Grid.GridLineWidth + 10;

  end;
end;





end.
