import js.d3.D3;

import js.d3.selection.UnboundSelection;
import js.d3.selection.Selection;
import js.d3.layout.Layout;

import js.Lib;
using js.HTML5Array;

class Demo {
	
    public static function main(){
        trace('hi');
		var  t = new Test();
	}
}

class Test {
	
	public function new() {
        
		D3.select("#test")
			.append('div')
			.text(function() {
				return 'hi';
			})
			.style("background-color", "grey");
		
		pie();
		
		histogram();
	}
	
	private function pie() {
		
		/* pie test... */		
		var data	= [200,200,200,200,200];
		var i		= 1;
		var w 		= 960;
		var	h 		= 500;
		var	r 		= Math.min(w, h) / 2;
		var	color 	= D3.scale.category20();
		var	donut 	= D3.layout.pie().sort(null);
		var	arc 	= D3.svg.arc().innerRadius(r - 100).outerRadius(r - 20);
		
		var svg = D3.select("body").append("svg:svg")
			.attr("width", w)
			.attr("height", h)
			.append("svg:g")
			.attr("transform", "translate(" + w / 2 + "," + h / 2 + ")");
		
		var arcs = svg.selectAll("path")
			.data(callable("donut")(data)).enter()
			.append("svg:path")
			.attr("fill", function(d, i) { return callable("color")(i); })
			.attr("d", arc);
		
		D3.select(Lib.window).on("click", function() {
			data = D3.range(5).map(randomIrwinHall(2));
			arcs.data(callable("donut")(data)); // update the data
			arcs.attr("d", arc); // redraw the arcs
		});
	}
	
	private function histogram(){
		
		var values:Array<Float> = D3.range(1000).map(randomIrwinHall(10));
		
		// A formatter for counts.
		var formatCount = D3.format(",.0f");

		var margin = {top: 10, right: 30, bottom: 30, left: 30},
			width = 960 - margin.left - margin.right,
			height = 500 - margin.top - margin.bottom;

		var x:Dynamic = D3.scale.linear()
			.domain([0, 1])
			.range([0, width]);

		// Generate a histogram using twenty uniformly-spaced bins.
		var data:Histogram = D3.layout.histogram().bins(x.ticks(20))(values);
		
		var y:Dynamic = D3.scale.linear()
			.domain([0, D3.max(data, function(d) { return d.y; })])
			.range([height, 0]);
		
		var xAxis = D3.svg.axis().scale(x);
		
		var svg = D3.select("body").append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom)
			.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var bar = svg.selectAll(".bar")
			.data(data)
			.enter().append("g")
			.attr("class", "bar")
			.attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; });

		bar.append("rect")
			.attr("x", 1)
			.attr("width", x(data[0].dx) - 1)
			.attr("height", function(d) { return height - y(d.y); });

		bar.append("text")
			.attr("dy", ".75em")
			.attr("y", 6)
			.attr("x", x(data[0].dx) / 2)
			.attr("text-anchor", "middle")
			.text(function(d) { return formatCount(d.y); });

		svg.append("g")
			.attr("class", "x axis")
			.attr("transform", "translate(0," + height + ")")
			.call(xAxis);
    }
	
	private static function randomIrwinHall(m:Int):Void->Float {
	  return function() {
		var s = 0.0;
		for (j in 0...m) s += Math.random();
		return s / m;
	  };
	}
	
	/** get a dynamic reference to an object (class) so you can call it as a function in js) */
	private static inline function callable(name:String):Dynamic {
		return untyped __js__(name);
	}
}