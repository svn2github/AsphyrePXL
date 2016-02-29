program Blinky;
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
{
  This example illustrates a simple use of GPIO on Raspberry PI to blink a LED.

  Make sure to connect the LED to RPi pin #16 (BCM 23), please take a look at the accompanying diagram and photo.
}
uses
  Crt, PXL.Boards.Types, PXL.Boards.RPi;

const
  PinLED = 16;

var
  SystemCore: TFastSystemCore = nil;
  GPIO: TFastGPIO = nil;
  TurnedOn: Boolean = False;
begin
  SystemCore := TFastSystemCore.Create;
  try
    GPIO := TFastGPIO.Create(SystemCore);
    try
      // Switch LED pin for output.
      GPIO.PinMode[PinLED] := TPinMode.Output;

      WriteLn('Blinking LED, press any key to exit...');

      while not KeyPressed do
      begin
        TurnedOn := not TurnedOn;

        if TurnedOn then
          GPIO.PinValue[PinLED] := TPinValue.High
        else
          GPIO.PinValue[PinLED] := TPinValue.Low;

        SystemCore.Delay(500000); // wait for 500 ms
      end;

      // Eat the key pressed so it won't go to terminal after we exit.
      ReadKey;

      // Turn the LED off after we are done and switch it to "Input" just to be safe.
      GPIO.PinMode[PinLED] := TPinMode.Input;
    finally
      GPIO.Free;
    end;
  finally
    SystemCore.Free;
  end;
end.

