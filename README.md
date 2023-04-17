# yorick-antilag

This script enables antilag and "twostep" functionality in your FiveM server. <br>
There is a file `config.lua` which you can use to add new cars to the config or to modify existing values!

# Configuration

In addition to enabling antilag, you can also configure the following options:

- explosionSpeed: The speed at which the explosion is created. Default value is 250. <br>
- Cars: This cars in this array have the possibility to use the functionality of the script. <br>
- flameSize: The size of the flames. Default is 1.5. <br>
- RPM: The amount of RPM needed until the antilag is triggered. <br>

# Commands 

- `/antilag` This is a command that makes it possible to turn off the functionality of the script for that client.

# Custom audio
- The script uses custom audio files that are played using NUI.

# Usage

To use antilag in your FiveM server, simply start the yorick-antilag resource, `ensure yorick-antilag`. By default, the antilag effect is triggered when the driver of the vehicle releases the W key when the car reaches a specific amount of RPM.
