import numpy as np
import random
import re

with open("worldtemplate.wrl", 'r') as f:
	content = f.read()
	pass

n_x = 100
n_z = 100
h_max = 0.1

heights = np.zeros((n_x, n_z))

for x in range(1, n_x - 1):
	for z in range(1, n_z - 1):
		heights[x, z] = random.random() * h_max
		pass
	pass

# print(list(heights.reshape(n_x * n_z)))

content = re.sub("{{nx}}", str(n_x), content)
content = re.sub("{{nz}}", str(n_z), content)
content = re.sub("{{heights}}", str(list(heights.reshape(n_x * n_z))), content)

with open("myworld.wrl", 'w') as f:
	f.write(content)
	pass

