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
:: ���̃t�@�C���͕����R�[�h `SJIS` �ŕۑ����邱��
:: </CAUTION!>

::
:: ���̃o�b�`�t�@�C�����z�u���ꂽ�f�B���N�g���ɑ΂��� `dir` �R�}���h�����s���A  
:: ���ʂ��e�L�X�g�t�@�C���ɕۑ��A���̃t�@�C�����J��  

@ echo off

:: �R�[�h�y�[�W (�����R�[�h) �� `SJIS` �ɐݒ�
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/chcp
:: https://learn.microsoft.com/en-us/windows/win32/intl/code-page-identifiers
chcp 932 > nul
:: <NOTE>
::  - ���̃t�@�C���� `UTF-8` �ŕۑ����āA�t�@�C���`���� `chcp 65001` �����s���Ă���
::    `set STR_OUT_FILE_NAME=` �ɓ��{���ݒ肷��ƁA���s���G���[�ɂȂ��Ă��܂�
::  -  `> nul`
::    �o�͂�j��
::    https://learn.microsoft.com/ja-jp/troubleshoot/developer/visualstudio/cpp/language-compilers/redirecting-error-command-prompt
:: </NOTE>

:: <USER SETTING>
:: �o�̓t�@�C����
:: `=` �̒��ォ��s���܂ł��t�@�C�����Ƃ��ĔF�������
set STR_OUT_FILE_NAME=dir.txt
:: </USER SETTING>

chcp 65001 > nul

dir /b /s /on "%~dp0" > "%~dp0%STR_OUT_FILE_NAME%"
::dir %dp0 > dir.txt
:: <NOTE>  
:: `%~dp0` �Ƃ́A`%0` �ɃI�v�V�����\���� `~`�� `d` �� `p` ��t�^��������  
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/call  
::  - `%0`  
::     ���s����Ă���t�@�C���̃p�X  
::  - `~`  
::     `"` (�_�u���N�H�[�g) ������  
::  - `d`  
::     ���s����Ă���t�@�C���̃p�X  
::  - `p`  
::     ���s����Ă���t�@�C���̃p�X  

:: �o�̓t�@�C�����J��
:: https://learn.microsoft.com/ja-jp/windows-server/administration/windows-commands/start
start "" "%~dp0%STR_OUT_FILE_NAME%"
