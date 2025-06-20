# OpenRHI Premake5 Template

A template project to quickly get started with [OpenRHI](https://github.com/adriengivry/orhi), using [premake5](https://premake.github.io) as the build system.

**Includes:**
- [glfw](https://github.com/glfw/glfw)
- [glm](https://github.com/g-truc/glm)
- [orhi](https://github.com/adriengivry/orhi)

## Getting Started
1. Download and install [premake5](https://premake.github.io/download/)
2. Create a new repository based on this template
3. Clone your repository, including submodules
```powershell
git clone --recurse-submodules git://github.com/{username}/{projectname}.git
```
4. Edit the following lines in `premake5.lua`:
```lua
workspace "my-solution" -- Replace with your solution name
startproject "my-project" -- Replace with your project name
project "my-project" -- Replace with your project name
```
5. Generate projects:
```powershell
premake5 vs2022 --compile-opengl --gfxapi=opengl
```
6. You're all set! Enjoy!
