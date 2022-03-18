@echo off
rem CSCを使ってC#をビルドするバッチファイル
rem 適宜書き換えて使用する。

echo === Begin process ===
rem .Net Frameworkのパス。必要に応じて変更する。
set DOTNETDIR=C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319

rem アプリを格納するディレクトリ
set AppDir=bin

rem 古いexe/dllを削除する。フォルダが存在しない場合は作成する。
if exist %AppDir% (
   del /q %AppDir%\*.exe
   del /q %AppDir%\*.dll
) else (
   mkdir %AppDir%
)
rem アプリの名前
set AppName=main.exe

rem コンパイルオプション
set Options=/out:%AppDir%\%AppName%
rem GUIならwinexe
set Options=%Options% /target:exe
set Options=%Options% /platform:x64
set Options=%Options% /warn:4
set Options=%Options% /highentropyva+

rem DLL参照(サードパーティーのライブラリとか)
rem set RefDlls=/target:hoge.dll
rem set RefDlls=/target:foo.dll

rem ビルドするC#ソース。
set CSFiles=*.cs
rem set CSFiles=%CSFiles% imageprocessing.cs

rem CSCのパラメータ
set CSCParam=%Options%
if defined RefDlls (
   set CSCParam=%CSCParam% %RefDlls%
)
set CSCParam=%CSCParam% %CSFiles%

rem echo %CSCParam%
%DOTNETDIR%\Csc.exe %CSCParam%

rem exeができた=ビルド成功
if exist %AppDir%\%AppName% (
   echo Success
   rem ビルド成功時にやりたい処理を書いておく。(exe、dllを別の場所にコピーするetc)
)

echo === End process ===
