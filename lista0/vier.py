class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if self.items:
            return self.items.pop()
        return None


def poprawne(napis):
    stos = Stack()
    pary = {")": "(", "]": "[", "}": "{"}

    for znak in napis:
        if znak in "([{":
            stos.push(znak)
        elif znak in ")]}":
            if stos.pop() != pary.get(znak):
                return False
    return not stos.items


print(poprawne("(([]){})"))
