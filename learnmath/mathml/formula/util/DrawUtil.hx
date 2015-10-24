package learnmath.mathml.formula.util;
import openfl.display.MovieClip;

class DrawUtil {
	public static function drawOval(graph:MovieClip, x:Float, y:Float, radius:Float, yRadius:Float = -1):Void {
		// ==============
		// Thanks to: Ric Ewing, Robert Penner, Eric Mueller and Michael Hurwicz for their contributions.
		// ==============

		// init variables
		var theta:Float, xrCtrl:Float, yrCtrl:Float, angle:Float, angleMid:Float, px:Float, py:Float, cx:Float, cy:Float;
		// if only yRadius is undefined, yRadius = radius
		if (yRadius == -1) {
			yRadius = radius;
		}
		// covert 45 degrees to radians for our calculations
		theta = Math.PI/4;
		// calculate the distance for the control point
		xrCtrl = radius/Math.cos(theta/2);
		yrCtrl = yRadius/Math.cos(theta/2);
		// start on the right side of the circle
		angle = 0;
		graph.graphics.moveTo(x+radius, y);
		// this loop draws the circle in 8 segments
		//for (var i:int = 0; i<8; i++) {
		for (i in 0...8) {
			// increment our angles
			angle += theta;
			angleMid = angle-(theta/2);
			// calculate our control point
			cx = x+Math.cos(angleMid)*xrCtrl;
			cy = y+Math.sin(angleMid)*yrCtrl;
			// calculate our end point
			px = x+Math.cos(angle)*radius;
			py = y+Math.sin(angle)*yRadius;
			// draw the circle segment
			graph.graphics.curveTo(cx, cy, px, py);
		}
	}
	
	public static function drawArc(graph:MovieClip, x:Float, y:Float, radius:Float, arc:Float, startAngle:Float, yRadius:Float = -1):Dynamic {
		// ==============
		// Thanks to: Ric Ewing, Robert Penner, Eric Mueller and Michael Hurwicz for their contributions.
		// ==============

		// if yRadius is undefined, yRadius = radius
		if (yRadius == -1) {
			yRadius = radius;
		}
		// Init vars
		var segAngle:Float, theta:Float, angle:Float, angleMid:Float, segs:Float, ax:Float, ay:Float, bx:Float = 0, by:Float = 0, cx:Float, cy:Float;
		// no sense in drawing more than is needed :)
		if (Math.abs(arc)>360) {
			arc = 360;
		}
		// Flash uses 8 segments per circle, to match that, we draw in a maximum
		// of 45 degree segments. First we calculate how many segments are needed
		// for our arc.
		segs = Math.ceil(Math.abs(arc)/45);
		// Now calculate the sweep of each segment
		segAngle = arc/segs;
		// The math requires radians rather than degrees. To convert from degrees
		// use the formula (degrees/180)*Math.PI to get radians. 
		theta = -(segAngle/180)*Math.PI;
		// convert angle startAngle to radians
		angle = -(startAngle/180)*Math.PI;
		// find our starting points (ax,ay) relative to the secified x,y
		ax = x-Math.cos(angle)*radius;
		ay = y-Math.sin(angle)*yRadius;
		// if our arc is larger than 45 degrees, draw as 45 degree segments
		// so that we match Flash's native circle routines.
		
		if (segs>0) {
			// Loop for drawing arc segments
			graph.graphics.moveTo(ax+Math.cos(angle)*radius, ay+Math.sin(angle)*yRadius);
			//for (var i:int = 0; i<segs; i++) {
			for (i in 0...Std.int(segs)) {
				// increment our angle
				angle += theta;
				// find the angle halfway between the last angle and the new
				angleMid = angle-(theta/2);
				// calculate our end point
				bx = ax+Math.cos(angle)*radius;
				by = ay+Math.sin(angle)*yRadius;
				// calculate our control point
				cx = ax+Math.cos(angleMid)*(radius/Math.cos(theta/2));
				cy = ay+Math.sin(angleMid)*(yRadius/Math.cos(theta/2));
				// draw the arc segment
				
				graph.graphics.curveTo(cx, cy, bx, by);
			}
		}

		// In the native draw methods the user must specify the end point
		// which means that they always know where they are ending at, but
		// here the endpoint is unknown unless the user calculates it on their 
		// own. Lets be nice and let save them the hassle by passing it back. 
		return {x:bx, y:by};
	}
}