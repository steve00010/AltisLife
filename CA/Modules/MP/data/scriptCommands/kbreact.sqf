scriptName "MP\data\scriptCommands\kbreact.sqf";
_caller = _this select 0;
_target = _this select 1;

_nabidkaSeOtevreNaKoho = _this select 2;
_topic = _this select 3;
_sentence = _this select 4;

//_target ... klient, kteremu chceme aby se otevrela nabidka konverzace
//_nabidkaSeOtevreNaKoho ...napr. NPC, na ktere bude hrac mluvit (nabidkou, ktera se mu prave otevrela)


 _nabidkaSeOtevreNaKoho kbreact [_target, _topic, _sentence];



