object DataModuleHtml: TDataModuleHtml
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 223
  Width = 257
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=17.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DSProxyPort=8888'
      'Filters={}')
    Connected = True
    Left = 56
    Top = 72
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 104
    Top = 112
  end
  object cdsCustomers: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESC'
    Params = <>
    ProviderName = 'dspCostumers'
    RemoteServer = DSProviderConnection1
    Left = 176
    Top = 144
    object cdsCustomersADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Size = 30
    end
    object cdsCustomersADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Size = 30
    end
    object cdsCustomersCITY: TStringField
      FieldName = 'CITY'
      Size = 25
    end
    object cdsCustomersCONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Size = 15
    end
    object cdsCustomersCONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
    end
    object cdsCustomersCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 15
    end
    object cdsCustomersCUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Required = True
    end
    object cdsCustomersDESC: TStringField
      FieldName = 'DESC'
      Required = True
      Size = 25
    end
    object cdsCustomersON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
    object cdsCustomersPHONE_NO: TStringField
      FieldName = 'PHONE_NO'
    end
    object cdsCustomersPOSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Size = 12
    end
    object cdsCustomersSTATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Size = 15
    end
  end
end
