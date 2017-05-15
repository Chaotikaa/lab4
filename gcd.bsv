interface LGCD;
    method Action start(int a, int b);
    method int result();
    method Bool busy;
endinterface

module mkLGCD (LGCD);
    /*DO NOT change these registers, remove or add more registers*/
    Reg#(int) x <- mkReg(0);
    Reg#(int) y <- mkReg(0);
    Reg#(Bool) bz <- mkReg(False);

    rule subtract(bz);
	if (x > y) x <= x - y;
        if (y >= x) y <= y - x;
        bz <= !((x == 0) || y==0);
    endrule

    /*Do not change the signature of the method */
    method Action start(int a, int b); 
	if (bz == False)
        begin
             
            bz <= True;
            x <= a;
            y <= b;
            if (a <= 0 || b <= 0)
            begin
               $display("ERROR");
            end
            
            
        end 
    endmethod
    method int result();
    	return (x == 0)?y:x;
    endmethod
    method Bool busy;
        return bz;
        //return !((x == 0) || (y==0));
    endmethod

endmodule

