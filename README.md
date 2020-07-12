#### purnehistory

Used to purne the history file
 - Remove the duplicate entires
 - Keeps the last entry when there is a duplicate (to maintain the order)

##### Supports:
 
- [x] bash_history
- [ ] zsh_history
- [ ] fish_history

##### Build in local

- Clone the repo
- Install nim compiler
- Compile the code like below and get the binary
```sh
$ nim compile prunehistory.nim
```
