object frm0424: Tfrm0424
  Left = 540
  Top = 100
  Caption = '[0424] '#51452#49885#51092#44256'2'
  ClientHeight = 461
  ClientWidth = 664
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
    Width = 664
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 44
      Height = 13
      Caption = #44228#51340#48264#54840
    end
    object cbAccount: TComboBox
      Left = 67
      Top = 9
      Width = 145
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object edtPass: TEdit
      Left = 218
      Top = 9
      Width = 79
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      PasswordChar = '*'
      TabOrder = 2
      Text = '0000'
    end
    object btnQuery: TButton
      Left = 576
      Top = 8
      Width = 75
      Height = 25
      Caption = #51312#54924
      TabOrder = 1
      OnClick = btnQueryClick
    end
    object XAQuery1: TXAQuery
      Left = 328
      Top = 8
      Width = 0
      Height = 0
      OnReceiveData = XAQuery1ReceiveData
      OnReceiveMessage = XAQuery1ReceiveMessage
      ControlData = {
        00030000D8130000D81300000800220000002E002F0049004F002F0074003000
        3400320034005F0032002E007200650073000000}
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 664
    Height = 420
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object sgResult: TStringGrid
      Left = 1
      Top = 135
      Width = 662
      Height = 284
      Align = alClient
      ColCount = 29
      Ctl3D = False
      DefaultColWidth = 90
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 93
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      TabOrder = 0
    end
    object sgInfo: TStringGrid
      Left = 1
      Top = 1
      Width = 662
      Height = 134
      Align = alTop
      ColCount = 2
      Ctl3D = False
      DefaultRowHeight = 18
      RowCount = 7
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      TabOrder = 1
      ColWidths = (
        137
        145)
    end
  end
end
