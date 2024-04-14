import os

# os.makedirs("dir")

# os.system("mkdir dir")
name = "i2c"
agent_dir = name + "_agent"
mkcmd = "mkdir " + os.getcwd() + "\\" + agent_dir
print(mkcmd)
# print(os.getcwd().replace("/", "\\"))
os.system(mkcmd)
