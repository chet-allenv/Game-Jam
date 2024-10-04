global.money = 0; // Total money
global.employee = 50; // Employee stat
global.investor = 50; // investor stat
global.public = 50; // public stat

if (!variable_global_exists("loss")) {
    global.loss = "Cash";
}

if (!variable_global_exists("max_cash")) {
    global.max_cash = 0;
}