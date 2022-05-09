/**
 * 
 */



	var img = document.querySelector('.search-container img'),

	search_window = document.querySelector('#search_window-overlay');
	
	modal = search_window.querySelector('img');
	
	console.log(img);
	
	img.addEventListener('click', function(){
		var newWindow = this.getAttribute('data-search_window');
		console.log(newWindow);
		
		modal.setAttribute('href', newWindow);
		
		search_window.classList.add('visible')
		
		
	});
	