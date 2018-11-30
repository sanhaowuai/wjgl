function treetable() {
$("#zbtable").treeTable();

	// Make visible that a row is clicked
	$("table #zbtable tbody tr").mousedown(function() {
		$("tr.selected").removeClass("selected"); // Deselect currently selected rows
		$(this).addClass("selected");
	});

	// Make sure row is selected when span is clicked
	$("table #zbtable tbody tr span").mousedown(function() {
		$($(this).parents("tr")[0]).trigger("mousedown");
    });
}