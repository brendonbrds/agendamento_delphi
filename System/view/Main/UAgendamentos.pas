unit UAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, System.JSON, UBaseView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TBaseView)
    Panel1: TPanel;
    btn_adicionar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    cod_medico: TEdit;
    Label1: TLabel;
    name_medico: TEdit;
    cod_paciente: TEdit;
    Label2: TLabel;
    name_paciente: TEdit;
    Label3: TLabel;
    date_picker: TDateTimePicker;
    check_cancelado: TCheckBox;
    Label4: TLabel;
    memo_mtvCancel: TMemo;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_editar: TSpeedButton;
    Panel4: TPanel;
    grid_listaAgend: TDBGrid;
    time_picker: TDateTimePicker;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure clear;
    procedure check_canceladoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cod_medicoKeyPress(Sender: TObject; var Key: Char);
    procedure cod_pacienteKeyPress(Sender: TObject; var Key: Char);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
  end;

var
  Form1: TForm1;
  strDate: string;
  strTime: string;
  strDateTime: string;

implementation

{$R *.dfm}

uses UListaMedicos, UListaPacientes, UBaseModel, UAgendamentoModel;

procedure TForm1.AfterConstruction;
begin
  inherited;
  Self.FDataSet := TBaseModel.Create(FDMemTable1);
end;

procedure TForm1.btn_adicionarClick(Sender: TObject);
begin

  cod_medico.Enabled := true;
  cod_paciente.Enabled := true;
  date_picker.Enabled := true;
  time_picker.Enabled := true

end;

procedure TForm1.check_canceladoClick(Sender: TObject);
begin
  if check_cancelado.Checked = true then
  begin
    memo_mtvCancel.Enabled := true;
  end
  else
  begin
    memo_mtvCancel.Enabled := false;
  end;
end;

procedure TForm1.clear;
begin
  cod_medico.Text := '';
  cod_paciente.Text := '';
  name_medico.Text := '';
  name_paciente.Text := '';
  memo_mtvCancel.Text := '';

end;

procedure TForm1.cod_medicoKeyPress(Sender: TObject; var Key: Char);
begin
  // se o ENTER for pressionado
  if Key = #13 then
    // se o campo estiver vazio
    if (cod_medico.Text = '') then
      Form2.Show
    else if StrToInt(cod_medico.Text) > 0 then
    // aqui busca o nome do medido da api
    begin
      // id := cod_medico.Text;
      // ShowMessage(id);
    end;

end;

procedure TForm1.cod_pacienteKeyPress(Sender: TObject; var Key: Char);
begin
  // se o ENTER for pressionado
  if Key = #13 then
    // se o campo estiver vazio
    if cod_paciente.Text = '' then
      Form3.Show
    else if StrToInt(cod_paciente.Text) > 0 then
      // aqui busca o nome do paciente da api
      // ShowMessage('ok');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
  end;
end;

procedure TForm1.btn_salvarClick(Sender: TObject);
var
  Retorno: string;
begin
  // converte data e hora para string
  strDate := DateToStr(date_picker.Date);
  strTime := TimeToStr(time_picker.Time);
  strDateTime := 'Data: ' + strDate + ' Hor�rio: ' + strTime;
  // ShowMessage(strDateTime);
  if (cod_medico.Text = '') or (cod_paciente.Text = '') then
  begin
    ShowMessage('Campos vazios!');
  end;

  if (check_cancelado.Checked = true) and (memo_mtvCancel.Text = '') then
  begin
    ShowMessage('Aten��o! Voc� n�o informou o motivo do cancelamento');

  end
  else
  begin
    Self.DataSet.SetProp('cod_medico', cod_medico.Text);
    Self.DataSet.SetProp('cod_paciente', cod_paciente.Text);
    Self.DataSet.SetProp('memo_mtvCancel', memo_mtvCancel.Text);
    Self.DataSet.SetProp('strDateTime', strDateTime);

    Retorno := Self.DataSet.Save;
    if Retorno <> EmptyStr then
    begin
      Application.MessageBox(PWideChar(Retorno), 'Sucesso', MB_ICONINFORMATION);
    end
    else
    begin
      Application.MessageBox('Erro ao salvar registro', 'Algo deu errado',
        MB_ICONERROR);
    end;
  end;

  cod_medico.Enabled := false;
  cod_paciente.Enabled := false;
  date_picker.Enabled := false;
  time_picker.Enabled := false;
  check_cancelado.Checked := false;

  // !chamar a procedure clear por �ltimo
  clear;
end;

procedure TForm1.btn_excluirClick(Sender: TObject);
var
  Retorno: string;
begin
  Retorno := Self.DataSet.Delete;

  ShowMessage(Retorno);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // Os controles da tela recebem os valores de acordo com os atributos do objeto
  memo_mtvCancel.Text := '';
  cod_medico.Text := Self.DataSet.GetProp('cod_medico');
  cod_paciente.Text := Self.DataSet.GetProp('cod_paciente');
  memo_mtvCancel.Text := Self.DataSet.GetProp('memo_mtvCancel');
  strDateTime := Self.DataSet.GetProp('strDateTime');
end;

end.
