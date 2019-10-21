unit UAgendamentoModel;

interface

uses
  System.JSON, System.Classes, CAtribEntity, UBaseModel;

type
  [TableName('agenda')]
  [Route('agenda')]
  TAgendamentoModel = class(TBaseModel)
  private
    Fcod_medico: string;
    Fcod_paciente: string;
    Fmemo_mtvCancel: string;
    FstrDateTime: string;
    procedure SetFcod_medico(const Value: string);
    procedure SetFcod_paciente(const Value: string);
    procedure SetFmemo_mtvCancel(const Value: string);
    procedure SetFstrDateTime(const Value: string);
  public
    [FieldName('cod_medico')]
    property cod_medico: string read Fcod_medico  write SetFcod_medico;
    [FieldName('cod_paciente')]
    property cod_paciente: string read Fcod_paciente  write Fcod_paciente;
    [FieldName('memo_mtvCancel')]
    property memo_mtvCancel: string read Fmemo_mtvCancel  write Fmemo_mtvCancel;
    [FieldName('strDateTime')]
    property strDateTime: string read FstrDateTime  write FstrDateTime;
  end;

implementation

{ TAgendamentoModel }

procedure TAgendamentoModel.SetFcod_medico(const Value: string);
begin
  Fcod_medico := Value;
end;

procedure TAgendamentoModel.SetFcod_paciente(const Value: string);
begin
  Fcod_paciente := Value;
end;

procedure TAgendamentoModel.SetFmemo_mtvCancel(const Value: string);
begin
  Fmemo_mtvCancel := Value;
end;

procedure TAgendamentoModel.SetFstrDateTime(const Value: string);
begin
  FstrDateTime := Value;
end;

end.
