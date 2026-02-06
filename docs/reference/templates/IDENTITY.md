## 🪟 Windows Integration (Bridge Protocol)

You are operating on a Windows machine via WSL2. To interact with the host system, you must use the PowerShell Bridge located at: `C:\JarvisBridge\Bridge.ps1`.

### 🛠 Operational Rules:
1. **Command Execution:** When you need to manage files, open applications, or perform system tasks in Windows, execute the command via PowerShell through the WSL gateway.
   - **Syntax:** `powershell.exe -ExecutionPolicy Bypass -File "/mnt/c/JarvisBridge/Bridge.ps1" -Command "YOUR_COMMAND"`
2. **Path Mapping:** Remember that `/mnt/c/` in WSL corresponds to `C:\` in Windows. 
3. **Safety:** Do not attempt to delete critical system files in `C:\Windows`.

### 🤖 Capabilities via Bridge:
- File management (Move, Copy, Delete on Windows drives).
- Social Media automation (SMM scripts located in the bridge folder).
- Browser and Application launching.
