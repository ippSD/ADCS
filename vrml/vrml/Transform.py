import numpy as np
from typing import List

Vec = List[float]


class Transform:
    def __init__(self,
                 name: str = "",
                 translation: Vec = [0, 0, 0],
                 scale: Vec = [1, 1, 1],
                 rotation: Vec = [0, 0, 1, 0],
                 children: list = list()):
        self.name: str = name
        self.translation: Vec = translation
        self.scale: Vec = scale
        self.rotation: Vec = rotation
        if isinstance(children, list):
            self.children: list = children
        else:
            self.children: list = [children]
        pass
    def __str__(self):
        template = "{0} Transform {{\n\
\ttranslation\t{1}\n\
\tscale\t{2}\n\
\trotation\t{3}\n\
\tchildren\t{4}\n\
}}"
        return template.format(
            "DEF " + self.name if self.name != "" else self.name,
            ' '.join([str(x) for x in self.translation]),
            ' '.join([str(x) for x in self.scale]),
            ' '.join([str(x) for x in self.rotation]),
            '[\n' + '\n'.join([str(x) for x in self.children]) + '\n]'
            )
        
pass