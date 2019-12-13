import numpy as np
from typing import List
from Appearance import Appearance
from Sphere import Sphere

Vec = List[float]


class Shape:
    def __init__(self,
                 name: str = "",
                 appearance: Appearance = Appearance(),
                 geometry: Sphere = Sphere()):
        self.name: str = name
        self.appearance: Appearance = appearance
        self.geometry: Sphere = geometry
    def __str__(self):
        template = "{0} Shape {{\n\
\tappearance\t{1}\n\
\tgeometry\t{2}\n\
}}"
        return template.format(
            "DEF " + self.name if self.name != "" else self.name,
            str(self.appearance),
            str(self.geometry)
        )
pass