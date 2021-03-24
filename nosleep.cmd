0</* :{
    @echo off
    cscript.exe //Nologo //E:jscript %~f0 %* & exit
:} */0;

var shell    = WScript.CreateObject("WScript.Shell");
var timeend  = new Date(8640000000000000).getTime();
var duration = "";
var argc     = WScript.Arguments.Count();

if (argc > 0) {
    var timeout = parseInt(WScript.Arguments(0));
    if (!isNaN(timeout)) {
        timeend  = new Date().getTime() + timeout*1000;
        duration = "for " + timeout + " sec ";
    }
}

WScript.Stdout.WriteLine("No sleep " + duration + "(^C to exit)...");

do {
    var timenow   = new Date().getTime();
    var diff      = timeend - timenow;
    var timesleep = Math.min(60000, Math.max(1000, diff/10));

    shell.SendKeys("{SCROLLLOCK}{SCROLLLOCK}");
    WScript.Sleep(timesleep);
} while (diff > 0)

WScript.Stdout.WriteLine("Timeout!");
