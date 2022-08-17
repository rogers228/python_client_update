#singleinstance force ;限制單線

update_handle(){ ; 更新

    zipapp = C:\Program Files\7-Zip\7z.exe
    venv_zip = \\220.168.100.104\pdm\s_py_server\python_venv.7z ; 綠色環境壓縮檔
    client_python_dir = C:\python_venv ; 使用者安裝資料夾

    if FileExist(client_python_dir){
        ; Msgbox, 資料夾已存在
        FileRemoveDir, %client_python_dir%, 1 ;刪除資料夾及所有子目錄
    }

    MyCmd := zipapp . a_space . "x" . a_space . venv_zip . a_space . "-oC:\"
    ; MsgBox, %MyCmd%
    RunWait, %MyCmd% ;執行cmd  
}

main(){
    zipapp = C:\Program Files\7-Zip\7z.exe
    if !FileExist(zipapp){
        Msgbox, 16, Python系統更新, 您的系統缺少7z.exe, 請先安裝!
        Exit
    }

    MsgBox, % 32 + 4, Python系統更新, 您要進行更新嗎?
    IfMsgBox, Yes
    {
        update_handle()
        Msgbox, 64, Python系統更新, 更新完畢
    }
}

main()