package js.d3.selection;

import js.Dom;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

extern class BaseSelection implements ArrayAccess<HtmlDom>{
    public function empty():Bool;
    public function node():HtmlDom;	
}