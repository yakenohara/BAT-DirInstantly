::<License>------------------------------------------------------------
::
:: Copyright (c) 2023 Shinnosuke Yakenohara
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::
::-----------------------------------------------------------</License>

:: <CAUTION!>
:: このファイルは文字コード `SJIS` で保存すること
:: </CAUTION!>

::
:: このバッチファイルが配置されたディレクトリに対して `dir` コマンドを実行し、  
:: 結果をテキストファイルに保存、そのファイルを開く  

@ echo off

:: コードページ (文字コード) を `SJIS` に設定
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/chcp
:: https://learn.microsoft.com/en-us/windows/win32/intl/code-page-identifiers
chcp 932 > nul
:: <NOTE>
::  - このファイルを `UTF-8` で保存して、ファイル冒頭で `chcp 65001` を実行してから
::    `set STR_OUT_FILE_NAME=` に日本語を設定すると、実行時エラーになってしまう
::  -  `> nul`
::    出力を破棄
::    https://learn.microsoft.com/ja-jp/troubleshoot/developer/visualstudio/cpp/language-compilers/redirecting-error-command-prompt
:: </NOTE>

:: <USER SETTING>
:: 出力ファイル名
:: `=` の直後から行末までがファイル名として認識される
set STR_OUT_FILE_NAME=dir.txt
:: </USER SETTING>

chcp 65001 > nul

dir /b /s /on "%~dp0" > "%~dp0%STR_OUT_FILE_NAME%"
::dir %dp0 > dir.txt
:: <NOTE>  
:: `%~dp0` とは、`%0` にオプション構文の `~`と `d` と `p` を付与したもの  
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/call  
::  - `%0`  
::     実行されているファイルのパス  
::  - `~`  
::     `"` (ダブルクォート) を除く  
::  - `d`  
::     実行されているファイルのパス  
::  - `p`  
::     実行されているファイルのパス  

:: 出力ファイルを開く
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/start
start "" "%~dp0%STR_OUT_FILE_NAME%"
