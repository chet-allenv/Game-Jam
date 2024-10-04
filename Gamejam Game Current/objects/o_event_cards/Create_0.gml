/// @description Insert description here
// You can write your code in this editor
// All basic card values

// Name
_name = "Undefined"

// How the card affects each stat
_money_change = 0
_employee_change = 0
_investor_change = 0
_public_change = 0
_yes = value_change;
_no = value_change;

// Description
_description = "Missing Description"

function set_values(_name, _yes, _no, _sprite, _description) {
	self._name = _name
	self._yes = _yes
	self._no = _no
    self._sprite = _sprite
    self._description = _description
}

function value_change(_money_change, _employee_change, _investor_change, _public_change)
{
	
	self._money_change = _money_change
    self._employee_change = _employee_change
    self._investor_change = _investor_change
    self._public_change = _public_change
}