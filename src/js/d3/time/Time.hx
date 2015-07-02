package js.d3.time;
 import js.d3.locale.TimeFormat;
 import js.d3.time.Scale;
 import haxe.extern.EitherType;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

@:native("d3.time")
extern class Time {
	public var scale:EitherType<Scale,?Dynamic->Scale>;
	public var format:EitherType<TimeFormat,String->EitherType<TimeFormatter,Date->String>>;
}
