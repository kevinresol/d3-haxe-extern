(function () { "use strict";
var Demo = function() { }
Demo.__name__ = true;
Demo.main = function() {
	console.log("hi");
	var t = new Test();
}
var Test = function() {
	d3.select("#test").append("div").text(function() {
		return "hi";
	}).style("background-color","grey");
	this.pie();
	this.histogram();
};
Test.__name__ = true;
Test.randomIrwinHall = function(m) {
	return function() {
		var s = 0.0;
		var _g = 0;
		while(_g < m) {
			var j = _g++;
			s += Math.random();
		}
		return s / m;
	};
}
Test.getDynamic = function(name) {
	return __js__(name);
}
Test.prototype = {
	histogram: function() {
		var values = d3.range(1000).map(Test.randomIrwinHall(10));
		var formatCount = d3.format(",.0f");
		var margin = { top : 10, right : 30, bottom : 30, left : 30}, width = 960 - margin.left - margin.right, height = 500 - margin.top - margin.bottom;
		var x = d3.scale.linear().domain([0,1]).range([0,width]);
		var data = (d3.layout.histogram().bins(x.ticks(20)))(values);
		var y = d3.scale.linear().domain([0,d3.max(data,function(d) {
			return d.y;
		})]).range([height,0]);
		var xAxis = d3.svg.axis().scale(x);
		var svg = d3.select("body").append("svg").attr("width",width + margin.left + margin.right).attr("height",height + margin.top + margin.bottom).append("g").attr("transform","translate(" + margin.left + "," + margin.top + ")");
		var bar = svg.selectAll(".bar").data(data).enter().append("g").attr("class","bar").attr("transform",function(d) {
			return "translate(" + Std.string(x(d.x)) + "," + Std.string(y(d.y)) + ")";
		});
		bar.append("rect").attr("x",1).attr("width",x(data[0].dx) - 1).attr("height",function(d) {
			return height - y(d.y);
		});
		bar.append("text").attr("dy",".75em").attr("y",6).attr("x",x(data[0].dx) / 2).attr("text-anchor","middle").text(function(d) {
			return formatCount(d.y);
		});
		svg.append("g").attr("class","x axis").attr("transform","translate(0," + height + ")").call(xAxis);
	}
	,pie: function() {
		var data = [200,200,200,200,200];
		var i = 1;
		var w = 960;
		var h = 500;
		var r = Math.min(w,h) / 2;
		var color = d3.scale.category20();
		var donut = d3.layout.pie().sort(null);
		var arc = d3.svg.arc().innerRadius(r - 100).outerRadius(r - 20);
		var svg = d3.select("body").append("svg:svg").attr("width",w).attr("height",h).append("svg:g").attr("transform","translate(" + w / 2 + "," + h / 2 + ")");
		var arcs = svg.selectAll("path").data(donut(data)).enter().append("svg:path").attr("fill",function(d,i1) {
			return color(i1);
		}).attr("d",arc);
		d3.select(js.Browser.document.body).on("click",function(datum,index) {
			data = d3.range(5).map(Test.randomIrwinHall(2));
			arcs.data(donut(data));
			arcs.attr("d",arc);
		});
	}
}
var Std = function() { }
Std.__name__ = true;
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
}
var js = {}
js.Boot = function() { }
js.Boot.__name__ = true;
js.Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2, _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) str += "," + js.Boot.__string_rec(o[i],s); else str += js.Boot.__string_rec(o[i],s);
				}
				return str + ")";
			}
			var l = o.length;
			var i;
			var str = "[";
			s += "\t";
			var _g = 0;
			while(_g < l) {
				var i1 = _g++;
				str += (i1 > 0?",":"") + js.Boot.__string_rec(o[i1],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString) {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) { ;
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js.Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
}
js.Browser = function() { }
js.Browser.__name__ = true;
js.d3 = {}
js.d3._D3 = {}
js.d3._D3.InitPriority = function() { }
js.d3._D3.InitPriority.__name__ = true;
Math.__name__ = ["Math"];
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i) {
	return isNaN(i);
};
String.__name__ = true;
Array.__name__ = true;
js.Browser.document = typeof window != "undefined" ? window.document : null;
js.d3._D3.InitPriority.important = "important";
Demo.main();
})();
