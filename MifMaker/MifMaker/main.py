# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def getAsciiValue(text):
    # Use a breakpoint in the code line below to debug your script.
    text_ascii = []
    for letter in text:
        ascii_value = ord(letter)
        text_ascii.append(ascii_value)
    return text_ascii

def creatMemoryList(lines):
    memmory = 0
    memmory_list = []
    for line in lines:
        for letter in line:
            memmory_list.append(str(memmory) + " : " + str(ord(letter)))
            #print(str(memmory) + " : " + str(ord(letter)))
            memmory = memmory + 1
        if memmory!=11065:
            memmory_list.append("[" + str(memmory) + "..11064]: 0;")

    createMifFile(memmory, memmory_list)

def readFile():
    with open('ejemplo.txt') as f:
        lines = f.readlines()
        creatMemoryList(lines)
        print("Hola")

def createMifFile(memmory, memmoryList):
    f = open("example.mif", "w+")
    f.write("WIDTH=8;" + "\n")
    f.write("DEPTH=11065;\n\n")
    f.write("ADDRESS_RADIX=UNS;" + "\n")
    f.write("DATA_RADIX=UNS;" + "\n\n")
    f.write("CONTENT BEGIN" + "\n")
    for value in memmoryList:
        f.write(value + ";\n")
    f.write("END;")
    f.close()

def printList(ascii_list):
    value = ""
    for number in ascii_list:
        value = value + str(number) + " "
    print(value)
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    #creatMemoryList(getAsciiValue("Lorem ipsum dolor sit amet"))
    #print("76 111 114 101 109 32 105 112 115 117 109 32 100 111 108 111 114 32 115 105 116 32 97 109 101 116 ")
    readFile()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
