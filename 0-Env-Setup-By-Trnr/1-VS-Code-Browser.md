# How to setup VS Code to run in Browser
- Refer: https://github.com/cdr/code-server
- We can now use the VSCode IDE using the browser only
- Follow below steps:
  - Login to linux terminal using your own user id/password
  - Now run below set of commands
```
curl -fsSL https://code-server.dev/install.sh | sh
export CODE_SERVER_PORT=<put a port number>
code-server --bind-addr 0.0.0.0:$CODE_SERVER_PORT --auth=none
```
 - Now open on browser:
  - http://<ip-addr>:$CODE_SERVER_PORT
- Open the folder on Code-Server in Browser
  - We can clone a GitHub repo and then open it in vs-code
  - Use any of the below options
    - Add folder
    - Clone Repository
    - Open Remote Repository
- We can now run the selected text in terminal in VSCode
  - Open the text file
  - Select the text to run in terminal
  - Press - Ctrl+Shift+P
  - Type command - run selected text in active terminal
  - Pressing Small wheel/setting icon
  - Add Key Binding -> Ctrl + Enter
  - Reload the browser
  - Now select the text and press Ctrl + Enter
  - Notice the select command is executed in the Terminal at bottom

### Multi user support
- For this each user need to install Code-Server and start using it using different Ports
