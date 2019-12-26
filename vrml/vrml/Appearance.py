import numpy as np
from typing import List
from Material import Material

Vec = List[float]


class Appearance:
    def __init__(self,
                 name: str = "",
                 material: Material = Material()):
        self.name: str = name
        self.material: Material = material
    def __str__(self):
        template = "{0} Appearance {{\n\tmaterial\t{1}\n}}"
        mm = str(self.material)
        return template.format(
            "DEF " + self.name if self.name != "" else self.name,
            mm
        )
pass