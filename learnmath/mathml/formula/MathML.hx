package learnmath.mathml.formula;
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/

import learnmath.mathml.formula.layout.ErrorBox;
import learnmath.mathml.formula.layout.FencedBox;
import learnmath.mathml.formula.layout.FracBox;
import learnmath.mathml.formula.layout.PaddedBox;
import learnmath.mathml.formula.layout.PhantomBox;
import learnmath.mathml.formula.layout.RootBox;
import learnmath.mathml.formula.layout.RowBox;
import learnmath.mathml.formula.layout.SpaceBox;
import learnmath.mathml.formula.layout.SqrtBox;
import learnmath.mathml.formula.layout.TableBox;
import learnmath.mathml.formula.layout.TdBox;
import learnmath.mathml.formula.layout.TrBox;
import learnmath.mathml.formula.script.OverBox;
import learnmath.mathml.formula.script.SubBox;
import learnmath.mathml.formula.script.SubSupBox;
import learnmath.mathml.formula.script.SupBox;
import learnmath.mathml.formula.script.UnderBox;
import learnmath.mathml.formula.script.UnderOverBox;
import learnmath.mathml.formula.token.IBox;
import learnmath.mathml.formula.token.NBox;
import learnmath.mathml.formula.token.OBox;
import learnmath.mathml.formula.token.SBox;
import learnmath.mathml.formula.token.TBox;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.display.Sprite;

class MathML {
	private var _xml:Xml;
	public var dE:DrawFormula;
	
	public function new(xml:Xml) {
		this._xml = xml;
		var rootBox:Box = loadNode(xml.firstElement(), null);
		dE = new DrawFormula(rootBox);
	}
	
	public function drawFormula(graph:Sprite, style:Style):Rectangle {
		var movieclip:MovieClip = new MovieClip();
		graph.addChild(movieclip);
		var start:Point = new Point();
		var dim:Rectangle = dE.draw(movieclip, style, start);
		
		movieclip.y = (movieclip.y - dim.y) + 2;
		
		movieclip.x = movieclip.x + 2;
		
		dE.mc.graphics.lineStyle(1, 0xffffff, 0.01);
		dE.mc.graphics.beginFill(0xffffff, 0.01);
		dE.mc.graphics.drawRect(dim.x, dim.y, dim.width, dim.height);
		dE.mc.graphics.endFill();
		
		dim.width = dim.width + 4;
		dim.height = dim.height + 4;
		
		return dim;
	}
	
	private function loadNode(node:Xml, parentBox:Box):Box {
		var name:String = node.nodeName;
		var box:Box = null;
		if (name == 'mrow' || name == 'math' || name == 'mathml') {
			box = loadMrow(node, parentBox);
		} else if (name == 'mfenced') {
			box = loadMfenced(node, parentBox);
		} else if (name == 'mphantom') {
			box = loadMPhantom(node, parentBox);
		} else if (name == 'mpadded') {
			box = loadMPadded(node, parentBox);
		} else if (name == 'mspace') {
			box = loadMSpace(node, parentBox);
		} else if (name == 'merror') {
			box = loadMError(node, parentBox);
		} else if (name == 'mfrac') {
			box = loadMfrac(node, parentBox);
		} else if (name == 'msqrt') {
			box = loadMSqrt(node, parentBox);
		} else if (name == 'mroot') {
			box = loadMRoot(node, parentBox);
		} else if (name == 'mover') {
			box = loadMOver(node, parentBox);
		} else if (name == 'msup') {
			box = loadMSup(node, parentBox);
		} else if (name == 'munder') {
			box = loadMUnder(node, parentBox);
		} else if (name == 'msub') {
			box = loadMSub(node, parentBox);
		} else if (name == 'msubsup') {
			box = loadMSubSup(node, parentBox);
		} else if (name == 'munderover') {
			box = loadMUnderOver(node, parentBox);
		} else if (name == 'mi') {
			box = loadMi(node, parentBox);
		} else if (name == 'mn') {
			box = loadMn(node, parentBox);
		} else if (name == 'mo') {
			box = loadMo(node, parentBox);
		} else if (name == 'mtext') {
			box = loadMtext(node, parentBox);
		} else if (name == 'ms') {
			box = loadMs(node, parentBox);
		} else if (name == 'mtable') {
			box = loadMTable(node, parentBox);
		} else if (name == 'mtr') {
			box = loadMTr(node, parentBox);
		} else if (name == 'mtd') {
			box = loadMTd(node, parentBox);
		} 
		
		if (box != null) {
			loadAttributes(node, box);
		} else {
			throw "Node '" + name + "' not recognised";
		}
	
		return box;
	}
	
