$fn = 100;  // render quality

// Variables

plate_height = 3;
plate_width = 25;
plate_length = 80;

body_screw_hole_radius = 1.0+0.1;  //screw M2
body_screw_holes_space = 12;
motors_distance = 65;

cpu_screw_hole_radius = 1.0+0.1;  //screw M2
cpu_screw_hole_space = 20;

shape_cutout_radius = 25;

// MODULES

module HolesForCPU(){
    union() {
        translate([-cpu_screw_hole_space/2,-cpu_screw_hole_space/2,0]){
            cylinder(plate_height*2, cpu_screw_hole_radius, cpu_screw_hole_radius, true);
        };
        translate([cpu_screw_hole_space/2,-cpu_screw_hole_space/2,0]){
            cylinder(plate_height*2, cpu_screw_hole_radius, cpu_screw_hole_radius, true);
        };
        translate([cpu_screw_hole_space/2,cpu_screw_hole_space/2,0]){
            cylinder(plate_height*2, cpu_screw_hole_radius, cpu_screw_hole_radius, true);
        };
        translate([-cpu_screw_hole_space/2,cpu_screw_hole_space/2,0]){
            cylinder(plate_height*2, cpu_screw_hole_radius, cpu_screw_hole_radius, true);
        };
    }
}

module HolesForBody(){
    union() {
        //translate([-(body_screw_holes_space/2),-body_screw_hole_radius,0]){
        //    cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        //};
        //translate([-(body_screw_holes_space/4),body_screw_hole_radius,0]){
        //    cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        //};
        //translate([body_screw_holes_space/2,-body_screw_hole_radius,0]){
        //    cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        //};
        //translate([body_screw_holes_space/4,body_screw_hole_radius,0]){
        //    cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        //};

        translate([-(body_screw_holes_space/4),0,0]){
            cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        };
        translate([body_screw_holes_space/4,0,0]){
            cylinder(plate_height*2, body_screw_hole_radius, body_screw_hole_radius, true);
        };
    }
}

module ShapeCutout(){
    cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
    translate([-plate_width*2-12.5,0,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
    }
    translate([-plate_width*2-12.5,64,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
    }
    translate([0,64,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
    }
}

module BodyPlateBottom(center=false){
    difference(){
        difference() {
            cube([plate_width,plate_length,plate_height], center);
            translate([0,motors_distance/2,0]){
                HolesForBody();
            }
            translate([0,-(motors_distance/2),0]){
                HolesForBody();
            }
        }
        translate([plate_width+shape_cutout_radius/4,-32,0]){
            ShapeCutout();
        }
    }
}

module BodyPlateMiddle(center=false){
    difference() {
        BodyPlateBottom(true);
        HolesForCPU();
    }
}

BodyPlateBottom(true);
translate([plate_width+10,0,0]){
    BodyPlateMiddle(true);
}