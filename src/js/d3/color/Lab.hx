package js.d3.color;

/**
 * ...
 * @author Ruben Weijers
 */

@:native("d3.lab")
extern class Lab extends Color {
  public static function brighter(?k:Float):Lab;
  public static function darker(?k:Float):Lab;
  public static function rgb():RGB;
}