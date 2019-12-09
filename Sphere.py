import numpy as np
from typing import List

Vec = List[float]


class Sphere:
    def __init__(self,
                 name: str = "",
                 radius: float = 1e0):
        self.name: str = name
        self.radius: float = radius
    def __str__(self):
        template = "{0} Sphere {{\n\
\tradius\t{1}\n\
}}"
        return template.format(
            "DEF " + self.name if self.name != "" else self.name,
            str(self.radius))
        
pass