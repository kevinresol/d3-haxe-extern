package js.d3.selection;

import js.d3.transition.Transition;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */
extern class Selection extends BaseSelection {

    @:overload(function(name:String, value:Dynamic):Selection{})  
    @:overload(function(name:String, value:Int):Selection{})  
    @:overload(function(name:String, value:Void->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):Selection{})  
    public function attr(name:String, value:String):Selection;
	
    @:overload(function(name:String, value:Void->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):Selection{})  
    public function classed(name:String, value:String):Selection;

    @:overload(function(name:String, value:Int):Selection{})  
    @:overload(function(name:String, value:Void->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->String):Selection{})  
    @:overload(function(name:String, value:Dynamic->Int->String):Selection{})  
    public function property(name:String, value:String):Selection;

    @:overload(function(name:String, value:Int, ?priority:String):Selection{})  
    @:overload(function(name:String, value:String, ?priority:String):Selection{})  
    @:overload(function(name:String, value:Void->String, ?priority:String):Selection{})  
    @:overload(function(name:String, value:Dynamic->String, ?priority:String):Selection{})  
    @:overload(function(name:String, value:Dynamic->Int->String, ?priority:String):Selection{})  
    public function style(name:String, value:String):Selection;
	
    @:overload(function():String{})
    @:overload(function(value:Void->String):Selection{})
    @:overload(function(value:Dynamic->String):Selection{})  
    @:overload(function(value:Dynamic->Int->String):Selection{})
    public function text(value:String):Selection;

    @:overload(function():String{})  
    @:overload(function(value:Void->String):Selection{})  
    @:overload(function(value:Dynamic->String):Selection{})  
    @:overload(function(value:Dynamic->Int->String):Selection{})
    public function html(value:String):Selection;


    public function remove() : Selection;


    @:overload(function(?dataf:Dynamic->Array):Selection{})	
    @:overload(function(?dataf:Dynamic->Int->Array):Selection{})
    @:overload(function(data:Array,?key:Dynamic->Int->Dynamic):Selection{})  
    public function data(data:Array<Dynamic>, ?key:Dynamic->Dynamic):Selection;

    @:overload(function(fn:Dynamic->Int->Dynamic):Selection{})
    public function datum(fn:Dynamic->Dynamic):Selection;

    public function sort(comparator:Dynamic->Dynamic->Int):Selection;
    public function order():Selection;	

    @:overload(function(type:String, ?listener:Dynamic->Int->Void, ?capture:Bool):Selection{})
    @:overload(function(type:String, ?listener:Void->Void, ?capture:Bool):Selection{})	
    @:overload(function(type:String, ?listener:Dynamic->Void, ?capture:Bool):Selection{})
    public function on(type:String, ?listener:Dynamic->Void, ?capture:Bool):Dynamic;

    @:overload(function transition(selection:Selection):Selection{})
    @:overload(function transition(selection:Selection):Transition{})
    public function transition():Transition;

    public function select(selector:String):Selection;
    public function selectAll(selector:String):Selection;

    @:overload(function(fn:Dynamic->Int->Void):Selection{})
    public function each(fn:Dynamic->Void):Selection;

    @:overload(function(fn:Dynamic):Selection{})
    @:overload(function(fn:Void->Dynamic):Selection{})
    @:overload(function(fn:Dynamic->Int->Dynamic):Selection{})
    public function call(fn:Dynamic->Dynamic) : Selection;

    @:overload(function(selector:Dynamic->Int->Bool):Selection{})
    @:overload(function(selector:Dynamic->Bool):Selection{})
    public function filter(selector:String):Selection;
}