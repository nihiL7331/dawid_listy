class RamMachine:
    def __init__(self):
        self.registers = {}
        self.accumulator = 0
        self.program = []
        self.labels = {}
        self.pc = 0

    def load(self, file):
        lines = []
        with open(file, "r") as f:
            for line in f:
                stripped = line.strip()
                if stripped and not stripped.startswith("#"):
                    lines.append(stripped)

        for i, line in enumerate(lines):
            if ":" in line:
                label, command = line.split(":", 1)
                self.labels[label.strip()] = i
                self.program.append(command.strip())
            else:
                self.program.append(line)

    def run(self):
        while self.pc < len(self.program):
            if not self.program[self.pc]:
                self.pc += 1
                continue

            part = self.program[self.pc].split()
            op = part[0].upper()
            arg = part[1] if len(part) > 1 else None

            if op == "LOAD":
                self.accumulator = self.registers.get(int(arg), 0)
            elif op == "STORE":
                self.registers[int(arg)] = self.accumulator
            elif op == "READ":
                val = input(f"podaj wartosc {self.pc})")
                self.accumulator = int(val)
            elif op == "ADD":
                self.accumulator += self.registers.get(int(arg), 0)
            elif op == "SUB":
                self.accumulator -= self.registers.get(int(arg), 0)
            elif op == "JUMP":
                self.pc = self.labels[arg]
                continue
            elif op == "JZERO":
                if self.accumulator == 0:
                    self.pc = self.labels[arg]
                    continue
            elif op == "LOG":
                print(f"pc: {self.pc} acc: {self.accumulator} reg: {self.registers}")
            elif op == "HALT":
                break

            self.pc += 1


if __name__ == "__main__":
    emu = RamMachine()
    try:
        emu.load("mnozenie.ram")
        emu.run()
    except FileNotFoundError:
        print("chuj")
