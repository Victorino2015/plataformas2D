extends Node2D

var ui;
var hearts : int = 3:
	set(value):
		hearts = value;
		ui.update_heards(hearts);
	get:
		return hearts;

var diamonds : int = 0:
	set(value):
		diamonds = value;
		ui.update_diamonds_count(diamonds);
	get:
		return diamonds;
	
	


