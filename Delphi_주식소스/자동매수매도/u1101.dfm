object frm1101: Tfrm1101
  Left = 361
  Top = 245
  Caption = #54788#51116#44032
  ClientHeight = 541
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 44
      Height = 13
      Caption = #51333#47785#53076#46300
    end
    object Button1: TButton
      Left = 187
      Top = 10
      Width = 58
      Height = 25
      Caption = #51312#54924
      TabOrder = 0
      OnClick = Button1Click
    end
    object edtCode: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 1
      Text = '005930'
    end
    object XAQuery1: TXAQuery
      Left = 448
      Top = 8
      Width = 0
      Height = 0
      OnReceiveData = XAQuery1ReceiveData
      OnReceiveMessage = XAQuery1ReceiveMessage
      ControlData = {
        00030000D8130000D813000008001E00000049004F002F007400310031003000
        31005F0032002E007200650073000000}
    end
    object XAReal1: TXAReal
      Left = 496
      Top = 8
      Width = 0
      Height = 0
      OnReceiveRealData = XAReal1ReceiveRealData
      ControlData = {
        00030000D8130000D813000008001600000049004F002F00480041005F002E00
        7200650073000000}
    end
    object XAReal2: TXAReal
      Left = 552
      Top = 8
      Width = 0
      Height = 0
      OnReceiveRealData = XAReal2ReceiveRealData
      ControlData = {
        00030000D8130000D813000008001A00000049004F002F00530033005F005F00
        32002E007200650073000000}
    end
  end
  object Panel2: TPanel
    Left = 298
    Top = 41
    Width = 486
    Height = 475
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 484
      Height = 41
      Align = alTop
      Caption = 'I/O'#51312#54924#44208#44284
      TabOrder = 0
      object Button2: TButton
        Left = 309
        Top = 7
        Width = 58
        Height = 25
        Caption = 'I/O'#51312#54924
        TabOrder = 0
        OnClick = Button2Click
      end
      object Panel5: TPanel
        Left = 16
        Top = 8
        Width = 105
        Height = 25
        Caption = #54840#44032#49884#44036
        TabOrder = 1
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 42
      Width = 484
      Height = 432
      Align = alClient
      ImeName = 'Microsoft Office IME 2007'
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 298
    Height = 475
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object sgResult: TStringGrid
      Left = 1
      Top = 1
      Width = 296
      Height = 473
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 93
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      ColWidths = (
        137
        145)
    end
  end
  object pnlMessage: TPanel
    Left = 0
    Top = 516
    Width = 784
    Height = 25
    Align = alBottom
    TabOrder = 3
  end
end
