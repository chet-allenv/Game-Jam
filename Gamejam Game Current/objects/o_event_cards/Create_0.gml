// All basic card values
event_inherited();

// Name
_name = "Undefined"


// Description
_description = "Missing Description"

function set_values(_name, _modifier, _money_change, _employee_change, _investor_change, _public_change,  _sprite, _description) {
	self._name = _name
	self._modifier = _modifier
	self._money_change = _money_change
	self._employee_change = _employee_change
	self._investor_change = _investor_change
	self._public_change = _public_change
    self._sprite = _sprite
    self._description = _description
}
