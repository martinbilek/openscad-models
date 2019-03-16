$fn = 100;  // render quality

// Variables

length = 45;
width = 8;
height = 1.5;

body_screw_hole_radius = 1.0+0.1;  //screw M2
body_screw_holes_space = 12;

leg_width = 30;

// MODULES

module MotorsLeg(){
    difference() {
        cube([length,width,height], true);
        translate([body_screw_holes_space/4,0,0]) {
            cylinder(height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        }
        translate([-body_screw_holes_space/4,0,0]) {
            cylinder(height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        }
    }
    translate([0,0,leg_width-height]) {
        cube([length,width,height], true);
    }
    translate([length/2,0,leg_width/2-height/2]) {
        cube([height,width,leg_width], true);
    }
    translate([-length/2,0,leg_width/2-height/2]) {
        cube([height,width,leg_width], true);
    }
}

MotorsLeg();
