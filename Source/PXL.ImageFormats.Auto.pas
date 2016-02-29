unit PXL.ImageFormats.Auto;
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
{< Automatic cross-platform image format handler instance creation. }
interface

{$INCLUDE PXL.Config.inc}

uses
  PXL.ImageFormats;

{ Enable the following option to use Vampyre Imaging Library on non-Windows platforms instead of LCL. This provides
  superior performance but might not work on all platforms. }
{.$DEFINE USE_VAMPYRE_IMAGING}

{$IFDEF DELPHI}
  {$DEFINE USE_VAMPYRE_IMAGING}
{$ENDIF}

{ Creates image format handler by default choosen depending on platform, OS and available support. }
function CreateDefaultImageFormatHandler(const ImageFormatManager: TImageFormatManager): TCustomImageFormatHandler;

implementation

uses
{$IFDEF MSWINDOWS}
  PXL.ImageFormats.WIC
{$ELSE}
  {$IFDEF USE_VAMPYRE_IMAGING}
    PXL.ImageFormats.Vampyre
  {$ELSE}
    PXL.ImageFormats.FCL
  {$ENDIF}
{$ENDIF};

function CreateDefaultImageFormatHandler(const ImageFormatManager: TImageFormatManager): TCustomImageFormatHandler;
begin
{$IFDEF MSWINDOWS}
  Result := TWICImageFormatHandler.Create(ImageFormatManager);
{$ELSE}
  {$IFDEF USE_VAMPYRE_IMAGING}
    Result := TVampyreImageFormatHandler.Create(ImageFormatManager);
  {$ELSE}
    Result := TFCLImageFormatHandler.Create(ImageFormatManager);
  {$ENDIF}
{$ENDIF}
end;

end.
