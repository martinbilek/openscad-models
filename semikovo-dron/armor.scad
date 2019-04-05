include <config.scad>;

// Variables

motor_plate_radius = 7.5;
motor_plate_height = 2.5;
motor_screw_hole = 1.2;
motor_axis_hole = 2.4;

arm_width = 8;
arm_height = motor_plate_height;

motors_centers_distance = cfg_motors_distance;

body_screw_hole_radius = 1.0+0.1;  //screw M2
body_screw_holes_space = 12;

armor_size1 = 15;
armor_size2 = 12.6;
armor_size3 = cfg_motors_distance;

// MODULES

module MountingPart(){
    difference() {
        cube([armor_size2,arm_width,motor_plate_height], true);
        BodyMountHoles();
    }
}

module TopPart(){
    _width = armor_size3 + arm_width;
    cube([armor_size2,_width,motor_plate_height], true);
}

module SidesPart(){
    cube([armor_size2,motor_plate_height,armor_size1+motor_plate_height], true);
}

module BodyMountHoles(){
    translate([body_screw_holes_space/4,0,0]) {
        cylinder(motor_plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
    };
    translate([-body_screw_holes_space/4,0,0]) {
        cylinder(motor_plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
    };
}

module Armor(){
    union() {
        translate([0,armor_size3/2,armor_size1]) {
            color("brown", 0.8) TopPart();
        }

        color("green", 0.8) MountingPart();
        translate([0,armor_size3,0]) {
            color("green", 0.8) MountingPart();
        }

        color("pink", 0.8) translate([0,-arm_width/2-arm_height/2,((armor_size1+motor_plate_height)/2)-arm_height/2]) {
            SidesPart();
            translate([0,armor_size3+arm_width+arm_height,0]) {
                SidesPart();
            }
        }
    }
}

Armor();
