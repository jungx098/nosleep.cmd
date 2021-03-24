0</* :{
    @echo off
    cscript.exe //Nologo //E:jscript %~f0 %* & exit
:} */0;

var shell    = WScript.CreateObject("WScript.Shell");

function print(str) {
    WScript.Stdout.WriteLine(str)
}

function wait(ms) {
    WScript.Sleep(ms);
}

function wakeup() {
    shell.SendKeys("{SCROLLLOCK}{SCROLLLOCK}");
}

function argcount() {
    return WScript.Arguments.Count();
}

function argvalue(idx) {
    return WScript.Arguments(0);
}

function version() {
    print("nosleep 1.0");
    print("Written by jungx098");
}

function help() {
    print("Usage: nosleep.cmd [DURATION]");
    print("   or: nosleep.cmd [OPTION]");
    print("no-sleep for optinal DURATION.")
    print("");
    print("DURATION specifies the timeout.");
    print("DURATION is integer type with an optinal suffix of:");
    print("     's' for seconds,")
    print("     'm' for minutes,")
    print("     'h' for hours, or")
    print("     'd' for days.")
    print("");
    print("The following options are available:")
    print("     --help, -h  display help and exit");
    print("     --version   display version and exit");
}

function main() {
    var timeend  = new Date(8640000000000000).getTime();
    var duration = "";
    var argc     = argcount();

    if (argc > 0) {
        var str  = argvalue(0);

        if (str == "-h" || str == "--help") {
            help();
            return;
        }

        if (str == "--version") {
            verson();
            return;
        }

        var suffix  = str.charAt(str.length - 1);
        var unit    = "sec";
        var mul     = 1;
        var timeout = 0;

        switch (suffix) {
            case 's':
                timeout = parseInt(str.substring(0, str.length - 1));
                break;

            case 'm':
                unit = "min";
                mul  = 60;
                timeout = parseInt(str.substring(0, str.length - 1));
                break;

            case 'h':
                unit = "hour";
                mul  = 60*60;
                timeout = parseInt(str.substring(0, str.length - 1));
                break;

            case 'd':
                unit = "day";
                mul  = 60*60*24;
                timeout = parseInt(str.substring(0, str.length - 1));
                break;

            default:
                timeout = parseInt(str);
                break;
        }

        if (isNaN(timeout)) {
            print("Unknown options: try '--help' for more information.");
            return;
        }
        else {
            timeend  = new Date().getTime() + timeout*1000*mul;
            duration = "for " + timeout + " " + unit + " ";
        }
    }

    print("No sleep " + duration + "(^C to exit)...");

    do {
        var timenow   = new Date().getTime();
        var diff      = timeend - timenow;
        var timesleep = Math.min(60000, Math.max(1000, diff/10));

        wakeup();
        wait(timesleep);
    } while (diff > 0)

    print("Timeout!");
}

main();
