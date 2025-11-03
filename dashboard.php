<?php
    include('../config/connection.php');
    include("../config/checkurlaccess.php");
    include('../config/dashboard-functions.php');

?>
<div class='header-page' >
	<div class='header-page-inner'>
		Dashboard
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent no-border">

		<div class="row"> 

			<div class='col-md-9'>

					<div class='tabpane-white margin-top-20 margin-bottom-10'>
						
						<ul class="nav nav-tabs">
							<li role="presentation" class="active" data-pane='#dashboard-physicalinventorypane' id='dashboard-physicalinventorytab'><a href="#">Inventory on Hand ( As of Today )</a></li>
							<li role="presentation" data-pane='#dashboard-nrlyexpitemspane' id='dashboard-nrlyexpitems'><a href="#">Nearly Expiry Items</a></li>
							<li role="presentation" data-pane='#dashboard-pendingdoc4rcvpane' id='dashboard-pendingdoc4rcv'><a href="#">Pending for Receiving</a></li>
							<li role="presentation" data-pane='#dashboard-pendingdoc2outpane' id='dashboard-pendingdoc2out'><a href="#">Pending for Transfer</a></li>
						</ul>
						<div class='tab-panes'>

							<div class='pane active' id='dashboard-physicalinventorypane'>
									<div class='form-horizontal'>
										<div class='col-md-8'>
											<div class='form-group'>
												<label class='control-label col-md-3'>Warehouse</label>
												<div class="col-md-9">
													<select class='form-control physicalinventorypane-warehouse warehousedropdownselect select2'>
														<?php
														$rs = query("select warehouse.id,
															warehouse.code,
															warehouse.description 
															from user
															inner join warehouse on warehouse.id=user.warehouse_id
															where user.id='".USERID."'");
															while($obj=fetch($rs)){
															echo "<option value='$obj->id' selected>$obj->code - $obj->description</option>";
														}

														?>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class='col-md-12'>
										<div id='dash-physicalinventorypanel'>
											<table id='dash-physicalinventorytbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>
							
							<div class='pane' id='dashboard-nrlyexpitemspane'> 
									<div class='col-md-12'>
										<div id='dash-nrlyexpitemspanel'>
											<table id='dash-nrlyexpitemstbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>
							
							<div class='pane' id='dashboard-pendingdoc4rcvpane'> 
									<div class='col-md-12'>
										<div id='dash-pendingdoc4rcvpanel'>
											<table id='dash-pendingdoc4rcvtbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>

							<div class='pane' id='dashboard-pendingdoc2outpane'> 
									<div class='col-md-12'>
										<div id='dash-pendingdoc2outpanel'>
											<table id='dash-pendingdoc2outtbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>

						</div>

					</div>
					
					
					
			</div>

			<div class='col-md-3'>
					<div class="space-break"></div>
							<div class="form-horizontal" id='dash-transactiondatewrp'>
								<div class="form-group">
									<div class="col-md-12">
										<label class='control-label label-sm text-left'>Transaction Date</label>
										<!--<input type='text' class='datepicker form-control dateselectionfield' value="<?php echo date('l, d F Y'); ?>">-->
									</div>
								</div>	
								<div class="form-group">
									<label class='control-label col-md-2'>From</label>
									<div class="col-md-10">
										<input type='text' class='datepicker form-control dateselectionfromfield' value="<?php echo date('l, d F Y'); ?>">
									</div>
								</div>
								<div class="form-group">
									<label class='control-label col-md-2'>To</label>
									<div class="col-md-10">
										<input type='text' class='datepicker form-control dateselectiontofield' value="<?php echo date('l, d F Y'); ?>">
									</div>
								</div>
							</div>
							<br>

							<div class="form-horizontal overflow-auto" id='dash-purchaseorderwrp'>
								<div>
									<label class='control-label label-sm text-left'>Purchase Order</label>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
											<label class='control-label text-left'>Created</label>
											<input type='text' class='form-control text-box-count pouploadedcount' value="<?php echo getPoUploadedCount('',date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
											<label class='control-label text-left'>Receipt</label>
											<input type='text' class='form-control text-box-count poreceiptcount'  value="<?php echo getPoRcvCount('',date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
											<label class='control-label text-left'>Putaway</label>
											<input type='text' class='form-control text-box-count poputawaycount' value="<?php echo getPoPwyCount('',date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>	
							</div>


							<div class="form-horizontal overflow-auto" id='dash-salesorderwrp'>
								<div>
									<label class='control-label label-sm text-left'>Sales Order</label>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Created</label>
											<input type='text' class='form-control text-box-count souploadedcount' value="<?php echo getSoUploadedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picklist</label>
											<input type='text' class='form-control text-box-count sopcklcreatedcount' value="<?php echo getSoPicklistCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picking</label>
											<input type='text' class='form-control text-box-count sopickingcreatedcount' value="<?php echo getSoPickingCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>	
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Issuance</label>
											<input type='text' class='form-control text-box-count sopcklissuedcount' value="<?php echo getSoPicklistIssuedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>								
							</div>

							<div class="form-horizontal overflow-auto" id='dash-transferorderwrp'>
								<div>
									<label class='control-label label-sm text-left'>Transfer Order</label>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Created</label>
											<input type='text' class='form-control text-box-count touploadedcount' value="<?php echo getToUploadedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picklist</label>
											<input type='text' class='form-control text-box-count topcklcreatedcount' value="<?php echo getToPicklistCount(date('l, d F Y'),date('l, d F Y'))?>"  disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picking</label>
											<input type='text' class='form-control text-box-count topickingcreatedcount' value="<?php echo getToPickingCount(date('l, d F Y'),date('l, d F Y'))?>"  disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Issuance</label>
											<input type='text' class='form-control text-box-count topcklissuedcount' value="<?php echo getToPicklistIssuedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>								
							</div>

							<div class="form-horizontal overflow-auto" id='dash-purchasereturnwrp'>
								<div>
									<label class='control-label label-sm text-left'>Purchase Return</label>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Created</label>
											<input type='text' class='form-control text-box-count pruploadedcount' value="<?php echo getProUploadedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picklist</label>
											<input type='text' class='form-control text-box-count prpcklcreatedcount' value="<?php echo getProPicklistCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Picking</label>
											<input type='text' class='form-control text-box-count prpickingcreatedcount' value="<?php echo getProPickingCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
											<label class='control-label text-left'>Issuance</label>
											<input type='text' class='form-control text-box-count prpcklissuedcount' value="<?php echo getProPicklistIssuedCount(date('l, d F Y'),date('l, d F Y'))?>" disabled>	
									</div>
								</div>
							</div>

							<div class="space-break"></div>
					
				
			</div>
		
		</div>

		<div class="row">
														
			<div class="col-md-9">
				
					<div class='tabpane-white margin-top-20 margin-bottom-10'>
						
						<ul class="nav nav-tabs">
							<li role="presentation" class="active" data-pane='#dashboard-pendingpopane' id='dashboard-pendingpotab'><a href="#">Pending PO for Inbound</a></li>
							<li role="presentation" data-pane='#dashboard-pendingsopane' id='dashboard-pendingsotab'><a href="#">Pending SO for Outbound</a></li>
						</ul>
						<div class='tab-panes'>

							<div class='pane active' id='dashboard-pendingpopane'> 
									<div class='col-md-12'>
										<div id='dash-pendingpopanel'>
											<table id='dash-pendingpotbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>
							 
							<div class='pane' id='dashboard-pendingsopane'> 
									<div class='col-md-12'>
										<div id='dash-pendingsopanel'>
											<table id='dash-pendingsotbl'>
												<tbody></tbody>

											</table>
										</div>
									</div>
							</div>
							 

						</div>

					</div>
					

			</div>											

		</div>
    

	</div>  
</div>


<script type="text/javascript">
	/**** INITIALIZED *******/
	$(document).ready(function(){
			var dashpane = '#dashtabpane';
			$(dashpane+' .datepicker').datepicker();

			$(dashpane+' .modal-dialog').draggable();
			$(dashpane+' .select2').select2();

			var date = new Date();
		    var dd = date.getDate();             
		    var mm = date.getMonth() + 1;
		    var yyyy = date.getFullYear();

		    var ToDate = mm + '/' + dd + '/' + yyyy;
		    var FromDate = mm + '/01/' + yyyy;
		    $('#txtToDate').datepicker('setDate', ToDate);
		    $('#txtFromDate').datepicker('setDate', FromDate);


			var datetoday = new Date();
        	$('.datepicker').datepicker({
        		dateFormat: 'DD,  dd MM yy',
        		maxDate: datetoday,
        		defaultDate: +7
        	});


        	$(dashpane+" .warehousedropdownselect").select2({
	            ajax: {
	                    url: "loadables/dropdown/user-assigned-locations.php?flag=1",
	                    dataType: 'json',
	                    delay: 100,
	                    data: function (params) {
	                        return {
	                            q: params.term // search term
	                        };
	                    },
	                    processResults: function (data) {
	                        return {
	                            results: data
	                        };
	                    },
	                    cache: true
	                },
	                minimumInputLength: 0,
	                width: '100%'
	    	});
        	 
        	$(dashpane+' #dash-physicalinventorytbl').flexigrid({
				url: `loadables/ajax/dashboard.physical-inventory.php?whseid=${$(dashpane+" .warehousedropdownselect").val()}`,
				dataType: 'json',
				colModel : [
						
						{display: 'Code', name : 'item.code', width : 180, sortable : true, align: 'left'},
						{display: 'Name', name : 'item.name', width : 300, sortable : true, align: 'left'},
						
						{display: 'Base Unit', name : 'unit_of_measure.description', width : 150, sortable : true, align: 'left'},
						{display: 'Base Quantity', name : 'baseqty', width : 150, sortable : true, align: 'right'},
						{display: 'Utilized Pallets', name : 'utilizedbincount', width : 150, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'Code', name : 'item.code', isdefault: true},
						{display: 'Name', name : 'item.name'}
						
				],
				sortname: "item.code",
				sortorder: "asc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});

			

        	$(dashpane+' #dash-nrlyexpitemstbl').flexigrid({
				url: `loadables/ajax/dashboard.nearlyexpiryitems.php`,
				dataType: 'json',
				colModel : [
						
						{display: 'AX Code', name : 'i.code', width : 80, sortable : true, align: 'left'},
						{display: 'MMS Code', name : 'i.ax_code', width : 80, sortable : true, align: 'left'},
						{display: 'Item Descripiton', name : 'i.name', width : 160, sortable : true, align: 'left'}, 
						{display: 'Base Qty', name : 'pi.base_quantity', width : 60, sortable : true, align: 'right'},
						{display: 'Expiry', name : 'pi.expiry_date', width : 80, hide:false, sortable : true, align: 'left'},
						{display: 'Lot Number', name : 'pi.lot_number', width : 80, hide:false, sortable : true, align: 'left'},
						{display: 'Location', name : 'l.code', width : 80, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'Code', name : 'i.code', isdefault: true},
						{display: 'Name', name : 'i.name'}
						
				],
				sortname: "i.name",
				sortorder: "asc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});

			

        	$(dashpane+' #dash-pendingdoc4rcvtbl').flexigrid({
				url: 'loadables/ajax/dashboard.pending4receiving.php',
				dataType: 'json',
				colModel : [
						
						{display: 'ISS No.', name : 'ih.transaction_number', width : 128, sortable : true, align: 'left'},
						{display: 'TO No.', name : 'ih.reference_number', width : 128, sortable : true, align: 'left'},
						{display: 'Origin Whse/Store', name : 'ow.description', width : 160, sortable : true, align: 'left'},						
						{display: 'DR No.', name : 'ih.dr_number', width : 128, sortable : true, align: 'left'},
						{display: 'Dispatched Date', name : 'ih.dispatched_date', width : 100, sortable : true, align: 'right'},
						{display: 'Dispatched By', name : 'ih.dispatched_by', width : 100, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'ISS No.', name : 'ih.transaction_number', isdefault: true},
						{display: 'TO No.', name : 'ih.reference_number'}, //
						{display: 'Origin Warehouse', name : 'ow.description'}
						
				],
				sortname: "ih.transaction_number",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});


        	$(dashpane+' #dash-pendingdoc2outtbl').flexigrid({
				url: 'loadables/ajax/dashboard.pending2out.php',
				dataType: 'json',
				colModel : [
						 
						{display: 'TO No.', name : 'toh.transaction_number', width : 128, sortable : true, align: 'left'},
						{display: 'Dest Whse/Store', name : 'dw.description', width : 160, sortable : true, align: 'left'},						
						{display: 'Reference No.', name : 'toh.reference', width : 128, sortable : true, align: 'left'},
						{display: 'Document Date', name : 'toh.document_date', width : 100, sortable : true, align: 'right'},
						{display: 'Created By', name : 'toh.created_by', width : 100, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'TO No.', name : 'toh.transaction_number', isdefault: true},
						{display: 'Reference', name : 'toh.reference'}, //
						{display: 'Destination Warehouse/Store', name : 'dw.description'}
						
				],
				sortname: "transaction_number",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});

			
        	$(dashpane+' #dash-pendingpotbl').flexigrid({
				url: 'loadables/ajax/dashboard.pendingpo4inbound.php',
				dataType: 'json',
				colModel : [
						 
						{display: 'PO No.', name : 'poh.transaction_number', width : 128, sortable : true, align: 'left'},
						{display: 'Status', name : 'poh.status', width : 128, sortable : true, align: 'left'},
						{display: 'Reference #', name : 'poh.reference', width : 160, sortable : true, align: 'left'}, 
						{display: 'Client', name : 'fc.description', width : 128, sortable : true, align: 'left'},
						{display: 'Supplier', name : 's.description', width : 160, sortable : true, align: 'left'},
						{display: 'Active Receipt', name : 'srh.transaction_number', width : 100, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'poh.created_date', width : 100, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'PO No.', name : 'poh.transaction_number', isdefault:true},
						{display: 'Status', name : 'poh.status'},
						{display: 'Reference #', name : 'poh.reference'},						
						{display: 'Supplier', name : 's.description'},
						{display: 'Client', name : 'fc.description'},
						{display: 'Active Receipt', name : 'srh.transaction_number'},
						{display: 'Created Date', name : 'poh.created_date'}
						
				],
				sortname: "transaction_number",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});

			
			
        	$(dashpane+' #dash-pendingsotbl').flexigrid({
				url: 'loadables/ajax/dashboard.pendingso4outbound.php',
				dataType: 'json',
				colModel : [
						 
						{display: 'SO No.', name : 'poh.transaction_number', width : 128, sortable : true, align: 'left'},
						{display: 'Status', name : 'poh.status', width : 128, sortable : true, align: 'left'},
						{display: 'Reference #', name : 'poh.reference', width : 160, sortable : true, align: 'left'},
						{display: 'Client', name : 'fc.description', width : 128, sortable : true, align: 'left'},
						{display: 'Customer', name : 'c.description', width : 160, sortable : true, align: 'left'},
						{display: 'Active Picklist', name : 'srh.transaction_number', width : 100, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'poh.created_date', width : 100, hide:false, sortable : true, align: 'left'}

				],
				buttons : [
						{separator: true}

						
				],
				searchitems : [
						{display: 'SO No.', name : 'poh.transaction_number', isdefault:true},
						{display: 'Status', name : 'poh.status' },
						{display: 'Reference #', name : 'poh.reference' },
						{display: 'Client', name : 'fc.description' },
						{display: 'Customer', name : 'c.description'},
						{display: 'Active Picklist', name : 'srh.transaction_number' },
						{display: 'Created Date', name : 'poh.created_date' }
				],
				sortname: "transaction_number",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 300,
				singleSelect: false,
				disableSelect: true
			});


			

	});
	



</script>