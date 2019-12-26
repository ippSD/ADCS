class World:
    def __init__(self):
        self.elements = list()
        pass
    def add(self, elm):
        self.elements.append(elm)
    def __str__(self):
        text = "#VRML V2.0 utf8\n"
        for elm in self.elements:
            text = text + str(elm) + "\n"
            pass
        return text
    pass
