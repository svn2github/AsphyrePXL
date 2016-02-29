unit SecondFm;
{
  This file is part of Asphyre Framework, also known as Platform eXtended Library (PXL).
  Copyright (c) 2000 - 2016  Yuriy Kotsarenko

  The contents of this file are subject to the Mozilla Public License Version 2.0 (the "License");
  you may not use this file except in compliance with the License. You may obtain a copy of the
  License at http://www.mozilla.org/MPL/

  Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
  KIND, either express or implied. See the License for the specific language governing rights and
  limitations under the License.
}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type
  TSecondForm = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SecondForm: TSecondForm;

implementation
{$R *.lfm}

uses
  LCLType, PXL.Types, MainFm;

procedure TSecondForm.FormResize(Sender: TObject);
begin
  if MainForm <> nil then
  begin
    MainForm.SecondarySize := Point2px(ClientWidth, ClientHeight);

    if MainForm.EngineDevice <> nil then
      MainForm.EngineDevice.Resize(1, MainForm.SecondarySize);
  end;
end;

procedure TSecondForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if (MainForm <> nil) and MainForm.Visible then
    MainForm.Close;
end;

procedure TSecondForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.

