import sys       

# sys.ps1="\001\033[1;37m\002{}\001\033[0m\002 "                                   
# sys.ps1="\001\033[1;33m\002{py}\001\033[0m\002 "

class LeswellPythonPromptPS1(object):
  bracket_color = "37m"
  logo = "93m"

  def __init__(self):
    self.line = 0
    self.clean = self.pc("0m")

  def __str__(self):
    self.line += 1
    python_logo = f"{self.clean}{self.pc(self.logo)}{self.clean}"
    return f"\n{self.pc(self.bracket_color)} {{ {python_logo}{self.pc(self.bracket_color)}{self.line} }} {self.clean} "

  def pc(self, color):
    """Pack color, with invisible character counting inplace"""
    return f"\001\033[1;{color}\002"

sys.ps1 = LeswellPythonPromptPS1()
sys.ps2 = "  \033[91m...\033[0m\t"
