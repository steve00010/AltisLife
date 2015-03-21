_info = player createDiaryRecord ["Diary", [localize "STR_TEXT_INFORMATIONTITLE", ((localize "STR_TEXT_INFORMATIONTEXT")+(localize "STR_TEXT_INFORMATIONTEXT2"))]];

if (side player == WEST) then 
{
	_briefing = player createDiaryRecord ["Diary", [localize "STR_TEXT_BRIEFINGTITLE", localize "STR_TEXT_BRIEFINGTEXT_WEST"]];
	_intel = player createDiaryRecord ["Diary", [localize "STR_TEXT_INTELTITLE", localize "STR_TEXT_INTELTEXT_WEST"]];
}
else
{
	_briefing = player createDiaryRecord ["Diary", [localize "STR_TEXT_BRIEFINGTITLE", localize "STR_TEXT_BRIEFINGTEXT_EAST"]];
	_intel = player createDiaryRecord ["Diary", [localize "STR_TEXT_INTELTITLE", localize "STR_TEXT_INTELTEXT_EAST"]];
};
