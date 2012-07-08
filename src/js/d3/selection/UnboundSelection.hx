package js.d3.selection;

import js.d3.D3;
import js.d3.transition.Transition;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */
extern class UnboundSelection extends BaseSelection {

    @:overload(function(name:String, value:Dynamic):UnboundSelection{})  
    @:overload(function(name:String, value:Int):UnboundSelection{})  
    @:overload(function(name:String, value:Void->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
    public function attr(name:String, value:String):UnboundSelection;
	
    @:overload(function(name:String, value:String):UnboundSelection{})  
    @:overload(function(name:String, value:Void->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
    public function classed(name:String, value:String):UnboundSelection;

    @:overload(function(name:String, value:String):UnboundSelection{})  
    @:overload(function(name:String, value:Void->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->String):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):UnboundSelection{})  
    public function property(name:String, value:String):UnboundSelection;

    @:overload(function(name:String, value:Void->String, ?priority:Priority):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->String, ?priority:Priority):UnboundSelection{})  
    @:overload(function(name:String, value:Dynamic->Int->String, ?priority:Priority):UnboundSelection{})  
    public function style(name:String, value:String, ?priority:Priority):UnboundSelection;

    @:overload(function():String{})  
    @:overload(function(value:Void->String):UnboundSelection{})  
    @:overload(function(value:Dynamic->String):UnboundSelection{})  
    @:overload(function(value:Dynamic->Int->String):UnboundSelection{})
    public function text(value:String) : UnboundSelection;

    @:overload(function():String{})  
    @:overload(function(value:Void->String):UnboundSelection{})  
    @:overload(function(value:Dynamic->String):UnboundSelection{})  
    @:overload(function(value:Dynamic->Int->String):UnboundSelection{})
    public function html(value:String):UnboundSelection;

    public function append(name:String) : UnboundSelection;
    public function insert(name:String, ?before:String) : UnboundSelection;
    public function remove() : UnboundSelection;

    @:overload(function(data:Dynamic,?key:Dynamic):UnboundSelection{})
    @:overload(function(data:Array<Dynamic>,?key:Dynamic->Int->Dynamic):UnboundSelection{})
    public function data(data:Array<Dynamic>,?key:Dynamic->Dynamic):UnboundSelection;
	
    public function enter():UnboundSelection;
	
	@:overload(function():UnboundSelection{})
    public function exit():Selection;
	
    public function order():UnboundSelection;
	
    public function on(type:String, ?listener:Dynamic, ?capture:Bool):UnboundSelection;

    @:overload(function transition(selection:Selection<Dynamic>):UnboundSelection<Dynamic>{})
    @:overload(function transition(selection:Selection<Dynamic>):Transition{})
    public function transition():Transition;
	
    public function select(selector:String):UnboundSelection;
    public function selectAll(selector:String):UnboundSelection;

    @:overload(function(fn:Dynamic):UnboundSelection{})	
    @:overload(function(fn:Void->Dynamic):UnboundSelection{})	
    @:overload(function(fn:Dynamic->Int->Dynamic):UnboundSelection{})
    public function call(fn:Dynamic->Dynamic) : UnboundSelection;
}