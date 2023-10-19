object frm0425: Tfrm0425
  Left = 255
  Top = 121
  Caption = '[0425] '#51452#49885#52404#44208'/'#48120#52404#44208
  ClientHeight = 441
  ClientWidth = 699
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
    Width = 699
    Height = 77
    Align = alTop
    Caption = '`'
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
    object rgfills: TRadioGroup
      Left = 107
      Top = 33
      Width = 200
      Height = 37
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '0.'#51204#52404
        '1.'#52404#44208
        '2.'#48120#52404#44208)
      TabOrder = 3
    end
    object rgMM: TRadioGroup
      Left = 312
      Top = 32
      Width = 189
      Height = 37
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '0.'#51204#52404
        '1.'#47588#46020
        '2.'#47588#49688)
      TabOrder = 4
    end
    object rgSort: TRadioGroup
      Left = 507
      Top = 33
      Width = 191
      Height = 37
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        '1.'#51452#47928#48264#54840#50669#49692
        '2.'#51452#47928#48264#54840#49692)
      TabOrder = 5
    end
    object edtCode: TEdit
      Left = 6
      Top = 41
      Width = 95
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 6
    end
    object XAQuery1: TXAQuery
      Left = 440
      Top = 8
      Width = 0
      Height = 0
      OnReceiveData = XAQuery1ReceiveData
      OnReceiveMessage = XAQuery1ReceiveMessage
      ControlData = {
        00030000D8130000D81300000800220000002E002F0049004F002F0074003000
        3400320035005F0032002E007200650073000000}
    end
  end
  object sgInfo: TStringGrid
    Left = 0
    Top = 77
    Width = 699
    Height = 173
    Align = alTop
    ColCount = 2
    Ctl3D = False
    DefaultRowHeight = 18
    RowCount = 9
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ParentCtl3D = False
    TabOrder = 1
    ColWidths = (
      137
      145)
  end
  object sgResult: TStringGrid
    Left = 0
    Top = 250
    Width = 699
    Height = 191
    Align = alClient
    ColCount = 22
    Ctl3D = False
    DefaultColWidth = 90
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 93
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ParentCtl3D = False
    TabOrder = 2
  end
end
