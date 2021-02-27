0</* :{
    @echo off
    cscript.exe //Nologo //E:jscript %~f0 %* & exit
:} */0;

WScript.Stdout.WriteLine("No sleep (^C to exit)...");

var shell = WScript.CreateObject("WScript.Shell");
while (true) {
    shell.SendKeys("{SCROLLLOCK}{SCROLLLOCK}");
    WScript.Sleep(60000);
}
