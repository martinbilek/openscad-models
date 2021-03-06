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

stiffed = true;
stiff_size1 = 1.5;
stiff_size2 = 12.8;

// MODULES

module MotorPlate(){
    cylinder(motor_plate_height, motor_plate_radius, motor_plate_radius, true);
}

module HolesForMotor(){
    union() {
        translate([0,0,motor_plate_height/2]) {
            cylinder(motor_plate_height, motor_axis_hole, motor_axis_hole, true);
        };
        cylinder(motor_plate_height*2, motor_screw_hole, motor_screw_hole, true);
    }
    union() {
        translate([3,3,0]) {
            cylinder(motor_plate_height*2, motor_screw_hole, motor_screw_hole, true);
        }
        translate([-3,3,0]) {
            cylinder(motor_plate_height*2, motor_screw_hole, motor_screw_hole, true);
        }
        translate([-3,-3,0]) {
            cylinder(motor_plate_height*2, motor_screw_hole, motor_screw_hole, true);
        }
        translate([3,-3,0]) {
            cylinder(motor_plate_height*2, motor_screw_hole, motor_screw_hole, true);
        }
    }
}

module Stiff(){
    translate([0,arm_width/2-stiff_size1/2,motor_plate_height]) {
        difference(){
            cube([(motors_centers_distance-motor_plate_radius*2),stiff_size1,arm_height], true);
            cube([stiff_size2,stiff_size1*2,arm_height*2], true);
        }
    }
}

module HolesForBody(){
    union() {
        translate([-(motors_centers_distance/2)-body_screw_holes_space/4,0,0]) {
            cylinder(motor_plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        };
        translate([-(motors_centers_distance/2)+body_screw_holes_space/4,0,0]) {
            cylinder(motor_plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        };
    }
}


module MotorsArm(center=false){
    x = center==false ? motors_centers_distance+motor_plate_radius : (motors_centers_distance)/2;
    y = center==false ? motor_plate_radius : 0;
    z = 0;

    translate([x,y,z]) {
        difference() {
            union() {
                translate([-motors_centers_distance/2,0,0]) {
                    cube([motors_centers_distance,arm_width,arm_height], true);
                }
                translate([-motors_centers_distance,0,0]) {
                    MotorPlate();
                }

                MotorPlate();
            }
            translate([-motors_centers_distance,0,0]) {
                HolesForMotor();
            }
            HolesForMotor();
            HolesForBody();
        }
    }
    if (stiffed){
        Stiff();
        translate([0,-arm_width+stiff_size1,0]) {
            Stiff();
        }
    }
}

MotorsArm(true);
