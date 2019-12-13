import vrml

if __name__ == "__main__":
    world = vrml.World()
    light = vrml.PointLight(name="Sun")
    direction = vrml.DirectionalLight(name="Beam")
    
    sp = vrml.Sphere(name="SP", radius=2e0)
    mat = vrml.Material()
    ap = vrml.Appearance()
    
    shape = vrml.Shape(appearance=ap, geometry=sp)
    
    transf = vrml.Transform(name="T", children=shape)
    
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
