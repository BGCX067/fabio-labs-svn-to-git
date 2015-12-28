object Aluno: TAluno
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object DataSetProvider: TDataSetProvider
    DataSet = Persistencia.SQLDataSet
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 40
    Top = 24
  end
  object CDSAluno: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from tb_aluno'
    ObjectView = False
    Params = <>
    ProviderName = 'DataSetProvider'
    BeforePost = CDSAlunoBeforePost
    Left = 144
    Top = 24
  end
end
