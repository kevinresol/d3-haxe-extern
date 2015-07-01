package js.d3.locale;


typedef ValueParser = String->Float;
typedef NumberFormat = String->ValueParser;


typedef Locale = {
	numberFormat: NumberFormat;
	timeFormat: TimeFormat;
}