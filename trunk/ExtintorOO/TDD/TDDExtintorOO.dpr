program TDDExtintorOO;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  Reaproveitamento.Extintor.Negocio in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.Negocio.pas',
  Reaproveitamento.Extintor.Repositorio in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.Repositorio.pas',
  Reaproveitamento.Extintor.Controle in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.Controle.pas',
  Reaproveitamento.Extintor.Fachada in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.Fachada.pas',
  TestReaproveitamento.Extintor in 'TestReaproveitamento.Extintor.pas',
  Reaproveitamento.Extintor.Excecoes in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.Excecoes.pas',
  Reaproveitamento.Extintor.AppConfig in '..\..\Reaproveitamento\Extintor\Reaproveitamento.Extintor.AppConfig.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

