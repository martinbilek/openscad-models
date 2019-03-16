$fn = 100;  // render quality

// Variables

body_screw_hole_radius = 1.0+0.1;  //screw M2
body_screw_holes_space = 12;
motors_distance = 85;

plate_height = 2;
plate_width = 25;
plate_length = motors_distance + 20;

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
    translate([-shape_cutout_radius,-plate_length,-plate_height]){
        cube([shape_cutout_radius,plate_length,plate_height*2]);
    }
    translate([-plate_width*2-12.5,0,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
        translate([0,-plate_length,-plate_height]){
            cube([shape_cutout_radius,plate_length,plate_height*2]);
        }
    }
    translate([-plate_width*2-12.5,64,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
        translate([0,0,-plate_height]){
            cube([shape_cutout_radius,plate_length,plate_height*2]);
        }
    }
    translate([0,64,0]){
        cylinder(plate_height*2, shape_cutout_radius, shape_cutout_radius, true);
        translate([-shape_cutout_radius,0,-plate_height]){
            cube([shape_cutout_radius,plate_length,plate_height*2]);
        }
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
        translate([0,-20,0]){
            cube([4,2,plate_height*2], center);
        }
        translate([0,20,0]){
            cube([4,2,plate_height*2], center);
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
