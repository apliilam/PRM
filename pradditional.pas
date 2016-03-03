unit prAdditional;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, forms, Process, fileutil,
  ExtCtrls, Graphics, controls,
  LCLType, LCLIntf, intfgraphics, lazcanvas, LCLProc, dateutils;


procedure MyPause(p:integer);
procedure ReadTitleFromFile(const FileName: string; var fTitle: string);
procedure BakePanelControlsToForm(sketchPanel: TPanel; bmp: TBitmap);
function Proportional_TPictureToTImageSizeHeight(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
function Proportional_TPictureToTImageSizeWidth(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
procedure AddSketchImgToForm(SketchFile: string);
procedure SaveBitmapToJPG(bmp: TBitmap; SaveFileName: string; quality:TJPEGQualityRange);
procedure SetSketchImgProperty(img: TImage);
procedure GoToCropIMG(SrcImg, DstImg: TImage);
procedure SwapIfMinus(var c1,c2:integer);
function RectReSize(FakeRect:TRect; IndexResize: Real):TRect;
procedure RotateBitmap90(Const Bitmap: TBitmap);
procedure RotateTImage(img: TImage);
function CutStringUpTo(str: string; n: integer): string;
function GetDateLastGhange(f: string): TDateTime;

implementation

uses Unit1, CrpImg;


procedure MyPause(p:integer);  // p - пауза в милисекукундах
var pa1:TDateTime;
    h,m,s,ms:Integer;
begin
  h:=trunc(p/3600000);
  m:=trunc((p-3600000*h)/60000);
  s:=trunc((p-3600000*h-60000*m)/1000);
  ms:=p-3600000*h-60000*m-1000*s;

  pa1:=EncodeTime(h,m,s,ms)+now;
  repeat
    application.processmessages;
    sleep(50);
  until now>=pa1;
end;



procedure ReadTitleFromFile(const FileName: string; var fTitle: string);
var
  AProcess: TProcess;
  AStringList: TStringList;
  fDate: TDateTime;
begin
  AProcess := TProcess.Create(nil);
  AStringList := TStringList.Create;
  AProcess.CommandLine := UTF8toSys('sys\exiftool.exe -d "%d.%m.%Y" -s3 -title -createdate "'+FileName+'"');
  AProcess.Options := AProcess.Options + [poUsePipes];
  //AProcess.Options := AProcess.Options + [poNoConsole];     //закоментить чтобы скрывало
  AProcess.ShowWindow := swoHIDE;
  AProcess.Execute;
  AStringList.LoadFromStream(AProcess.Output);
  if AStringList.Count>1 then
    begin
      fTitle:=AStringList.Strings[0];
      //fDate:=StrToDateTime(AStringList.Strings[1]);    // если бы мы брали дату из IPTC
    end
  else
    begin
      fTitle:='';
      //fDate:=StrToDateTime('');
    end;
  AStringList.Free;
  AProcess.Free;
end;

procedure StretchDrawBitmapToBitmap(SourceBitmap, DestBitmap: TBitmap; DestWidth, DestHeight: integer);
var
  DestIntfImage, SourceIntfImage: TLazIntfImage;
  DestCanvas: TLazCanvas;
begin
  DestIntfImage:= TLazIntfImage.Create(0, 0);
  DestIntfImage.LoadFromBitmap(DestBitmap.Handle, 0);
  DestCanvas:= TLazCanvas.Create(DestIntfImage);

  SourceIntfImage:= TLazIntfImage.Create(0, 0);
  SourceIntfImage.LoadFromBitmap(SourceBitmap.Handle, 0);

  DestCanvas.Interpolation:= TFPSharpInterpolation.Create;
  DestCanvas.StretchDraw(0, 0, DestWidth, DestHeight, SourceIntfImage);
  DestBitmap.LoadFromIntfImage(DestIntfImage);

  SourceIntfImage.Free;
  DestCanvas.Interpolation.Free;
  DestCanvas.Free;
  DestIntfImage.Free;
end;

{
function CompressionQuality(bmp:TBitmap; Quality: integer):TBitmap;
var
  jpg: TJPEGImage;
  bmp2: TBitmap;
begin
  jpg:=TJPEGImage.Create;
  try
    jpg.Assign(bmp);
    jpg.CompressionQuality:=Quality; //0-100

    bmp2:=bmp;
    bmp2.Assign(jpg);
    result:= bmp2;
  finally
    jpg.Free;
  end;
end;
}


procedure BakePanelControlsToForm(sketchPanel: TPanel; bmp: TBitmap);
var
  i: integer;
  imgTemp: TImage;
  bmpTemp: TBitmap;
begin
  if sketchPanel.ControlCount>0 then
    for i:=0 to sketchPanel.ControlCount-1 do
      begin
        imgTemp:=(sketchPanel.Controls[i] as TImage);
        bmpTemp:= TBitmap.Create;
        bmpTemp.PixelFormat:=pf4bit;
        bmpTemp.Transparent:=true;
        bmpTemp.Width := imgTemp.Width;
        bmpTemp.Height := imgTemp.Height;
        StretchDrawBitmapToBitmap(imgTemp.Picture.Bitmap, bmpTemp, imgTemp.Width, imgTemp.Height);
        bmp.Canvas.Draw(sketchPanel.Left+imgTemp.Left+2, sketchPanel.Top+imgTemp.Top+2, bmpTemp);
        bmpTemp.Destroy;
      end;
end;


function Proportional_TPictureToTImageSizeHeight(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Height
begin
  result:=Img.Width*Pic.Height div Pic.Width;
end;

function Proportional_TPictureToTImageSizeWidth(Pic:TPicture; Img: TImage): integer; //make proportional TImage size Width
begin
  result:=Img.Height*Pic.Width div Pic.Height;
end;

procedure SetSketchImgProperty(img: TImage);
begin
  img.Proportional := true;
  img.Stretch := true;

  if img.Picture.Width>img.Picture.Height then
    begin
      img.Width := Form1.prPanel1.Width div 2;
      img.Height:= Proportional_TPictureToTImageSizeHeight(img.Picture, img);
    end;
  if img.Picture.Width<=img.Picture.Height then
    begin
      img.Height := Form1.prPanel1.Height-10;
      img.Width:= Proportional_TPictureToTImageSizeWidth(img.Picture, img);
    end;
end;

procedure AddSketchImgToForm(SketchFile: string);
var
  img: TImage;
  j: integer;
begin
  if FileExistsUTF8(SketchFile) then
    begin
      j:=Form1.prPanel1.ControlCount;
      img:= TImage.Create(nil);
      img.Name := 'Sktch_'+IntToStr(j+1);
      img.Left := j*20;
      img.Top := j*20;
      img.Cursor:=crSizeAll;
      img.ShowHint:=true;
      img.Hint:=SketchFile;
      img.ParentShowHint:=false;
      img.Transparent:=true;
      img.HelpKeyword:=SketchFile;
      img.Picture.LoadFromFile(SketchFile);
      img.AntialiasingMode:=amOn;
      img.Parent:=Form1.prPanel1;

      SetSketchImgProperty(img);

      img.OnMouseWheelDown:= @Form1.MyMouseWheelDown;
      img.OnMouseWheelUp:= @Form1.MyMouseWheelUp;
      img.OnMouseDown := @Form1.MyMouseDown;
      img.OnMouseUp := @Form1.MyMouseUp;
      img.OnMouseMove := @Form1.MyMouseMove;
    end;
end;



procedure SaveBitmapToJPG(bmp: TBitmap; SaveFileName: string; quality:TJPEGQualityRange);
var
  JPG: TJPEGImage;
begin
  JPG := TJPEGImage.Create;
  JPG.Assign(bmp);
  JPG.CompressionQuality:=quality; //0-100
  JPG.SaveToFile(SaveFileName);
  JPG.Free;
end;

procedure GoToCropIMG(SrcImg,DstImg: TImage);
begin
  Form2.Position:=poMainFormCenter;
  Form2.Left:=Form1.Left;
  Form2.Top:=Form1.Top;
  DstImg.Picture.Clear;
  DstImg.Picture.Bitmap:=SrcImg.Picture.Bitmap;

  if (DstImg.Picture.Width>=Screen.Width) or (DstImg.Picture.Height>=Screen.Height) then
    begin
      DstImg.Stretch:=true;
      Form2.WindowState:=wsMaximized;

    end
  else
    begin
      DstImg.Stretch:=false;
      Form2.WindowState:=wsNormal;
      DstImg.Width:=DstImg.Picture.Width;
      DstImg.Height:=DstImg.Picture.Height;
      Form2.Width:=DstImg.Picture.Width;
      Form2.Height:=DstImg.Picture.Height;
    end;
end;

procedure SwapIfMinus(var c1,c2:integer);
var c:integer;
begin
  if c1>c2 then
    begin
      c:=c1;
      c1:=c2;
      c2:=c;
    end
  else
    begin

    end;
end;

function RectReSize(FakeRect:TRect; IndexResize: Real):TRect;
begin
  result.Left:=Round(FakeRect.Left*IndexResize);
  result.Top:=Round(FakeRect.Top*IndexResize);
  result.Right:=Round(FakeRect.Right*IndexResize);
  result.Bottom:=Round(FakeRect.Bottom*IndexResize);
end;

Procedure RotateBitmap90(Const Bitmap: TBitmap);
var
  tmp: TBitmap;
  src, dst: TLazIntfImage;
  ImgHandle, ImgMaskHandle: HBitmap;
  i, j, t, u, v: integer;
begin
  tmp:= TBitmap.create;
  tmp.Width:= Bitmap.Height;
  tmp.Height:= Bitmap.Width;
  dst:= TLazIntfImage.Create(0, 0);
  dst.LoadFromBitmap(tmp.Handle, tmp.MaskHandle);
  src:= TLazIntfImage.Create(0, 0);
  src.LoadFromBitmap(bitmap.Handle, bitmap.MaskHandle);
  u:= bitmap.width - 1;
  v:= bitmap.height - 1;
  for i:= 0 to u do
    begin
      t:= u - i;
      for j:= 0 to v do
        dst.Colors[j, t]:= src.Colors[i, j];
    end;
  dst.CreateBitmaps(ImgHandle, ImgMaskHandle, false);
  tmp.Handle:= ImgHandle;
  tmp.MaskHandle:= ImgMaskHandle;
  dst.Free;
  bitmap.Assign(tmp);
  tmp.Free;
  src.Free;
End;

Procedure RotateTImage(img: TImage);
var
  MemBMP: TMemoryStream;
  W,H: integer;
begin
  MemBMP := TMemoryStream.Create;
  try
    img.Picture.bitmap.SaveToStream(MemBMP);
    MemBMP.Position:= 0;
    W:= img.Height;
    H:= img.Width;
    img.Height:= H;
    img.Width:= W;
    img.Picture.bitmap.LoadFromStream(MemBMP);
    img.repaint;
  finally
    MemBMP.Free;
  end;
end;

function CutStringUpTo(str: string; n: integer): string;
begin
  if Form1.prCheckBoxCutPrName30.Checked=true then
    if Length(str)>n then
        UTF8Delete(str, n+1, UTF8Length(str)-n);
  result:=str
end;


function GetDateLastGhange(f: string): TDateTime;   ///  0 способ
begin
  result:=FileDateToDateTime(FileAge(UTF8toSys(f)));
end;


end.


{
function GetDateLastGhange(f: string): TDateTime;   ///  1 способ
var
  FileR: TSearchRec;
begin
  if findFirstUTF8(f, 1, FileR)=0 then
    begin
      result:=FileDateToDateTime(FileR.Time);
      FindCloseUTF8(FileR);
    end;
end;

function GetFileDate(TheFileName: string): string;    /// 2 способ
var
  FHandle: integer;
begin
  FHandle := FileOpen(UTF8toSys(TheFileName), 0);
  result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  FileClose(FHandle);
end;
}
