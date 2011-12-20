/**
 * @namespace Namespace for VT100 related functions/classes.
 */
var VT100 = {};

/**
 * Class implementing an VT100 style console.
 * @param {string} $container jquery object of console html element.
 * @constructor
 */
VT100.init = function($container, beaglePluginId) {
	console.log('VT100.init');
	this.$container = $container;
	this.beagleTerm = document.getElementById(beaglePluginId);
	this.style();
	this.bindKeyEvent();	
	this.bindResizeEvent();
	
};

/**
 * Initialize the style of console.
 */
VT100.style = function() {
	this.$container.css('color', 'white')
						.css('background-color', 'black')
						.css('font-family', 'sans-serif')
						.css('width', window.innerWidth + 'px')
						.css('height', window.innerHeight + 'px');
}	

/**
 * Bind an event handler to the 'keypress', 'keydown', 'keyup' Javascript event of root window.
 */
VT100.bindKeyEvent = function() {
	$('body').keypress(function(event) {
		console.log("[keypress] " + event.keyCode);
		VT100.sendKey(event.keyCode)
	});
	
	$('body').keyup(function(event) {
		console.log("[keyup] " + event.keyCode);
	});	
	
	$('body').keydown(function(event) {
		console.log("[keydown] " + event.keyCode);
	});		
}


/**
 * Bind an event handler to the 'resize' Javascript event of root window.
 */
VT100.bindResizeEvent = function() {			
	window.onresize = function() {
		console.log(window.innerWidth + ' ' + window.innerHeight);
		VT100.resize(window.innerWidth, window.innerHeight);
	};
};

/**
 * Resize the console.
 * @param {number} width Resize target width.
 * @param {number} height Resize target height.
 */
VT100.resize = function(width, height) {
	this.$container.css('width', width + 'px')
						.css('height', height + 'px');		
};

/**
 * Write text to the console.
 * @param {string} str Text to output.
 */
VT100.write = function(str) {
	for (var i = 0; i < str.length; i++) {
		this.writeChar(str.charAt(i));
	}
};

/**
 * Write a single character to the console.
 * @param {string} ch Character to output.
 */
VT100.writeChar = function(ch) {

};

/**
 * Send a key to the plugin of beagleTerm.
 * @param {string} ch Character to output.
 */
VT100.sendKey = function(keyCode) {
	this.beagleTerm.write(keyCode)
};




