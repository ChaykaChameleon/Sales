unit uSalesContentsChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Mask;

type
  TfmSalesContentsChange = class(TForm)
    pnMain: TPanel;
    qSalesContents: TADOQuery;
    qSalesContentsID_SALES: TIntegerField;
    qSalesContentsNAME: TStringField;
    qSalesContentsQTY: TIntegerField;
    qSalesContentsSUMM: TBCDField;
    qSalesContentsPRICE: TBCDField;
    qSalesContentsID_PRODUCT: TAutoIncField;
    qSalesContentsID: TAutoIncField;
    edQTY: TEdit;
    edPrice: TEdit;
    lbProduct: TLabel;
    lbQTY: TLabel;
    lbPrice: TLabel;
    btCreate: TButton;
    btChange: TButton;
    qProduct: TADOQuery;
    qProductID: TAutoIncField;
    qProductNAME: TStringField;
    dsProduct: TDataSource;
    lcProduct: TDBLookupComboBox;
    qCreate: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    qChange: TADOQuery;
    AutoIncField2: TAutoIncField;
    StringField2: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure btChangeClick(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesContentsChange: TfmSalesContentsChange;

implementation

{$R *.dfm}

uses uSales;

procedure TfmSalesContentsChange.btChangeClick(Sender: TObject);
begin
  if qProductID.IsNull then
  begin
    showmessage('�������� �����');
    abort
  end;
  if edPrice.Text = '' then
  begin
    showmessage('������� ����');
    abort
  end;
  if edQTY.Text = '' then
  begin
    showmessage('������� ���-��');
    abort
  end;

  qChange.Parameters.ParseSQL(qChange.SQL.Text, True);
  qChange.Parameters.ParamByName('VAR_ID').value :=
    fmSales.qSalesContentsID.value;
  qChange.Parameters.ParamByName('VAR_ID_PRODUCT').value := qProductID.value;
  qChange.Parameters.ParamByName('VAR_QTY').value := edQTY.Text;
  qChange.Parameters.ParamByName('VAR_PRICE').value := edPrice.Text;
  qChange.ExecSQL;
  fmSales.qSalesContents.Close;
  fmSales.qSalesContents.open;
  fmSales.qSales.Close;
  fmSales.qSales.open;
  fmSalesContentsChange.Close;
end;

procedure TfmSalesContentsChange.btCreateClick(Sender: TObject);
begin
  if qProductID.IsNull then
  begin
    showmessage('�������� �����');
    abort
  end;
  if (edPrice.Text = '') or (edPrice.Text = '0') then
  begin
    showmessage('������� ����');
    abort
  end;
  if (edQTY.Text = '') or (edQTY.Text = '0') then
  begin
    showmessage('������� ���-��');
    abort
  end;

  qCreate.Parameters.ParseSQL(qCreate.SQL.Text, True);
  qCreate.Parameters.ParamByName('VAR_ID_SALES').value :=
    fmSales.qSalesID.value;
  qCreate.Parameters.ParamByName('VAR_ID_PRODUCT').value := qProductID.value;
  qCreate.Parameters.ParamByName('VAR_QTY').value := edQTY.Text;
  qCreate.Parameters.ParamByName('VAR_PRICE').value := edPrice.Text;
  qCreate.ExecSQL;
  fmSales.qSalesContents.Close;
  fmSales.qSalesContents.open;
  fmSales.qSales.Close;
  fmSales.qSales.open;
  fmSalesContentsChange.Close;
end;

procedure TfmSalesContentsChange.edPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Key := #0;
end;

procedure TfmSalesContentsChange.FormCreate(Sender: TObject);
begin
  qProduct.open;
  lcProduct.KeyValue := qProduct.FieldByName(lcProduct.KeyField).value;
end;

end.
