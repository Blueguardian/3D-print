/*Terraforming mars board hexagon script
Creating hexagon tiles for terraforming
mars board */



side_list = [1,1,1,1,1,1];
text_cont_l1 = ""; //For special tiles
text_cont_l2 = "";
font1 = "monospace";
top = false;
img = false;

clearance = 0.1; //Should be as low as possible

module add_text(text_cont1_l1, text_cont1_l2, font2, img_bol) {
    size1 = 4;
    str_length = len(text_cont1_l1) + len(text_cont1_l2);
    
    if(len(text_cont1_l2) == 0 && img_bol == false)
        {
        echo("No second argument");
            
        translate([-str_length+1.5, 0, 0.5]) 
            {
                linear_extrude(height = 1) 
                    {
                        text(text_cont1_l1, font = font2, size = size1);
                    } 
            }
        }
    if(len(text_cont1_l2) != 0 && img_bol == false)
        {
            translate([-len(text_cont1_l1)-size1+2, 1, 0.5]) 
                {    
                    linear_extrude(height = 1) 
                        {
                            text(text_cont1_l1, font = font2, size = size1);
                        }
                    linear_extrude(height = 1) 
                        {
                            text(text_cont1_l1, font = font2, size = size1);
                        }
                }
            translate([-len(text_cont1_l2)-size1+3.7, -3.5, 0.5]) 
                {
                    linear_extrude(height = 1) 
                        {
                            text(text_cont1_l2, font = font2, size = size1);
                        }
                }
        }

     if(img_bol == true) {
         translate([-8.7,0,0.5]) 
         {
         linear_extrude(height = 1) 
             {
             scale(0.06)
                import("/home/mogens/3d/Projects/boardgame/img/city.svg");
             }
         }
         translate([-len(text_cont1_l1)-size1+4.3, -3, 0.5]) 
         {    
              linear_extrude(height = 1) 
                    {
                    text(text_cont1_l1, font = font2, size = 2.4);
                    }
         }
         translate([-len(text_cont1_l2)-size1+4, -6, 0.5]) 
         {
              linear_extrude(height = 1) 
                    {
                    text(text_cont1_l2, font = font2, size = 2.4);
                    }
         }
 }
}


module create_hex(side, top_bol, clear) {
difference() {
        cylinder($fn=6, h=6, r2=23+((4*sin(4))/sin(86)), r1 = 23);
    
        translate([0,0,3]) cylinder($fn=6, h=5, r=20);
        translate([0,0,2]) cylinder(h=5, r=12);
        if(top_bol == true) translate([-4,-4,-7.8]) cube(8);
            
        for(deg1 = [120, 360, 600]) {
            if (side[deg1 / 120] == 1 ) {
            translate([sin(deg1-27)*24 ,cos(deg1-27)*24 , 2.25]) rotate([4,0,        deg1/2+60]) cube([25.5,1,1.5+clear]);
            } else {
                echo("skipped ", deg1);
            }
        }
}
//        if(side[2] == 1) translate([22.2,-1.4,1.5]) rotate([-4,0,-120]) cube([20,1,1]);
//        if(side[4] == 1) translate([-23.1,-1.8,1.5]) rotate([4,0,300]) cube([20,1,1]);
            
        for(deg2 = [0, 240, 480]) {
            if (side[deg2 / 120] == 1 ) {
            translate([sin(deg2-26.6)*22,cos(deg2-27)*22.3, 2.25]) rotate([-4,0,deg2/2]) cube([20,1.1,1.5-clear]);
                } else {
                echo("skipped ", deg2);
            }
        }

//            translate([sin(240)*23,cos(240)*23, 1]) rotate([-4,0,0]) cube([20,1,1]);
//            translate([sin(480)*23,cos(480)*23, 1]) rotate([-4,0,0]) cube([20,1,1]);
}




create_hex(side_list, top, clearance);
add_text(text_cont_l1, text_cont_l2, font1, img);

