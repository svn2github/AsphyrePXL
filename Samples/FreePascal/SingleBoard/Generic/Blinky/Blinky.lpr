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
  This example illustrates how to blink a LED using Sysfs GPIO interface.

  Attention! Please follow these instructions before running the sample:

   1. When creating TSysfsGPIO class, make sure that Linux path (by default /sys/class/gpio) to GPIO is correct.

   2. PinLED constant should contain actual Linux GPIO number corresponding to physical pin.

   3. On some devices, before using pins for GPIO, it is necessary to set one or more multiplexers. Refer to the
      manual of your specific device for the information on how to do this. In many cases, you can use the same GPIO
      class to do it, e.g. "GPIO.SetMux(24, TPinValue.High)".

   4. After compiling and uploading this sample, change its attributes to executable. It is also recommended to
      execute this application with administrative privileges. Something like this:
        chmod +x Blinky
        sudo ./Blinky

   5. Check the accompanying diagram and photo to see an example on how this can be connected on BeagleBone Black.
      Note that for BeagleBone Black, check tables on pages 70 and 72 from "BeagleBone Black System Reference Manual"
      to determine actual GPIO number. In this case, pin P9_12 in Mode7 corresponds to "gpio1[28]" and since each
      "gpio" is offset by 32 starting from zero, the actual pin number is 1 * 32 + 28 = 60.
}
uses
  Crt, PXL.Timing, PXL.Boards.Types, PXL.Sysfs.GPIO;

const
  PinLED = 60;

var
  GPIO: TCustomGPIO = nil;
  TurnedOn: Boolean = False;
begin
  GPIO := TSysfsGPIO.Create;
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

      MicroSleep(500000); // wait for 500 ms
    end;

    // Eat the key pressed so it won't go to terminal after we exit.
    ReadKey;

    // Turn the LED off after we are done and switch it to "Input" just to be safe.
    GPIO.PinMode[PinLED] := TPinMode.Input;
  finally
    GPIO.Free;
  end;
end.

