$(document).ready(function(){

	$(".filter-button").click(function(){
		var value = $(this).attr('data-filter');

		if(value == "all")
		{
			//$('.filter').removeClass('hidden');
			$('.filter').show('1000');
		}
		else
		{
//			$('.filter[filter-item="'+value+'"]').removeClass('hidden');
//			$(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
			$(".filter").not('.'+value).hide('3000');
			$('.filter').filter('.'+value).show('3000');

		}
	});
	

	if ($(".filter-button").removeClass("active")) {
		$(this).removeClass("active");
	}
	$(this).addClass("active");

	var stock_tbody = document.getElementById('stock_tbody');
	var stock_tr = null;
	var stock_th = null;
	var stock_td = null;
	var stock_td2 = null;
	var stock_textarea = null;
	var stock_input = null;
	var inp = null;
	var stock_x = 1;
	var stock_y = 0;

	$("#stepadd").click(function(){
		stock_x++;
		stock_tr = document.createElement('tr');
		stock_tbody.append(stock_tr);
		stock_th = document.createElement('th');
		stock_tr.append(stock_th);
		stock_input = document.createElement('input');
		stock_input.setAttribute('class', 'RCC_STEP');
		stock_input.setAttribute('name', 'RCC_STEP');
		stock_input.setAttribute('value', 'STEP '+stock_x+'');
		stock_th.append(stock_input);
		stock_td = document.createElement('td');
		stock_td.setAttribute('colspan','2');
		stock_tr.append(stock_td);
		stock_textarea = document.createElement('textarea');
		stock_textarea.setAttribute('class','recipeContent');	
		stock_textarea.setAttribute('name','RCC_STEPINFO');
		stock_td.append(stock_textarea);
		stock_td2 = document.createElement('td');
		stock_tr.append(stock_td2);
		inp = document.createElement('input');
	    inp.setAttribute('type', 'file');
	    inp.setAttribute('name', 'file');
	    inp.setAttribute('accept', '.gif, .jpg, .jpeg, .png');
	    stock_td2.append(inp);
		stock_y++;
		/*var stock_tbody_th = stock_tbody.getElementsByTagName('th');
		for (i=0; i<stock_tbody_th.length-1; i++)
		{
			stock_td = document.createElement('td');
			stock_tr.append(stock_td);
			add_input('file'+stock_y+'');
		}*/

	});

	$("#stepdel").click(function(){
		var stock_tbody_tr = stock_tbody.getElementsByTagName('tr');
		if (stock_tbody_tr.length > 2) {
			stock_tbody.deleteRow(stock_tbody_tr.length-1	);
			stock_y--;
		}
	});
	
	function add_input(name)
	{
	    var inp = document.createElement('input');
	    inp.setAttribute('type', 'file');
	    inp.setAttribute('name', name);
	    stock_td2.append(inp);
	}

});



