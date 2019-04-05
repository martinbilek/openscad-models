include <config.scad>;

use <motors-arm.scad>;
use <body-plate.scad>;
use <legs.scad>;
use <armor.scad>;
use <other-parts.scad>;

// Variables

motors_distance = cfg_motors_distance;
propellers_radius = 25.5;

const0 = 60;
const1 = (motors_distance - const0) / 2;

////////////////////////////////////////////

// Motors arms
translate([0,-const1,3]) {
    MotorsArm(center=true);
    translate([0,motors_distance,0]) {
        MotorsArm(center=true);   
    }
}

translate([0,-5,8.5]) {
    color("white", 0.8) Armor();
}

// Bottom body
translate([0,30,0]) {
    color("blue", 0.8) BodyPlateBottom(center=true);
}
translate([0,30,6]) {
    color("blue", 0.8) BodyPlateMiddle(center=true);
}

// Legs
translate([0,-const1,-3]) {
    rotate([0,180,0]) {
        color("brown", 0.8) MotorsLeg();
    }
    translate([0,motors_distance,0]) {
        rotate([0,180,0]) {
            color("brown", 0.8) MotorsLeg();
        }
    }
}

// Circuits
color("green", 0.5) translate([0,30,17]) {
    CircuitCPU();
    translate([0,0,-6.5]) {
        CircuitCPU();
    }
    rotate([0,0,90]) {
        translate([50,70,11.5]) {
            CircuitReceiver();
        }
    }
}

// Spacers
color("red", 1) translate([0,20,7.5]) {
    
    // under circuits
    translate([-10,0,0]) {
        RoundSpacer(3, 3, 2);
    }
    translate([10,0,0]) {
        RoundSpacer(3, 3, 2);
    }
    translate([-10,20,0]) {
        RoundSpacer(3, 3, 2);
    }
    translate([10,20,0]) {
        RoundSpacer(3, 3, 2);
    }

    // between circuits
    translate([0,0,4]) {
        translate([-10,0,0]) {
            RoundSpacer(5.5, 3, 2);
        }
        translate([10,0,0]) {
            RoundSpacer(5.5, 3, 2);
        }
        translate([-10,20,0]) {
            RoundSpacer(5.5, 3, 2);
        }
        translate([10,20,0]) {
            RoundSpacer(5.5, 3, 2);
        }
    }

    // on top of circuits
    translate([0,0,10.5]) {
        translate([-10,0,0]) {
            RoundSpacer(1, 3, 2);
        }
        translate([10,0,0]) {
            RoundSpacer(1, 3, 2);
        }
        translate([-10,20,0]) {
            RoundSpacer(1, 3, 2);
        }
        translate([10,20,0]) {
            RoundSpacer(1, 3, 2);
        }
    }
}

// Propellers...
color("brown", 0.5) translate([motors_distance/2,-const1,const0/2]) {
    difference(){
        cylinder(2, propellers_radius, propellers_radius, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([-motors_distance/2,-const1,const0/2]) {
    difference(){
        cylinder(2, propellers_radius, propellers_radius, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([motors_distance/2,motors_distance-const1,const0/2]) {
    difference(){
        cylinder(2, propellers_radius, propellers_radius, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([-motors_distance/2,motors_distance-const1,const0/2]) {
    difference(){
        cylinder(2, propellers_radius, propellers_radius, true);
        cylinder(2*2, 1, 1, true);
    }
}
