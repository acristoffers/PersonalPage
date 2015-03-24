/*
* Made possible by http://www.piclist.com/techref/microchip/PIC16DelayTutorial.htm
* 
* The MIT License (MIT)
* 
* Copyright (c) 2014 Álan Crístoffer
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

// return the max value that the n'th iteration can count to
function max(n) {
    if ( n == 1) {
        return 3*256-1;
    }

    var v = 0;
    var s = '';

    for (var i = 1; i <= n; i++) {
        s += 'd' + i + '=256;';
    }

    s += 'v='
    s += formula(n);

    eval(s);

    return v;
}

// find the formula for n variables
function formula(n) {
    var v = 'd' + n;

    if ( n == 1 ) {
        return '-1+3*' + v;
    }

    return '(' + formula(n-1) + '+(' + max(n-1) + ' + 3) * (' + v + ' - 1) + 2 )';
}

// find the constant multiplying the variable
function constantBeforeVariable(j, n, exp, c) {
    var v;

    var s = '';
    for (var i = 1; i <= n; i++) {
        if ( i != j ) {
            s += 'd' + i + '=0;';
        }
    }
    s += 'd' + j + '=1;v='+exp+'-('+c+')';
    eval(s);

    return v;
}

// find the constants we need to use in the assembly code for the specified delay
function constantsForNVars(n, c) {
    // find the formula for n variables
    var exp = formula(n);

    // find the constant part of the formula
    var constant;
    var s = '';
    for (var i = 1; i <= n; i++) {
        s += 'd' + i + '=0;';
    }
    eval(s+'constant='+exp);

    // find the constants that multiply each variable
    var multipliers = [];
    for (var i=1; i<=n; i++) {
        multipliers[i] = constantBeforeVariable(i, n, exp, constant);	
    }

    // find the variable values
    constant = c - constant;

    var variables = [];
    for ( var i=n; i>=1; i-- ) {
        var m = multipliers[i]
        var rest = constant % m;
        variables[i] = (constant-rest) / m;
        constant = rest;
    }

    variables[0] = constant;
    return variables;
}

function getClk() {
    var clk  = $('#clock').val();

    clk  = parseInt(clk);

    if ( isNaN(clk) ) {
        alert("You must inform the clock!");
        return undefined;
    }

    clk /= 4;

    return clk;
}

function generateASM(inst){
    var clk = getClk();
    if (clk == undefined) {
        return;
    }

    var number_of_variables = Math.ceil( Math.log(inst) / Math.log(255) );

    var consumed_instructions = number_of_variables * 2 + 2 + 2; // var initialization + return + call

    var need_to_consume = inst - consumed_instructions;

    var constants = constantsForNVars(number_of_variables, need_to_consume);

    var func_name = $('#label').val() + '_' + inst;
    var asm = func_name + ":\n\t";

    asm += "cblock 0x20\n";
    for ( var i=1; i<=number_of_variables; i++) {
        asm += '\t\td' + i + "\n";
    }
    asm += "\tendc\n\n";

    for ( var i=1; i<=number_of_variables; i++) {
        asm += '\tmovlw\t.' + constants[i] + "\n";
        asm += '\tmovwf\td' + i + "\n";
    }

    asm += '\n';

    asm += func_name + '_loop:\n';
    for ( var i=1; i<=number_of_variables; i++) {
        asm += '\tdecfsz\td' + i + ",f\n";
        asm += '\tgoto\t' + func_name + '_loop\n';
    }

    if (constants[0]>0) {
        asm += '\n';
    }

    while ( constants[0] > 0 ) {
        if (constants[0] >= 2 ) {
            asm += '\tgoto $+1\n';
            constants[0] -= 2;
        } else {
            asm += '\tnop\n';
            constants[0] -= 1;
        }
    }

    for( var i=1; i<=constants[0]; i++) {
        asm += '\tnop\n';
    }

    asm += '\n\treturn\n';

    $('#asm').html(asm.replace(/\n/g, "<br>").replace(/\t/g, "&nbsp;&nbsp;&nbsp;&nbsp;"));
}

function register() {
    $('#gen-freq').click(function() {
        var freq = $('#value').val();
        freq = parseFloat(freq);

        var clk = getClk();
        if (clk == undefined) {
            return;
        }
    
        generateASM(Math.ceil(clk/freq));
    });

    $('#gen-secs').click(function() {
        var time = $('#value').val();
        time = parseFloat(time);

        var clk = getClk();
        if (clk == undefined) {
            return;
        }
    
        generateASM(Math.ceil(clk*time/1000));
    });

    $('#gen-inst').click(function() {
        var cycles = $('#value').val();
        cycles = parseInt(cycles);

        generateASM(cycles);
    }); 
}

$(document).ready(function() {
    register();
    
    $("#content").change(function(){
        register();
    });
});
