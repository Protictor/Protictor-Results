mtype = {Order, Cut, Assemble, Paint, Deliver}
mtype Stage;
int gvar = 0;

init 
{
	int ivar1 = 1;
	run TM();	 
	int ivar2 = 2;
}


proctype TM()
{
	int pvar = 3;
	Stage = Order;
	do
	::	Stage = Cut;
		if 
		:: Stage = Assemble;
			gvar = 2;
		:: Stage = Paint;
			gvar = 3;
		fi;
		
		if :: (Stage == Assemble) -> Stage = Paint 
		fi
		
		Stage = Deliver;
		Stage = Order;
		
	od
}
ltl  {[]<> (Stage == Assemble)} 
/*ltl  {<> (Stage == Assemble)} */
/* never {[](Stage != Assemble)} */
