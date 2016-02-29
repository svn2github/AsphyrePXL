unit PXL.Sysfs.ADC;
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

{$INCLUDE PXL.Config.inc}

uses
  PXL.TypeDef, PXL.Sysfs.Types, PXL.Boards.Types;

type
  TSysfsADC = class(TCustomADC)
  private const
    MaximumSupportedChannels = 64;
  private
    FSystemPath: StdString;
  protected
    function GetRawValue(const Channel: Integer): Integer; override;
  public
    constructor Create(const ASystemPath: StdString);
  end;

  EADCGeneric = class(ESysfsGeneric);
  EADCInvalidChannel = class(EADCGeneric);

resourcestring
  SADCSpecifiedChannelInvalid = 'The specified ADC channel <%d> is invalid.';

implementation

uses
  SysUtils;

constructor TSysfsADC.Create(const ASystemPath: StdString);
begin
  inherited Create;

  FSystemPath := ASystemPath;
end;

function TSysfsADC.GetRawValue(const Channel: Integer): Integer;
begin
  if (Channel < 0) or (Channel > MaximumSupportedChannels) then
    raise EADCInvalidChannel.Create(Format(SADCSpecifiedChannelInvalid, [Channel]));

  Result := StrToInt(Trim(ReadTextFromFile(FSystemPath + '/in_voltage' + IntToStr(Channel) + '_raw')));
end;

end.

