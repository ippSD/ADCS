import numpy as np
from typing import List

Vec = List[float]


class DirectionalLight:
    def __init__(self,
                 name: str = "",
                 ambientIntensity: float = 100.,
                 direction: Vec = [1., 0., 0.],
                 intensity: float = 1.,
                 on: bool = True):
        self.name: str = name
        self.ambientIntensity: float = ambientIntensity  # 100
        self.direction: Vec = direction  # 1 0 0
        self.intensity: float = intensity  # 1
        self.on: bool = on  # TRUE
    def __str__(self):
        template = "DEF {0} DirectionalLight {{\n\
\tambientIntensity\t{1}\n\
\tdirection\t{2}\n\
\tintensity\t{3}\n\
\ton\t{4}\n\
}}"
        return template.format(
            self.name,
            self.ambientIntensity,
            ' '.join([str(x) for x in self.direction]),
            self.intensity,
            'TRUE' if self.on else 'FALSE')
        
pass