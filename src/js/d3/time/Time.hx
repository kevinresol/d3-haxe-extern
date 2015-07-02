package js.d3.time;
 import js.d3.locale.TimeFormat;
 import js.d3.time.Interval;
 import js.d3.time.Scale;
 import haxe.extern.EitherType;


typedef IntervalShortcut = EitherType<Interval, Date->Date->?Int->Array<Date>>;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 * @author Ruben Weijers
 */

@:native("d3.time")
extern class Time {
	public var scale     : EitherType<Scale, ?Dynamic->Scale>;
	public var format    : EitherType<TimeFormat, String->EitherType<TimeFormatter, Date->String>>;

	public var interval  : EitherType<Interval, Date->Date>;
	public var second    : IntervalShortcut;
	public var minute    : IntervalShortcut;
	public var hour      : IntervalShortcut;
	public var day       : IntervalShortcut;
	public var week      : IntervalShortcut;
	public var sunday    : IntervalShortcut;
	public var monday    : IntervalShortcut;
	public var tuesday   : IntervalShortcut;
	public var wednesday : IntervalShortcut;
	public var thursday  : IntervalShortcut;
	public var friday    : IntervalShortcut;
	public var saturday  : IntervalShortcut;
	public var month     : IntervalShortcut;
	public var year      : IntervalShortcut;

	public function weekOfYear      (date:Date) : Int;
	public function sundayOfYear    (date:Date) : Int;
	public function mondayOfYear    (date:Date) : Int;
	public function tuesdayOfYear   (date:Date) : Int;
	public function wednesdayOfYear (date:Date) : Int;
	public function thursdayOfYear  (date:Date) : Int;
	public function fridayOfYear    (date:Date) : Int;
	public function saturdayOfYear  (date:Date) : Int;
}
