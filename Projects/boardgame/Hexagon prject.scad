rotate(0,180,0) {
difference() {
        cylinder($fn=6, h=5, r=37);
        translate([0,0,2]) {
            cylinder($fn=6, h=3, r=33);
        }
        translate([0,0,1]){
            cylinder(h=3, r=20);

    }
}
}

difference() {
    
    cylinder($fn=6, h=5, r2=37.4375, r1=37);cylinder($fn=6, h=40, r=37);
    
    
}
