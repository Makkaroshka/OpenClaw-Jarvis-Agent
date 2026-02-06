## 🛠 Windows System Tools (via Bridge)

### execute_windows_command
Use this tool to interact with the Windows host machine. All commands are routed through the PowerShell Bridge.

**Parameters:**
- `command`: The specific action to perform (e.g., "open notepad", "list files in Documents", "run smm_post_script").

**Usage Example (Internal Logic):**
When the user asks to "Open Chrome", the agent should construct the following:
`powershell.exe -ExecutionPolicy Bypass -File "/mnt/c/JarvisBridge/Bridge.ps1" -Command "start chrome"`

---

### 📂 File Management (Host)
- **Tool:** `manage_windows_files`
- **Description:** Access, move, or delete files on C:/ drive.
- **Path Mapping:** Always translate WSL paths (e.g., `/mnt/c/Users/`) to Windows paths (`C:\Users\`) before sending to Bridge.
