object frm6024: Tfrm6024
  Left = 377
  Top = 320
  Caption = #51613#44144#44552#50984#48324#51452#47928#44032#45733#44552#50529#51312#54924
  ClientHeight = 421
  ClientWidth = 586
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
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbAccount: TComboBox
    Left = 11
    Top = 9
    Width = 145
    Height = 21
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object edtPass: TEdit
    Left = 10
    Top = 32
    Width = 79
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    PasswordChar = '*'
    TabOrder = 1
    Text = '0000'
  end
  object Query: TXAQuery
    Left = 256
    Top = 8
    Width = 0
    Height = 0
    OnReceiveData = QueryReceiveData
    ControlData = {
      00030000D8130000D81300000800200000002F0069006F002F00740036003000
      300035005F0032002E007200650073000000}
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 104
    Width = 553
    Height = 265
    FixedCols = 0
    TabOrder = 4
  end
end
