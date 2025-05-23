// Famicom Disk Cutting Jig (2.8" disk)
// All dimensions in millimeters

disk_diameter = 71;
hub_hole_diameter = 11;
jig_thickness = 2;
jig_border = 10;
alignment_hole_diameter = 3;
alignment_hole_offset = 40;
$fn = 100; // smoothness of round shapes

// Upper half (presses down, with holes for pegs)
module upper_jig() {
    difference() {
        cube([disk_diameter + 2 * jig_border, disk_diameter + 2 * jig_border, jig_thickness], center=true);

        // Optional shallow recess to prevent slipping
        translate([0, 0, 0])
        cylinder(h = jig_thickness + 1, r = 7, center=true);
     
        // Alignment peg holes
        for (angle = [0, 90, 180, 270]) {
            translate([alignment_hole_offset * cos(angle), alignment_hole_offset * sin(angle), 0])
                cylinder(h = jig_thickness + 1, d = alignment_hole_diameter, center=true);
        }
    }
    
        
}

translate([0, 0, jig_thickness + 1]) upper_jig();
