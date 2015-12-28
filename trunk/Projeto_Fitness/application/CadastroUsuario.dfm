inherited FCadastroUsuario: TFCadastroUsuario
  Caption = 'Cadastro Usuario'
  ClientHeight = 289
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 19
  inherited PageControl1: TPageControl
    Height = 289
    ExplicitWidth = 440
    ExplicitHeight = 255
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 432
      ExplicitHeight = 221
      inherited pnPesquisa: TPanel
        ExplicitWidth = 432
      end
      inherited DBGrid1: TDBGrid
        Height = 198
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitHeight = 296
      object Label1: TLabel [0]
        Left = 16
        Top = 8
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 72
        Width = 39
        Height = 19
        Caption = 'Login'
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 136
        Width = 43
        Height = 19
        Caption = 'Senha'
      end
      object lbConfirmacao: TLabel [3]
        Left = 226
        Top = 136
        Width = 89
        Height = 19
        Caption = 'Confirma'#231#227'o'
      end
      inherited Panel: TPanel
        Top = 205
        ExplicitTop = 246
        ExplicitWidth = 630
      end
      object edNome: TDBEdit
        Left = 16
        Top = 33
        Width = 410
        Height = 27
        DataField = 'USUARIO_NOME'
        DataSource = DataSource
        TabOrder = 1
      end
      object edLogin: TDBEdit
        Left = 16
        Top = 96
        Width = 200
        Height = 27
        DataField = 'USUARIO_LOGIN'
        DataSource = DataSource
        TabOrder = 2
      end
      object edSenha: TDBEdit
        Left = 16
        Top = 161
        Width = 200
        Height = 27
        DataField = 'USUARIO_SENHA'
        DataSource = DataSource
        PasswordChar = '*'
        TabOrder = 3
      end
      object edConfirmacao: TEdit
        Left = 226
        Top = 161
        Width = 200
        Height = 27
        PasswordChar = '*'
        TabOrder = 4
      end
    end
  end
  inherited DataSource: TDataSource
    DataSet = Usuario.CDSUsuario
    Left = 344
    Top = 72
  end
end
