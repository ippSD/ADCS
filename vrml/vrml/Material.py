import numpy as np
from typing import List

Vec = List[float]


class Material:
    def __init__(self,
                 name: str = "",
                 ambientIntensity: float = 0.,
                 diffuseColor: Vec = [1, 1, 1],
                 shininess: float = 0.,
                 specularColor: list = [1, 1, 1],
                 transparency: float = 0.):
        self.name: str = name
        self.ambientIntensity: float = ambientIntensity
        self.diffuseColor: Vec = diffuseColor
        self.shininess: float = shininess
        self.specularColor: list = specularColor
        self.transparency: float = transparency
        pass
    def __str__(self):
        template = "{0} Material {{\n\
\tambientIntensity\t{1}\n\
\tdiffuseColor\t{2}\n\
\tshininess\t{3}\n\
\tspecularColor\t{4}\n\
\ttransparency\t{5}\n\
}}"
        return template.format(
            self.name,
            self.ambientIntensity,
            ' '.join([str(x) for x in self.diffuseColor]),
            self.shininess,
            ' '.join([str(x) for x in self.specularColor]),
            self.transparency)
        
pass