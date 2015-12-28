object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 172
  Width = 215
  object FBEMPLOYEE: TSQLConnection
    ConnectionName = 'FBEMPLOYEE'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver170.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=17.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver170.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=17.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=C:\Arquivos de programas\Firebird\Firebird_2_5\examples' +
        '\empbuild\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 29
    Top = 27
  end
  object sqlCostumers: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ADDRESS_LINE1'
      '            ,ADDRESS_LINE2'
      '            ,CITY'
      '            ,CONTACT_FIRST'
      '            ,CONTACT_LAST'
      '            ,COUNTRY'
      '            ,CUST_NO'
      '            ,CUSTOMER DESC'
      '            ,ON_HOLD'
      '            ,PHONE_NO'
      '            ,POSTAL_CODE'
      '            ,STATE_PROVINCE'
      ' FROM CUSTOMER')
    SQLConnection = FBEMPLOYEE
    Left = 88
    Top = 48
  end
  object dspCostumers: TDataSetProvider
    DataSet = sqlCostumers
    Left = 144
    Top = 80
  end
end
