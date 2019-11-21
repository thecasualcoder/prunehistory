import os, strformat, strutils, tables

proc pruneHistory() =
    let home = getEnv("HOME", "")
    var entireFile = readFile(&"{home}/.bash_history")
    entireFile.stripLineEnd
    let lines = splitLines(entireFile)

    var historyMap = initTable[string, bool]()
    let count = len(lines)
    var result = newSeq[string]()
    for i in countup(1, count):
      let command = lines[count - i]
      if not historyMap.hasKey(command):
        historyMap[command] = true
        result.add(command)
    let f = open(&"{home}/.bash_history.pruned", fmWrite)
    defer: f.close()

    let resultCount = len(result)
    for i in countup(1, resultCount):
      f.writeLine(result[resultCount - i ])

pruneHistory()
