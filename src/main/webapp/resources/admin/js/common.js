$(function(){
	// datepicker
	$('.datepicker').datepicker({
		format : "yyyy-mm-dd",
	});

	// tableData
	$('.tableData').DataTable({
		responsive: true
	});
});