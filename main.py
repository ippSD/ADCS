from World import World
from PointLight import PointLight
from DirectionalLight import DirectionalLight
from Transform import Transform
from Sphere import Sphere
from Shape import Shape
from Appearance import Appearance
from Material import Material

if __name__ == "__main__":
    world = World()
    light = PointLight(name="Sun")
    direction = DirectionalLight(name="Beam")
    
    sp = Sphere(name="SP", radius=2e0)
    mat = Material()
    ap = Appearance()
    
    shape = Shape(appearance=ap, geometry=sp)
    
    transf = Transform(name="T", children=shape)
    
    world.add(light)
    world.add(direction)
    world.add(transf)
    
    print("Sphere:", "\n" + str(sp))
    print("Material:", "\n" + str(mat))
    print("Appearance:", "\n" + str(ap))
    print("Shape:", "\n" + str(shape))
    print("Transform:", "\n" + str(transf))
    
    with open("mytest.wrl", 'w') as f:
        f.write(str(world))
        pass
    pass
