var acceptableCategories = ["food",
"music",
"nightlife",
"clothing",
"art",
"movies",
"athletics",
"religion",
"gardening",
"homes"];
var bannedTimes = [];
var maxPrice = 200;

$(document).ready(function() {
	$('#isotope-wrapper').isotope({
	  // options
	  itemSelector : '.search-tile',
	  layoutMode : 'fitRows'
	});
	$('.nav-list input[type="checkbox"]').change(checkboxToggled);
	$('.price-text').change(newPrice);
});

function newPrice(){
	var input = $(this).attr("value")-0;
	if(!isNaN(input)){
		maxPrice = input;
	}else{
		maxPrice = 200;
	}
	isotopeString = getIsotopeString();
	$('#isotope-wrapper').isotope({ filter: isotopeString });
}

function checkboxToggled(){
	var category = $(this).attr("value");
	var isTime = ($(this).parents(".tour-times").length == 1);
	var isotopeString = "";	
	if($(this).attr("checked")){
		// box was just checked
		if(isTime){ bannedTimes = removeFromArray(category, bannedTimes); }
		else{ acceptableCategories.push(category); }
		isotopeString = getIsotopeString();
		$('#isotope-wrapper').isotope({ filter: isotopeString });
	}else{
		if(isTime){ bannedTimes.push(category); }
		else{ acceptableCategories = removeFromArray(category, acceptableCategories); }
		isotopeString = getIsotopeString();
		$('#isotope-wrapper').isotope({ filter: isotopeString });	
	}
}

function getIsotopeString(){
	var isotopeString = "";	
	var bannedString ="";
	var unacceptablePrice = 200;

	$.each(bannedTimes, function(index, item){
		bannedString = bannedString+" ."+item+",";
	});

	for(unacceptablePrice = maxPrice+5; unacceptablePrice < 200; unacceptablePrice+=5){
		bannedString = bannedString+" .price"+unacceptablePrice+", ";
	}

	$.each(acceptableCategories, function(index, item){
		if(bannedString != ""){
			isotopeString = isotopeString+" ."+item+":not("+bannedString+"),";
		}else{
			isotopeString = isotopeString+" ."+item+",";
		}
	});
	console.log(isotopeString);
	return isotopeString;
}

function removeFromArray(needle, haystack){
	haystack = jQuery.grep(haystack, function(value) {
  		return value != needle;
	});
	return haystack;
}