	private function loadAttributes(node:Xml, box:Box):Void {
		if (node.get("color") != null) {
			box.style.color = node.get("color");
		}
		if (node.get("background") != null) {
			box.style.bgcolor = node.get("background");
		}
		if (node.get("fontweight") != null) {
			box.style.fontweight = node.get("fontweight");
		}
		if (node.get("fontstyle") != null) {
			box.style.fontstyle = node.get("fontstyle");
		}
		if (node.get("size") != null) {
			box.style.size = Std.parseInt(node.get("size"));
		}
		if (node.get("fontfamily") != null) {
			box.style.font = node.get("fontfamily");
		}
	}
	
	private function loadMrow(node:Xml, parentBox:Box):Box {
		var nodeBox:RowBox = new RowBox(parentBox);	
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		return nodeBox;
	}
	
	private function loadMTable(node:Xml, parentBox:Box):Box {
		var nodeBox:TableBox = new TableBox(parentBox);
		for (el in node.elements()) {
			if (el.nodeName == "mtr") {
				var child:Box = loadNode(el, nodeBox);
				nodeBox.addRow(child);
			}
		}
		
		if (node.get("rowalign") != null) {
			nodeBox.rowalign = StringTools.trim(node.get("rowalign"));
		}
		if (node.get("columnalign") != null) {
			nodeBox.columnalign = StringTools.trim(node.get("columnalign"));
		}
		if (node.get("rowspacing") != null) {
			nodeBox.rowspacing = Std.parseFloat(StringTools.trim(node.get("rowspacing")));
		}
		if (node.get("columnspacing") != null) {
			nodeBox.columnspacing = Std.parseFloat(StringTools.trim(node.get("columnspacing")));
		}
		if (node.get("framespacing") != null) {
			nodeBox.framespacing = Std.parseFloat(StringTools.trim(node.get("framespacing")));
		}
		
		return nodeBox;
	}
	
	private function loadMTr(node:Xml, parentBox:Box):Box {
		var nodeBox:TrBox = new TrBox(parentBox);	
		for (el in node.elements()) {
			if (el.nodeName == "mtd") {
				var child:Box = loadNode(el, nodeBox);
				nodeBox.addTd(child);
			}
		}
		
		if (node.get("rowalign") != null) {
			nodeBox.rowalign = StringTools.trim(node.get("rowalign"));
		}
		if (node.get("columnalign") != null) {
			nodeBox.columnalign = StringTools.trim(node.get("columnalign"));
		}
		
		return nodeBox;
	}
	
	private function loadMTd(node:Xml, parentBox:Box):Box {
		var nodeBox:TdBox = new TdBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		
		if (node.get("rowalign") != null) {
			nodeBox.rowalign = StringTools.trim(node.get("rowalign"));
		}
		if (node.get("columnalign") != null) {
			nodeBox.columnalign = StringTools.trim(node.get("columnalign"));
		}
		if (node.get("rowspan") != null) {
			nodeBox.rowspan = Std.parseFloat(StringTools.trim(node.get("rowspan")));
		}
		if (node.get("columnspan") != null) {
			nodeBox.columnspan = Std.parseFloat(StringTools.trim(node.get("columnspan")));
		}
		
		return nodeBox;
	}
	
	private function loadMfenced(node:Xml, parentBox:Box):Box {
		var nodeBox:FencedBox = new FencedBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		
		if(node.get("linethickness") != null){
			nodeBox.linethickness = Std.parseFloat(node.get("linethickness"));
		}
		if(node.get("open") != null){
			nodeBox.open = node.get("open");
		}
		if(node.get("close") != null){
			nodeBox.close = node.get("close");
		}
		return nodeBox;
	}
	
	private function loadMPadded(node:Xml, parentBox:Box):Box {
		var nodeBox:PaddedBox = new PaddedBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}

