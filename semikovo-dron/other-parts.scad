$fn = 100;  // render quality

// Variables

plate_height = 3;
plate_width = 30;
plate_length = 100;

body_screw_hole_radius = 1.0+0.1;  //screw M2
body_screw_holes_space = 20;
motors_distance = 80;

cpu_screw_hole_radius = 1.0+0.1;  //screw M2
cpu_screw_hole_space = 20;

// MODULES

module RoundSpacer(height=3, outside_radius=4, inside_radius=2){
    translate([0,0,height/2]) {
        difference() {
            cylinder(height, outside_radius/2, outside_radius/2, true);
            cylinder(height*2, inside_radius/2, inside_radius/2, true);
        }
    }
}

module CircuitCPU(){
    translate([0,0,0.5]) {
        difference() {
            cube([25,25,1], true);
            translate([-10,10,0]) {
                cylinder(5, 2, 1, true);
            }
            translate([-10,-10,0]) {
                cylinder(5, 2, 1, true);
            }
            translate([10,10,0]) {
                cylinder(5, 2, 1, true);
            }
            translate([10,-10,0]) {
                cylinder(5, 2, 1, true);
            }
        }
    }
}

module CircuitCPU(){
    translate([0,0,0.5]) {
        difference() {
            cube([25,25,1], true);
            translate([-10,10,0]) {
                cylinder(5, 1, 1, true);
            }
            translate([-10,-10,0]) {
                cylinder(5, 1, 1, true);
            }
            translate([10,10,0]) {
                cylinder(5, 1, 1, true);
            }
            translate([10,-10,0]) {
                cylinder(5, 1, 1, true);
            }
        }
    }
}

module CircuitReceiver(){
    translate([0,0,0.5]) {
        difference() {
            cube([36,22,7.5], true);
            translate([-15,8,0]) {
                cylinder(10, 1, 1, true);
            }
            translate([15,8,0]) {
                cylinder(10, 1, 1, true);
            }
        }
    }
}

//CircuitReceiver();

translate([0,60,0]) {
    //CircuitCPU();
}

translate([40,0,0]) {
    //RoundSpacer();
}

RoundSpacer(1, 3, 2);
