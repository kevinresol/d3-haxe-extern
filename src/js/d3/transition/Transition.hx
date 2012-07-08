package js.d3.transition;
import js.d3.selection.UnboundSelection;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */
extern class Transition {
	
	@:overload(function(fn:Dynamic->Int->Int):Transition{})
	public function delay(ms:Int):Transition;
	
	@:overload(function(fn:Dynamic->Int->Int):Transition{})
	public function duration(ms:Int):Transition;
	
	public function ease(value:Dynamic):Transition;
	
	public function attr(name:String, value:Dynamic):Transition;
	
	public function attrTween(name:String, tween:Dynamic):Transition;
	
	public function style(name:String, value:Dynamic, ?priority:String):Transition;
	
	public function styleTween(name:String, tween:Dynamic, ?priority:String):Transition;
	
	@:overload(function(fn:Dynamic->Int->String):Transition{})
	public function text(value:String):Transition;
	
	public function tween(name:String, factory:Dynamic):Transition;
	
	public function remove():Void;
	
	public function select(selector:String):UnboundSelection;
	
	public function selectAll(selector:String):UnboundSelection;
	
	public function transition():Transition;
	
	@:overload(function(listener:Dynamic):Transition{})
	public function each(type:String, listener:Dynamic):Transition;
	
	public function call(fn:Dynamic):Transition;
	
}