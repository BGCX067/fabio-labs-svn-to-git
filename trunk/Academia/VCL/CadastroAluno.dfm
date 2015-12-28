inherited FCadastroAluno: TFCadastroAluno
  Caption = 'Cadastro Aluno'
  ClientHeight = 389
  OnShow = FormShow
  ExplicitWidth = 471
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 16
    Caption = 'Nome'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 48
    Width = 66
    Height = 16
    Caption = 'Nascimento'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 88
    Width = 35
    Height = 16
    Caption = 'E-Mail'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 128
    Width = 40
    Height = 16
    Caption = 'Celular'
  end
  object Label5: TLabel [4]
    Left = 112
    Top = 128
    Width = 32
    Height = 16
    Caption = 'Outro'
  end
  inherited pnButtons: TPanel
    Top = 348
    ExplicitTop = 348
  end
  object EdNome: TEdit
    Left = 8
    Top = 24
    Width = 294
    Height = 24
    TabOrder = 1
  end
  object edNascimento: TDateTimePicker
    Left = 8
    Top = 64
    Width = 97
    Height = 24
    Date = 41724.056717037040000000
    Time = 41724.056717037040000000
    TabOrder = 2
  end
  object PnFoto: TPanel
    Left = 308
    Top = 24
    Width = 140
    Height = 169
    Color = clBackground
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 3
    object Image: TImage
      Left = 3
      Top = 3
      Width = 133
      Height = 162
    end
  end
  object gbSexo: TRadioGroup
    Left = 120
    Top = 48
    Width = 182
    Height = 40
    Caption = ' Sexo '
    Columns = 2
    Items.Strings = (
      'Feminino'
      'Masculino')
    TabOrder = 4
  end
  object edEmail: TEdit
    Left = 8
    Top = 104
    Width = 294
    Height = 24
    TabOrder = 5
  end
  object edCelular: TEdit
    Left = 8
    Top = 144
    Width = 97
    Height = 24
    TabOrder = 6
  end
  object edFone: TEdit
    Left = 112
    Top = 144
    Width = 97
    Height = 24
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 199
    Width = 439
    Height = 146
    Caption = ' Endere'#231'o '
    TabOrder = 8
    object Label6: TLabel
      Left = 3
      Top = 24
      Width = 22
      Height = 16
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 103
      Top = 24
      Width = 65
      Height = 16
      Caption = 'Logradouro'
    end
    object Label8: TLabel
      Left = 371
      Top = 24
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
    end
    object Label9: TLabel
      Left = 3
      Top = 64
      Width = 34
      Height = 16
      Caption = 'Bairro'
    end
    object Label10: TLabel
      Left = 186
      Top = 64
      Width = 39
      Height = 16
      Caption = 'Cidade'
    end
    object Label11: TLabel
      Left = 371
      Top = 64
      Width = 15
      Height = 16
      Caption = 'UF'
    end
    object edCEP: TEdit
      Left = 3
      Top = 40
      Width = 94
      Height = 24
      TabOrder = 0
    end
    object edLogradouro: TEdit
      Left = 103
      Top = 40
      Width = 266
      Height = 24
      TabOrder = 1
    end
    object edNumero: TEdit
      Left = 371
      Top = 40
      Width = 63
      Height = 24
      TabOrder = 2
    end
    object edBairro: TEdit
      Left = 3
      Top = 80
      Width = 179
      Height = 24
      TabOrder = 3
    end
    object edCidade: TEdit
      Left = 186
      Top = 80
      Width = 183
      Height = 24
      TabOrder = 4
    end
    object edUF: TEdit
      Left = 371
      Top = 80
      Width = 65
      Height = 24
      TabOrder = 5
    end
  end
end
