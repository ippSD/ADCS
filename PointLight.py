import numpy as np
from typing import List

Vec = List[float]


class PointLight:
    def __init__(self,
                 name: str = "",
                 ambientIntensity: float = 100.,
                 attenuation: Vec = [1., 0., 0.],
                 intensity: float = 1.,
                 location: Vec = [0., 0., -2e2],
                 on: bool = True,
                 radius: float = 1.):
        self.name: str = name
        self.ambientIntensity: float = ambientIntensity  # 100
        self.attenuation: Vec = attenuation  # 1 0 0
        self.intensity: float = intensity  # 1
        self.location: Vec = location  # 0 0 -200
        self.on: bool = on  # TRUE
        self.radius: float = radius  # 1
    def __str__(self):
        template = "DEF {0} PointLight {{\n\
\tambientIntensity\t{1}\n\
\tattenuation\t{2}\n\
\tintensity\t{3}\n\
\tlocation\t{4}\n\
\ton\t{5}\n\
\tradius\t{6}\n\
}}"
        return template.format(
            self.name,
            self.ambientIntensity,
            ' '.join([str(x) for x in self.attenuation]),
            self.intensity,
            ' '.join([ str(x) for x in self.location]),
            'TRUE' if self.on else 'FALSE',
            self.radius)
        
pass