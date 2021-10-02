use <MCAD/regular_shapes.scad>

difference () {
    cylinder($fn = 6, h = 30, r = 100);

    translate ([0,0,5]) {
        cylinder($fn = 6, h = 29, r = 95);
    }
} 

difference () {
    translate([0,0,5]) {
    cylinder($fn = 100, h = 20, r = 6);
    }
    
    cylinder($fn = 100, h = 30, r = 3.5);
}

