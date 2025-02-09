; 宣告變數
zip_file_full_path := ""
install_folder := ""
install_path := ""

if true{ ; 讀取 ini 檔案內容
    scriptDir := A_ScriptDir
    iniFile := scriptDir . "\proginfo.ini"
    if FileExist(iniFile) {
        IniRead, zip_file_full_path, %iniFile%, install, zip_file_full_path
        IniRead, install_folder, %iniFile%, install, install_folder_name
        IniRead, install_path, %iniFile%, install, install_path
    } else {
        MsgBox, 48, 錯誤, 找不到 proginfo.ini 檔案於路徑：`n%iniFile%
        ExitApp
    }
    ; 測試輸出讀取的值
    MsgBox, 64, 成功, 以下是讀取的變數值：`n
            zip_file_full_path: "%zip_file_full_path%"`n
            install_folder: "%install_folder%"`n
            install_path: "%install_path%
}



find_7zip() { ; 定義 find_7zip 函式
    path1 := "C:\Program Files\7-Zip\7z.exe"
    path2 := "C:\Program Files (x86)\7-Zip\7z.exe"
    
    if FileExist(path1)
        Return path1
    else if FileExist(path2)
        Return path2
    else
        Return ""  ; 找不到則回傳空字串
}

main() {
    zip_app := find_7zip()  ; 呼叫 find_7zip 函式
    if (zip_app == ""){
        MsgBox, 48, 錯誤, 找不到 7-Zip 的執行檔，請先安裝！
        Exit
    }

    MsgBox, 64, 成功, 7-Zip 路徑為：`n%zip_app%






}

; 執行主程式
main()
