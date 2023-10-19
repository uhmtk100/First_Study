object DB_Box: TDB_Box
  Left = 445
  Top = 127
  ActiveControl = OKButton
  BorderStyle = bsDialog
  Caption = #51217#49549
  ClientHeight = 214
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 277
    Height = 158
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    BevelOuter = bvLowered
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 32
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Local '#51217#49549
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 32
      Top = 47
      Width = 113
      Height = 17
      Caption = #50896#44201#51217#49549
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object Edit1: TEdit
      Left = 32
      Top = 80
      Width = 201
      Height = 21
      TabOrder = 2
      Text = 'gw.cloudus.dev,807'
    end
  end
  object OKButton: TButton
    Left = 118
    Top = 175
    Width = 64
    Height = 33
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    IsControl = True
  end
end
