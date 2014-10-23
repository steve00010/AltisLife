/*
    File: fn_scratchcard.sqf
    Author: Steve
    Description: 
	Win or lose, the system wins!
    Get some $$$.
*/
private["_winner"];
//Close inventory
closeDialog 0;

titleText["You scratch your card and...","PLAIN"];
sleep 3;
_winner = floor(random(20));
if(_winner < 16) exitWith {
	titleText["Win nothing :( May as well go again!","PLAIN"];	
};
if(_winner == 17) exitWith {
	titleText["You win 5k! Well done on breaking even! Try again!","PLAIN"];
	pbh_life_cash = pbh_life_cash + 5000;
};
if(_winner == 18) exitWith {
	titleText["You win 10k! Well done! Now buy two more tickets!","PLAIN"];
	pbh_life_cash = pbh_life_cash + 10000;
};

titleText["You win 20k! Jackpot! You're on a hot streak, keep going!","PLAIN"];
pbh_life_cash = pbh_life_cash + 20000;

	


