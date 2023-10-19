object frm5101: Tfrm5101
  Left = 355
  Top = 276
  Width = 425
  Height = 471
  Caption = '[5101] '#54788#47932#48373#49688#51221#49345#51452#47928
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
  object lstCode: TListBox
    Left = 8
    Top = 82
    Width = 100
    Height = 201
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    Items.Strings = (
      'A000660'
      'A005930')
    TabOrder = 0
  end
  object lstOrdType: TListBox
    Left = 108
    Top = 82
    Width = 100
    Height = 201
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    Items.Strings = (
      '00'
      '00')
    TabOrder = 1
  end
  object rgBS: TRadioGroup
    Left = 192
    Top = 16
    Width = 129
    Height = 33
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #47588#46020
      #47588#49688)
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 8
    Top = 56
    Width = 100
    Height = 25
    Caption = #51333#47785
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 109
    Top = 56
    Width = 100
    Height = 25
    Caption = #51452#47928#50976#54805
    TabOrder = 4
  end
  object Panel3: TPanel
    Left = 209
    Top = 56
    Width = 100
    Height = 25
    Caption = #51452#47928#49688#47049
    TabOrder = 5
  end
  object Panel4: TPanel
    Left = 310
    Top = 56
    Width = 100
    Height = 25
    Caption = #51452#47928#45800#44032
    TabOrder = 6
  end
  object lstQty: TListBox
    Left = 208
    Top = 82
    Width = 100
    Height = 201
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    Items.Strings = (
      '10'
      '10')
    TabOrder = 7
  end
  object lstPrc: TListBox
    Left = 309
    Top = 82
    Width = 100
    Height = 201
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    Items.Strings = (
      '22000'
      '800000')
    TabOrder = 8
  end
  object btnQuery: TButton
    Left = 328
    Top = 22
    Width = 75
    Height = 25
    Caption = #51452#47928
    TabOrder = 9
    OnClick = btnQueryClick
  end
  object ListBox3: TListBox
    Left = 8
    Top = 288
    Width = 401
    Height = 123
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    TabOrder = 10
  end
  object pnlMessage: TPanel
    Left = 0
    Top = 423
    Width = 417
    Height = 21
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 11
  end
  object Query: TXAQuery
    Left = 8
    Top = 392
    Width = 32
    Height = 32
    OnReceiveData = QueryReceiveData
    OnReceiveMessage = QueryReceiveMessage
    ControlData = {
      00030000D8130000D81300000800200000002F0049004F002F00740035003100
      300031005F0032002E007200650073000000}
  end
  object cbAccount: TComboBox
    Left = 11
    Top = 9
    Width = 145
    Height = 21
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 13
    TabOrder = 13
  end
  object edtPass: TEdit
    Left = 10
    Top = 32
    Width = 79
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    PasswordChar = '*'
    TabOrder = 14
    Text = '0000'
  end
end
