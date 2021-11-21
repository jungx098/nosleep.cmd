0</* :{
    @echo off
    cscript.exe //Nologo //E:jscript %~f0 %* & exit
:} */0;

var shell = WScript.CreateObject("WScript.Shell");

function wakeup() {
    shell.SendKeys("{SCROLLLOCK}{SCROLLLOCK}");
}

function main() {
    wakeup();
}

main();
