# Check if a PDB file was provided as an argument
if {$argc != 1} {
    puts "Usage: vmd -e script.tcl -args pdbfile.pdb"
    exit
}

# Get the PDB filename from the command line argument
set pdb_file [lindex $argv 0]

# Load the PDB file
mol new $pdb_file

# Change background to white
color Display Background white

# Turn off axis arrows
axes location off

# Change representation to New Cartoon and apply secondary structure coloring
mol delrep 0 top
mol representation NewCartoon 0.300000 50.000000 4.100000 0


mol color Structure
mol selection all
mol material Opaque
mol addrep top

# Adjust colors to the specified hex values

color change rgb red 0.9843137 0.30980392 0.3098039 ;# 0xFB 0xC9 0x3D
color change rgb purple 0.9843137 0.30980392 0.3098039 ;# 0xFB 0xC9 0x3D

color change rgb blue 0.4235294 0.752941 0.8980392 ;

color change rgb yellow 0.984313 0.788235 0.23921568 ;


color Structure 3_10_Helix red
color Structure Pi_Helix red
color Structure Extended_Beta blue
color Structure Bridge_Beta blue
color Structure Turn yellow
color Structure Coil yellow


# Center the view on the molecule
molinfo top center

# Turn on orthographic display
display projection orthographic

# Turn on raytracing settings
# display shadows on
# display ambientocclusion on

# Set depth cueing density
display cuedensity 0.1

# Turn on light 2
# light 2 on

# Change material to chalky
# material change diffuse Opaque 1
# material change ambient Opaque 0.5
# material change specular Opaque 0.05
# material change shininess Opaque 0

# Increase resolution
# display resize 1000 1000

# Render the scene
display update