inherited FLogin: TFLogin
  Caption = 'Login'
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 39
    Height = 19
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 43
    Height = 19
    Caption = 'Senha'
  end
  object Panel: TPanel
    Left = 0
    Top = 152
    Width = 455
    Height = 50
    Align = alBottom
    TabOrder = 0
    object btnCancelar: TButton
      Left = 288
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnEntrar: TButton
      Left = 369
      Top = 16
      Width = 75
      Height = 25
      ParentCustomHint = False
      Caption = '&Entrar'
      Default = True
      TabOrder = 1
      OnClick = btnEntrarClick
    end
  end
  object edLogin: TEdit
    Left = 16
    Top = 40
    Width = 200
    Height = 27
    TabOrder = 1
  end
  object edSenha: TEdit
    Left = 16
    Top = 96
    Width = 200
    Height = 27
    PasswordChar = '*'
    TabOrder = 2
  end
end
