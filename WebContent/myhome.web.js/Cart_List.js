$(function(){
	var PriceAll= document.getElementByName("price_one");
	var priceTotal=0;
	for (var i = 0; i < PriceAll.size(); i++) {
		priceTotal += PriceAll[i];
	}
	document.getElementById("price_All1").innerHTML = PriceAll;
	document.getElementById("price_All2").innerHTML = PriceAll;
});