unit PXL.Sensors.Types;
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
  SysUtils, PXL.Boards.Types;

type
  TCustomSensor = class
  end;

  ESensorGeneric = class(Exception);
  ESensorDataRead = class(ESensorGeneric);
  ESensorDataWrite = class(ESensorGeneric);
  ESensorNoDataPort = class(ESensorGeneric);
  ESensorInvalidAddress = class(ESensorGeneric);
  ESensorInvalidChipID = class(ESensorGeneric);
  ESensorNoSystemCore = class(ESensorGeneric);
  ESensorNoGPIO = class(ESensorGeneric);

resourcestring
  SSensorDataRead = 'Unable to read <%d> bytes from sensor.';
  SSensorDataWrite = 'Unable to write <%d> bytes to sensor.';
  SSensorNoDataPort = 'A valid data port is required for the sensor.';
  SSensorInvalidAddress = 'The specified sensor address <%x> is invalid.';
  SSensorInvalidChipID = 'Invalid sensor Chip ID, expected <%x>, found <%x>.';
  SSensorNoSystemCore = 'A valid system core is required for the sensor.';
  SSensorNoGPIO = 'A valid GPIO interface is required for the sensor.';

implementation

end.
