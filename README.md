# TestNervesCustomRpi0Opencv

## set Target
First you have to build your own custom-firmware and change via buildroot your libs and add opencv3 support.
How does this works you can figure out here:
https://hexdocs.pm/nerves/systems.html#creating-or-modifying-a-nerves-system-with-buildroot
Or you can use my prebuild, that is working with this example:
```
 git clone https://github.com/guidoholz/nerves_custom_rpi0_opencv.git
```
after checkout out this project
```
 git clone https://github.com/guidoholz/test_nerves_custom_rpi0_opencv.git
```
```bash
cd test_nerves_custom_rpi0_opencv
export MIX_TARGET=nerves_custom_rpi0_opencv
mix deps.get
mix firmware
mix firmare.burn
```
###3 Steps you have to follow
#### Step 1
add [elixir_make](https://github.com/elixir-lang/elixir_make) to your project
#### Step 2
```bash
mkdir src priv
```
in your src dir you put all your .cpp and .hpp files (or .c and .h)
The executable HAS TO create into priv-dir!!!
#### Step 3
Create a Makefile in your project-root
SMALL HELP: add the following line to your Makefile
```
all:
  $(echo) $(export)
```
to see all Variables existing during crosscompiling.

Buildroot has few directories that are used during crossompiling and creating the firmware. To find your right lib and include dirs for your Makefile, look out for the "staging" directory
e.g. *nerves_custom_rpi0_opencv/.nerves/artifacts/nerves_custom_rpi0_opencv-0.18.3-dev.armv6_rpi_linux_gnueabi/staging*

### Test it
start your pi0 and add the following command to your IEx-shell
```elixir
System.cmd("find", ["/", "-name", "opencvtest"])
```
which returns something like
```
{"/srv/erlang/lib/test_nerves_custom_rpi0_opencv-0.1.0/priv/opencvtest\n", 0}
```
copy the link to your executable
```elixir
System.cmd("/srv/erlang/lib/test_nerves_custom_rpi0_opencv-0.1.0/priv/opencvtest",["-v"])
```
that shows you
```
{"is working\n", 0}
```

voila!
have fun!


## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
