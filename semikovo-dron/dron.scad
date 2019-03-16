$fn = 500;  // render quality

use <motors-arm.scad>;
use <body-plate.scad>;
use <legs.scad>;
use <other-parts.scad>;

////////////////////////////////////////////

// Motors arms
translate([0,-2.5,3]) {
    MotorsArm(center=true);
    translate([0,65,0]) {
        MotorsArm(center=true);   
    }
}

// Bottom body
translate([0,30,0]) {
    color("blue", 0.8) BodyPlateBottom(center=true);
}
translate([0,30,6]) {
    color("blue", 0.8) BodyPlateMiddle(center=true);
}

// Legs
translate([0,-2.5,-3]) {
    rotate([0,180,0]) {
        color("brown", 0.8) MotorsLeg();
    }
    translate([0,65,0]) {
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

// vrtule...
color("brown", 0.5) translate([32.5,-2.5,30]) {
    difference(){
        cylinder(2, 25.5, 25.5, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([-32.5,-2.5,30]) {
    difference(){
        cylinder(2, 25.5, 25.5, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([32.5,62.5,30]) {
    difference(){
        cylinder(2, 25.5, 25.5, true);
        cylinder(2*2, 1, 1, true);
    }
}
color("brown", 0.5) translate([-32.5,62.5,30]) {
    difference(){
        cylinder(2, 25.5, 25.5, true);
        cylinder(2*2, 1, 1, true);
    }
}
