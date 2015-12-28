object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 202
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 146
    Height = 13
    Caption = 'Buscar Empregado Pela Chave'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 136
    Top = 48
    Width = 58
    Height = 13
    Caption = 'Sobre Nome'
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 146
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 468
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edNome: TEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edSobreNome: TEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edTelefone: TEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Button2: TButton
    Left = 468
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 135
    Top = 104
    Width = 145
    Height = 21
    TabOrder = 6
    Text = 'ComboBox1'
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=database.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 224
    Top = 88
  end
end
