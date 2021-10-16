/*Terraforming mars board bottom foot script
Creating hexagon tiles for terraforming
mars board 

Author: Blueguard
Credit: All developors of MCAD/regular_shapes
        roipoussiere for TOUL
        Developer of rail_test
        
        

*/

use <MCAD/regular_shapes.scad>;
use <rail_test.scad>;
use <TOUL.scad>;

sides = [1,1,1,1,1,1];
text_cont = "Terraforming Mars";
font = "monospace";
module vslot_cover(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
   }

module create_hexagon_foot(side_list, text_cont_var, font1) {
difference () {
    cylinder($fn = 6, h = 30, r = 100);

    translate ([0,0,5]) {
        cylinder($fn = 6, h = 29, r = 95);
    }
    for(i=[0:len(split(text_cont_var, " "))]) {
       translate([0, 3-16*i, 0.1]) {
           rotate([0,180,0]) {
            linear_extrude(height=0.4) {
                text(split(text_cont_var, " ")[i], size=16, font=font1, halign="center");
            }
           }
       }
   }
} 

difference () {
    translate([0,0,5]) {
    cylinder($fn = 100, h = 20, r = 6);
    }
    
    cylinder($fn = 100, h = 30, r = 3.1);
}
        for(deg1 = [120, 360, 600]) {
            if (side_list[deg1 / 120] == 1) {
                echo(deg1);
                translate([sin(deg1+20.5)*103 ,cos(deg1+20.5)*103, 10])            rotate([0,90,deg1/2]){ 
                    vslot20x20(75);
                    translate([10,-10,0]) rotate([0,-90,0]) vslot_cover(75,20,20);
                    rotate([0,0,30]) cylinder($fn=6, h=75, r=3);
                    translate([6,-10,0]) cube([4,3,75]);
                    translate([-10,6,0]) cube([3,4,75]);
                }
            }
            else {
                echo("skipped");
                }
        for(deg1 = [0, 240, 480]) {
            if (side_list[deg1 / 120] == 1) {
                echo(deg1);
                translate([sin(deg1+80.5)*103 ,cos(deg1+80.5)*103 , 10]) rotate([0,90,deg1/2+120]){
                   vslot20x20(75);
                   translate([10,-10,0]) rotate([0,-90,0]) vslot_cover(75,20,20);
                   rotate([0,0,30]) cylinder($fn=6, h=75, r=3);
                   translate([6,-10,0]) cube([4,3,75]);
                   translate([-10,6,0]) cube([3,4,75]);
            }
        }
            else {
                echo("skipped");
                }
}                
}
}
create_hexagon_foot(sides, text_cont, font);