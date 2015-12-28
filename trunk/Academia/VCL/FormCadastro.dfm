object FFormCadastro: TFFormCadastro
  Left = 0
  Top = 0
  Caption = 'FFormCadastro'
  ClientHeight = 202
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnButtons: TPanel
    Left = 0
    Top = 161
    Width = 455
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 274
      Top = 5
      Width = 86
      Height = 31
      Caption = 'Aplicar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 364
      Top = 5
      Width = 86
      Height = 31
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
