$(document).ready(function(){
	initUserStoryDatatable();
})
function initUserStoryDatatable(){
	if($("#user-story-datatable").length > 0){
		var opt = {
			"sDom": "<'row-fluid well-search'<'span5'Ti><'span2'f><'span5'pl><'clear'><'container-processing'r>>t<'row-fluid'<'span6'i><'span6'p>>",
			"sPaginationType": "full_numbers",
			"oLanguage":{
				"sSearch": "<span>Search:</span> ",
				"sInfo": "Showing <span>_START_</span> to <span>_END_</span> of <span>_TOTAL_</span> entries",
				"sLengthMenu": "_MENU_ <span>entries per page</span>"
			},
			'aoColumnDefs' : [
				{
					'bSortable': false,
					'aTargets': [7]
				}
			],
			"oLanguage": {
				"sLengthMenu": "_MENU_",
				"sInfo": "Showing _START_ to _END_ of _TOTAL_ entries <span class='selected_rows'></span>",
				"sSearch": "",
				"oPaginate": {
					"sNext": "Next",
					"sPrevious": "Previous",
				},
				"sEmptyTable": "No data available in table",
				"sInfoEmpty": "Showing 0 to 0 of 0 entries",
				"sInfoFiltered": "(filtered from _MAX_ total entries)",
				"sLoadingRecords": "Loading...",
				"sProcessing":  "<i class='icon-spinner icon-spin icon-large'></i> Processing..."
			},
			'oColVis': {
				"buttonText": "Change columns <i class='icon-angle-down'></i>"
			},
			'oTableTools' : {
				//"sRowSelect": "single",
				"aButtons": [],
				//"sSelectedClass": 'row_selected',
			}
		};
		var oTable = $('#user-story-datatable').dataTable(opt);

		$('.dataTables_filter input').attr("placeholder", "Search here...");
		$(".dataTables_length select").wrap("<div class='input-mini'></div>").chosen({
			disable_search_threshold: 9999999
		});
		// $("#check_all").click(function(e){
		// 	$('input', oTable.fnGetNodes()).prop('checked',this.checked);
		// });
		$.datepicker.setDefaults( {
			dateFormat: "dd-mm-yy"
		});
		oTable.columnFilter({
			"sPlaceHolder" : "head:after",
			'aoColumns': [
				{
					type: "text",
				},
				{
					type: "select",
					bCaseSensitive:false,
					values: ['Urgent', 'High', 'Medium', 'Low']
				},
				{
					type: "text",
				},
				{
					type: "text",
				},
				{
					type: "text",
				},
				{
					type: "select",
					bCaseSensitive:false,
					values: ['Completed', 'In progress', 'Suspend', 'Canceled']
				},
				{
					type: "text",
				},
				{
					type: "text",
				},
				{
					type: "text",
				},
				null
			]
		});
		$("#user-story-datatable").css("width", '100%');
		$('table#user-story-datatable > thead > tr:last-child').hide();

		var html = '<button id="advanceFilter" class="advance-filter mr10 pull-right"><i class="icon-filter"></i></button>';
		$('div.dataTables_wrapper > div.well-search > div:nth-child(3)').prepend(html);

		$('#advanceFilter').click(function() {
			$('table#user-story-datatable > thead > tr:last-child').toggle();
			if($('#advanceFilter').hasClass('advance-filter-active')) {
				$('#advanceFilter').removeClass('advance-filter-active');
				// reset_dt_view(oTable);
			} else {
				$('#advanceFilter').addClass('advance-filter-active');
			}
		});
	}
}