		if(node.get("width") != null){
			nodeBox.widthS = node.get("width");
		}
		if(node.get("lspace") != null){
			nodeBox.lspaceS = node.get("lspace");
		}
		if(node.get("height") != null){
			nodeBox.heightS = node.get("height");
		}
		if(node.get("depth") != null){
			nodeBox.depthS = node.get("depth");
		}
		return nodeBox;
	}
	
	private function loadMSpace(node:Xml, parentBox:Box):Box {
		var nodeBox:SpaceBox = new SpaceBox(parentBox);	
		if(node.get("width") != null){
			nodeBox.width = Std.parseInt(node.get("width"));
		}
		if(node.get("height") != null){
			nodeBox.height = Std.parseInt(node.get("height"));
		}
		return nodeBox;
	}
	
	private function loadMPhantom(node:Xml, parentBox:Box):Box {
		var nodeBox:PhantomBox = new PhantomBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		return nodeBox;
	}

	private function loadMError(node:Xml, parentBox:Box):Box {
		var nodeBox:ErrorBox = new ErrorBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		nodeBox.style.color = "#ff0000";
		return nodeBox;
	}
	
	private function loadMfrac(node:Xml, parentBox:Box):Box {
		var nodeBox:FracBox = new FracBox(parentBox);
		if(node.get("linethickness") != null){
			nodeBox.linethickness = Std.parseFloat(node.get("linethickness"));
		}
		if(node.get("bevelled") != null){
			if (node.get("bevelled") == "true") nodeBox.bevelled = true;
		}
		var elements:Iterator<Xml> = node.elements();
		var numNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.num = numNode;
		var denumNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.denum = denumNode;
		return nodeBox;
	}
	
	private function loadMSqrt(node:Xml, parentBox:Box):Box {
		var nodeBox:SqrtBox = new SqrtBox(parentBox);
		for (el in node.elements()) {
			var child:Box = loadNode(el, nodeBox);
			nodeBox.addChild(child);
		}
		if(node.get("linethickness") != null){
			nodeBox.linethickness = Std.parseFloat(node.get("linethickness"));
		}
		return nodeBox;
	}
	
	private function loadMRoot(node:Xml, parentBox:Box):Box {
		var nodeBox:RootBox = new RootBox(parentBox);
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.index = expNode;
		if(node.get("linethickness") != null){
			nodeBox.linethickness = Std.parseFloat(node.get("linethickness"));
		}
		return nodeBox;
	}
	
	private function loadMSup(node:Xml, parentBox:Box):Box {
		var nodeBox:SupBox = new SupBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMOver(node:Xml, parentBox:Box):Box {
		var nodeBox:OverBox = new OverBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMSub(node:Xml, parentBox:Box):Box {
		var nodeBox:SubBox = new SubBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}
	
	private function loadMUnder(node:Xml, parentBox:Box):Box {
		var nodeBox:UnderBox = new UnderBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}
	
	private function loadMSubSup(node:Xml, parentBox:Box):Box {
		var nodeBox:SubSupBox = new SubSupBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var subNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.sub = subNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMUnderOver(node:Xml, parentBox:Box):Box {
		var nodeBox:UnderOverBox = new UnderOverBox(parentBox);	
		var elements:Iterator<Xml> = node.elements();
		var baseNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.base = baseNode;
		var subNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.sub = subNode;
		var expNode:Box = loadNode(elements.next(), nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMi(node:Xml, parentBox:Box):Box {
		var nodeBox:IBox = new IBox(parentBox);
		nodeBox.text = node.firstChild().nodeValue;
		return nodeBox;
	}
	
	private function loadMo(node:Xml, parentBox:Box):Box {
		var elements:Iterator<Xml> = node.elements();
		var nodeBox:OBox = OBox.getOBox(StringTools.trim(node.firstChild().nodeValue), parentBox);
		if (node.get("stretchy") != null) {
			nodeBox.stretchy = (StringTools.trim(node.get("stretchy"))).toLowerCase() == "true";
		}
		if (node.get("maxsize") != null) {
			nodeBox.maxsize = Std.parseInt(node.get("maxsize"));
		}
		if (node.get("minsize") != null) {
			nodeBox.minsize = Std.parseInt(node.get("minsize"));
		}
		return nodeBox;
	}
	
	private function loadMtext(node:Xml, parentBox:Box):Box {
		var nodeBox:TBox = new TBox(parentBox);
		nodeBox.text = node.firstChild().nodeValue;
		return nodeBox;
	}
	
	private function loadMs(node:Xml, parentBox:Box):Box {
		var nodeBox:SBox = new SBox(parentBox);
		nodeBox.text = node.firstChild().nodeValue;
		return nodeBox;
	}
	
	private function loadMn(node:Xml, parentBox:Box):Box {
		var nodeBox:NBox = new NBox(parentBox);
		nodeBox.number = StringTools.trim(node.firstChild().nodeValue);
		return nodeBox;
	}
}