// All basic card values

// Name
_name = "Undefined"

// How the card affects each stat
_money_change = 0
_employee_change = 0
_investor_change = 0
_public_change = 0

// Sprite
_sprite = Sprite2

// Description
_description = "Missing Description"

function set_values(_name, _money_change, _employee_change, _investor_change, _public_change, _sprite, _description) {
	self._name = _name
	self._money_change = _money_change
    self._employee_change = _employee_change
    self._investor_change = _investor_change
    self._public_change = _public_change
    self._sprite = _sprite
    self._description = _description
}