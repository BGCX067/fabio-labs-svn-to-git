object Form1: TForm1
  Left = 199
  Top = 127
  Caption = 'Form1'
  ClientHeight = 422
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 104
    Top = 96
    object Aluno1: TMenuItem
      Caption = 'Aluno'
      OnClick = Aluno1Click
    end
    object Matrcula1: TMenuItem
      Caption = 'Matr'#237'cula'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
