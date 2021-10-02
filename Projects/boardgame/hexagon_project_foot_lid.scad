difference () {

cylinder($fn = 6, h = 10, r = 100);

difference () {
    cylinder($fn = 6, h = 6, r = 100);
    
    cylinder($fn = 6, h = 7, r = 95);
}

cylinder($fn = 100, h = 12, r = 3);

translate([40,0,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}

translate([-40,0,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}

translate([-60,20,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}
translate([-60,-20,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}
translate([60,-20,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}
translate([60,20,1]) {
    cylinder($fn = 100, h = 12, r = 3);
}
}