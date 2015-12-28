object FCadastroAluno: TFCadastroAluno
  Left = 561
  Top = 202
  Width = 280
  Height = 176
  Caption = 'Aluno'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 152
    Top = 16
    Width = 105
    Height = 105
    OnDblClick = Image1DblClick
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object DateEdit1: TDateEdit
    Left = 16
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
end
