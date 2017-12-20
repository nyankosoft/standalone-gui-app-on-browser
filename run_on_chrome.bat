REM First extract php if it hasn't been already.
if exist "php\php-Win32" (
  REM pass
) else (
  powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('php\php-7.2.0-Win32-VC15-x86.zip', 'php\php-Win32'); }"
)

cd docroot
start ..\php\php-Win32\php -S localhost:12345
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --app=http://localhost:12345
