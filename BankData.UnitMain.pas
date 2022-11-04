unit BankData.UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Grid,
  FMX.Grid, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter;

type
  TBankDataForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    StringGridBindSourceDB1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BankDataForm: TBankDataForm;

implementation

{$R *.fmx}

procedure TBankDataForm.Button1Click(Sender: TObject);
begin
  RESTClient1.ResetToDefaults;
  RESTClient1.Accept := 'application/json';
  RESTClient1.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient1.BaseURL :=
    'https://api.apilayer.com/bank_data/swift_check?swift_code=' + Edit1.Text +
    '&apikey=S5MmmH3NGsRfL432o98VBVJHf9zfAgzm';

  RESTResponse1.ContentType := 'application/json';
  // send request
  RESTRequest1.Execute;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TBankDataForm.Button2Click(Sender: TObject);
begin
  RESTClient2.ResetToDefaults;
  RESTClient2.Accept := 'application/json';
  RESTClient2.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient2.BaseURL :=
    'https://api.apilayer.com/bank_data/iban_validate?apikey=S5MmmH3NGsRfL432o98VBVJHf9zfAgzm&iban_number='
    + Edit2.Text;

  RESTResponse2.ContentType := 'application/json';

  RESTRequest2.Execute;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse2.Content);
end;

procedure TBankDataForm.FormCreate(Sender: TObject);
begin
  RESTRequest3.Execute;
end;

end.
