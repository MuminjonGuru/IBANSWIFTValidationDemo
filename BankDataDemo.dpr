program BankDataDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  BankData.UnitMain in 'BankData.UnitMain.pas' {BankDataForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBankDataForm, BankDataForm);
  Application.Run;
end.
