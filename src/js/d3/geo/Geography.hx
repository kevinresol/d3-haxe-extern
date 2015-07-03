package js.d3.geo;
 import haxe.extern.EitherType;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 * @author Ruben Weijers
 */

@:native("d3.geo")
extern class Geography {
	/*https://github.com/mbostock/d3/wiki/Geo*/

	@:overload(function():Dynamic->Int->Path{})
	@:overload(function():Dynamic->Path{})
	public function path():Path;

	@:overload(function():Void->LineString{}) //FIXME, not sure whether it returns the coordinates property as Array<Float> or as Array<LineString>
	public function graticule():Graticule;

	@:overload(function():Rest<Dynamic>->Polygon{})
	public function circle():Circle;

	public function area(feature:Dynamic):Float;
	public function bounds(feature:Dynamic):Array<Coordinate>;
	public function distance(a:Coordinate, b:Coordinate):Float;
	public function length(feature:Dynamic):Float;
	public function interpolate(source:Coordinate, target:Coordinate):?Float->Coordinate;

	@:overload(function():Coordinate->Coordinate{})
	public function rotation(rotate):Rotation;

	// projections...
	@:overload(function():Array<Float>->Array<Float>{})
	public function mercator():Mercator;

	@:overload(function():Array<Float>->Array<Float>{})
	public function albers():Albers;

	@:overload(function():Array<Float>->Array<Float>{})
	public function albersUsa():AlbersUsa;

	@:overload(function():Array<Float>->Array<Float>{})
	public function azimuthal():Azimuthal;

}


/*https://github.com/mbostock/d3/wiki/Geo-Paths*/

private typedef Coordinate = Array<Float>;
private typedef PathContext = {
	public function beginPath():Void;
	public function closePath():Void;
	public function moveTo(x:Float, y:Float):Void;
	public function lineTo(x:Float, y:Float):Void;
	public function arc(x:Float, y:Float,radius:Float,startAngle:Float,endAngle:Float):Void;
};

@:native("d3.geo.path")
extern class Path {

	@:overload(function():Coordinate->Coordinate{})
	public function projection(projection:Coordinate->Coordinate):Path;

	@:overload(function():PathContext{})
	public function context(context:PathContext):Path;

	public function area(feature:Dynamic):Float;
	public function centroid(feature:Dynamic):Coordinate;
	public function bounds(feature:Dynamic):Array<Coordinate>;

	@:overload(function():Dynamic{})
	@:overload(function (radius:Dynamic):Path{})
	public function pointRadius(radius:Float):Path;
}



private typedef LineString = {type:String, coordinates:Coordinate};
private typedef Polygon = {type:String, coordinates:Array<Coordinate>};

@:native("d3.geo.graticule")
extern class Graticule {
	public function lines () : Array<LineString>;
	public function outline () : Polygon;

	@:overload(function ():Array<Coordinate> {})
	public function extent (extent:Array<Coordinate>) : Graticule;

	@:overload(function ():Array<Coordinate> {})
	public function majorExtent(extent:Array<Coordinate>) : Graticule;

	@:overload(function ():Array<Coordinate> {})
	public function minorExtent(extent:Array<Coordinate>) : Graticule;

	@:overload(function():Coordinate {})
	public function step (step:Coordinate) : Graticule;

	@:overload(function():Coordinate {})
	public function majorStep (step:Coordinate) : Graticule;

	@:overload(function():Coordinate {})
	public function minorStep (step:Coordinate) : Graticule;

	@:overload(function () : Float {})
	public function precission (precission:Float) : Graticule;
}



typedef CircleOrigin = EitherType<Coordinate, Rest<Dynamic>->Coordinate>;

@:native("d3.geo.circle")
extern class Circle {
	@:overload(function():CircleOrigin {})
	public function origin (origin:CircleOrigin) : Circle;

	@:overload(function():Float {})
	public function angle (x:Float) : Circle;

	@:overload(function () : Float {})
	public function precission (precission:Float) : Circle;
}


@:native("d3.geo.rotation")
extern class Rotation {
	public function invert(location:Coordinate):Coordinate;
}



/*https://github.com/mbostock/d3/wiki/Geo-Projections*/
extern class Mercator {
	public function invert(point:Array<Float>):Array<Float>;

	@:overload(function():Float{})
	public function scale(scale:Float):Mercator;

	@:overload(function():Array<Float>{})
	public function translate(offset:Array<Float>):Mercator;
}

extern class Albers {
	public function invert(point:Array<Float>):Array<Float>;

	@:overload(function():Array<Float>{})
	public function origin(origin:Array<Float>):Albers;

	@:overload(function():Array<Float>{})
	public function parallels(parallels:Array<Float>):Albers;

	@:overload(function():Float{})
	public function scale(scale:Float):Albers;

	@:overload(function():Array<Float>{})
	public function translate(offset:Array<Float>):Albers;
}

extern class AlbersUsa {
	@:overload(function():Float{})
	public function scale(scale:Float):AlbersUsa;

	@:overload(function():Array<Float>{})
	public function translate(offset:Array<Float>):AlbersUsa;
}

extern class Azimuthal {

	@:overload(function():String{})
	public function mode(mode:String):Azimuthal;

	@:overload(function():Array<Float>{})
	public function origin(origin:Array<Float>):Azimuthal;

	@:overload(function():Float{})
	public function scale(scale:Float):Azimuthal;

	@:overload(function():Array<Float>{})
	public function translate(offset:Array<Float>):Azimuthal;

}
