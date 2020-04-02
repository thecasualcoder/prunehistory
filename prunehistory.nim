import os, strformat, strutils, tables

proc pruneHistory() =
    let home = getEnv("HOME", "")
    var entireFile = readFile(&"{home}/.bash_history")
    entireFile.stripLineEnd
    let lines = splitLines(entireFile)

    var historyMap = initTable[string, bool]()
    let count = len(lines)
    writeLine(stderr, &"Number of lines before optimizing: {count}")
    var result = newSeq[string]()
    for i in countup(1, count):
      let command = lines[count - i]
      if not historyMap.hasKey(command):
        historyMap[command] = true
        result.add(command)
    copyFile(&"{home}/.bash_history", &"{home}/.bash_history.bak")
    removeFile(&"{home}/.bash_history")
    let f = open(&"{home}/.bash_history", fmWrite)
    defer: f.close()

    let resultCount = len(result)
    writeLine(stderr, &"Number of lines after optimizing: {resultCount}")
    for i in countup(1, resultCount):
      f.writeLine(result[resultCount - i ])

pruneHistory()
