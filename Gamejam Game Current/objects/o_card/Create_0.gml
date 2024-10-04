// All basic card values

// Name
var _name = "Undefined"

// How the card affects each stat
var _money_change = 0
var _employee_change = 0
var _investor_change = 0
var _public_change = 0

// Sprite
var _sprite = spr_old_bg

// Description
var _description = "Missing Description"

function set_values(_name, _money_change, _employee_change, _investor_change, _public_change, _sprite, _description) {
	self._name = _name
	self._money_change = _money_change
    self._employee_change = _employee_change
    self._investor_change = _investor_change
    self._public_change = _public_change
    self._sprite = _sprite
    self._description = _description
}