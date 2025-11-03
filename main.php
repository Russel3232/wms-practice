<?php
	include("../config/connection.php");
	include("../config/checklogin.php");
	if(isset($_SESSION['MdjKeoIdhk'])){
		$viewtobeloaded = $_SESSION['MdjKeoIdhk'];
	}else{
		$viewtobeloaded = "";
	}

	

?>

<!doctype html>
<html>

	<head>

		<title>Warehouse Management System</title>
		<meta name="viewport" content="width=device-width, initial-scale=.7">
		<link rel="stylesheet" href="../css/bootstrap.css">



		<link rel="stylesheet" href="../css/main.css">
		<!--<link href='https://fonts.googleapis.com/css?family=Pacifico|Open+Sans|Lato:400,700,300,900|Carter+One' rel='stylesheet' type='text/css'>-->
		<!--<link rel="shortcut icon" href="../resources/icon.ico">-->

		<!--<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>-->

		<!--<link rel="stylesheet" href="../resources/tags/dist/bootstrap-tagsinput.css">-->

		<link href="../css/fontAwesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="../css/animate.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src='../js/functions.js'></script>

		<!-- FOR DROPDOWN -->
		<link href="../resources/select/dist/css/select2.css" rel="stylesheet" />


		<!-- DIALOG, CONFIRM, ALERTS-->
		<link rel="stylesheet" type="text/css" href="../resources/dialog/jquery-confirm.css" />

		<!--DATE PICKER -->
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.css">
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.theme.css">
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.structure.css">
		<!--<link rel="stylesheet" href="../resources/jquery-interactions/jquery-ui2.css">-->

		<!-- DATATABLES -->
		<link rel="stylesheet" href="../resources/datatables/media/css/dataTables.bootstrap.css">

		<!-- COLOR PICKER -->
		<link href="../resources/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

		<!-- FLEXIGRID -->
		<link rel="stylesheet" href="../resources/flexigrid/css/flexigrid.css">
		<link rel="stylesheet" href="../resources/flexigrid/css/kaye_custom.css">
		<link rel="stylesheet" href="../resources/flexigrid/custom.css">

		<link rel="stylesheet" href="../resources/timepicker-addon/src/jquery-ui-timepicker-addon.css">


		<link rel="stylesheet" href="../css/bootstrap-toggle.css">

		<!-- TAGS -->
		<link rel="stylesheet" href="../resources/tags/bootstrap-tagsinput.css">
		<link rel="stylesheet" href="../resources/tags/custom.css">

		<!-- BOOTSTRAP TABLE -->
		<link rel="stylesheet" href="../resources/bootstrap-table/dist/bootstrap-table.css">

		<!-- TREE -->
		<link rel="stylesheet" href="../resources/jstree/dist/themes/default/style.css">











		<!-- GRAPHS -->

		<!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<link rel="stylesheet" href="../resources/chartist/chartist.css">-->






	</head>

	<body style='background-color: #EAEFF2;' tabindex='1' class='gray-theme'>
		<div id='loading-img'
			style='width:100%; height:100%; position:absolute; z-index:1000000000; background-color:rgba(255, 255, 255, 0);'>
			<img src="../resources/img/loading.gif" height='180px'
				style='position:fixed; z-index:10000; top:35%; left:43%;'>
		</div>
		<!-- ********************************* MOBILE NAV *********************************************************************-->
		<div class="visible-xs visible-sm">
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="container">

					<div class="navbar-header">
						<div class="navbar-brand">WMS</div>
						<button class="navbar-toggle" data-toggle="collapse" data-target=".collapseThisNav">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse collapseThisNav">
						<ul class="nav navbar-nav">
							<li class='nosubmenu' data-file='dashboard.php'><a>Dashboard</a></li>

							<li class="dropdown hidden" data-id='system-section'>
								<a class="dropdown-toggle" data-toggle="dropdown">System &nbsp;<i
										class='fa fa-caret-down'></i></a>
								<ul class="dropdown-menu">
									<li class='nosubmenu hidden' data-file='system/configuration.php'
										data-id='configuration' data-js='configuration.js'>
										<a>Configuration</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/user.php' data-id='user'
										data-js='user.js'>
										<a>User</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/user-group.php'
										data-js='user-group.js' data-id='usergroup'>
										<a>User Group</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/approver.php' data-id='approver'
										data-js='approver.js'>
										<a>Approver</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/transaction-type.php'
										data-js='transaction-type.js' data-id='transaction'>
										<a>Transaction Type</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/system-log.php'
										data-js='system-log.js' data-id='transaction'>
										<a>System Log</a>
									</li>
									<li class='nosubmenu hidden' data-file='system/department.php'
										data-js='department.js' data-id='department-menu'>
										<a>Department</a>
									</li>
									<li class='nosubmenu hidden' data-file='inventory/stock-receipt.php'
										data-js='stock-receipt.js' data-id='stockreceipt-menu'>
										<a>Stock Receipt</a>
									</li>

								</ul>
							</li>
							<li class="dropdown hidden" data-id='maintenance-section'>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Maintenance&nbsp; <span
										class="caret"></span></a>
								<ul class="dropdown-menu">
									<li class='nosubmenu hidden' data-file='maintenance/items.php' data-js='item.js'
										data-id='items'>
										<a>Item</a>
									</li>
									<li class='nosubmenu hidden' data-file='maintenance/supplier.php'
										data-js='supplier.js' data-id='supplier'>
										<a>Supplier</a>
									</li>
									<li class='nosubmenu hidden' data-file='maintenance/terms-of-payment.php'
										data-js='terms-of-payment.js' data-id='terms'>
										<a>Term of Payment</a>
									</li>
									<li class='nosubmenu hidden' data-file='maintenance/section-department.php'
										data-js='section-department.js' data-id='department'>
										<a>Section/Department</a>
									</li>

								</ul>
							</li>
							<li class="dropdown hidden" data-id='transaction-section'>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Transaction&nbsp;<span
										class="caret"></span></a>
								<ul class="dropdown-menu">
									<li class='nosubmenu hidden' data-file='transaction/purchase-requisition.php'
										data-js='purchase-requisition.js' data-id='pr'>
										<a>Purchase Requisition</a>
									</li>
									<li class='nosubmenu hidden' data-file='transaction/purchase-order.php'
										data-js='purchase-order.js' data-id='po'>
										<a>Purchase Order</a>
									</li>
									<li class='nosubmenu hidden' data-file='transaction/receiving.php'
										data-js='receiving.js' data-id='receiving'>
										<a>Receiving</a>
									</li>

								</ul>
							</li>
							<li class="dropdown hidden" data-id='reports-section'>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Reports&nbsp; <span
										class="caret"></span></a>
								<ul class="dropdown-menu">
									<li class='nosubmenu hidden' data-file='reports/pr-summary.php'
										data-js='pr-summary.js' data-id='prsumm'>
										<a>Purchase Request Summary</a>
									</li>
									<li class='nosubmenu hidden' data-file='reports/po-summary.php'
										data-js='po-summary.js' data-id='posumm'>
										<a>Purchase Order Summary</a>
									</li>
									<li class='nosubmenu hidden' data-file='reports/rcv-summary.php'
										data-js='rcv-summary.js' data-id='rcvsumm'>
										<a>Receiving Summary</a>
									</li>
								</ul>
							</li>
							<li><a href='logout.php'>Logout</a></li>





						</ul>
					</div>

				</div>
			</div>
		</div>
		<!-- ********************************* END MOBILE NAV ******************************************************************-->





		<!-- ************************************ SIDEBAR NAV ****************************************************************** -->
		<div id="sidebar">
			<div id='sidebar-panel'>
				<div id="sidebar-nav">
					<div class="sidebarlogo">
						<a href=''><img class='img img-responsive' src="../resources/logo.png"></a>
					</div>
					<div class='nosubmenu active' data-title='Dashboard' data-file='dashboard.php'
						data-js='dashboard.js' id='dash'>
						<img class='img' src="../resources/icons/main-home.png"><span>Dashboard</span>
					</div>
					<div class='withsubmenu' id='system-section'>
						<img class='img' src="../resources/icons/main-system.png">System
					</div>
					<div class="submenu">
						<div data-title='Configuration' data-file='system/configuration.php' id='configuration-menu'
							data-js='configuration.js'>
							<img class='img' src="../resources/img/folder_64.png">Configuration
						</div>
						<div data-title='User' data-file='system/user.php' id='user-menu' data-js='user.js'>
							<img class='img' src="../resources/img/folder_64.png">User
						</div>
						<div data-title='User Group' data-file='system/user-group.php' id='usergroup-menu'
							data-js='user-group.js'>
							<img class='img' src="../resources/img/folder_64.png">User Group
						</div>
						<div data-title='Transaction Type' data-file='system/transaction-type.php'
							data-js='transaction-type.js' id='transactiontype-menu'>
							<img class='img' src="../resources/img/folder_64.png">Transaction Type
						</div>
						<div data-title='User Defined Fields' data-file='system/user-defined-fields.php'
							id='userdefinedfields-menu' data-js='user-defined-fields.js'>
							<img class='img' src="../resources/img/folder_64.png">User Defined Fields
						</div>
						<div data-title='System Log' data-file='system/system-log.php' data-js='system-log.js'
							id='systemlog-menu'>
							<img class='img' src="../resources/img/folder_64.png">System Log
						</div>
						<div data-title='Barcode Printing' data-file='system/barcode-printing.php'
							data-js='barcode-printing.js' id='barcodeprinting-menu'>
							<img class='img' src="../resources/img/folder_64.png">Barcode Printing
						</div>
					</div>
					<div class='withsubmenu' id='maintenance-section'><img class='img'
							src="../resources/icons/main-maintenance.png">Maintenance</div>
					<div class="submenu">
						<div data-title='Adjustment Reason' data-file='maintenance/adjustment-reason.php'
							id='adjustmentreason-menu' data-js='adjustment-reason.js'>
							<img class='img' src="../resources/img/folder_64.png">Adjustment Reason
						</div>
						<div data-title='Area' data-file='maintenance/area.php' id='area-menu' data-js='area.js'>
							<img class='img' src="../resources/img/folder_64.png">Area
						</div>
						<div data-title='Bin Location' data-file='maintenance/bin-location.php' id='binlocation-menu'
							data-js='bin-location.js'>
							<img class='img' src="../resources/img/folder_64.png">Bin Location
						</div>
						<div data-title='Brand' data-file='maintenance/brand.php' id='brand-menu' data-js='brand.js'>
							<img class='img' src="../resources/img/folder_64.png">Brand
						</div>
						<div data-title='Carrier/Trucker' data-file='maintenance/trucking.php' id='trucking-menu'
							data-js='trucking.js'>
							<img class='img' src="../resources/img/folder_64.png">Carrier/Trucker
						</div>
						<div data-title='Carrier/Trucker Vehicle' data-file='maintenance/trucking-vehicle.php'
							id='truckingvehicle-menu' data-js='trucking-vehicle.js'>
							<img class='img' src="../resources/img/folder_64.png">Carrier/Trucker Vehicle
						</div>
						<div data-title='Category' data-file='maintenance/category.php' id='category-menu'
							data-js='category.js'>
							<img class='img' src="../resources/img/folder_64.png">Category
						</div>
						<div data-title='Charges' data-file='maintenance/charges.php' id='charges-menu'
							data-js='charges.js'>
							<img class='img' src="../resources/img/folder_64.png">Charges
						</div>
						<div data-title='Client' data-file='maintenance/for-client.php' id='forclient-menu'
							data-js='for-client.js'>
							<img class='img' src="../resources/img/folder_64.png">Client
						</div>
						<div data-title='Currency' data-file='maintenance/currency.php' id='currency-menu'
							data-js='currency.js'>
							<img class='img' src="../resources/img/folder_64.png">Currency
						</div>
						<div data-title='Customer' data-file='maintenance/customer.php' id='customer-menu'
							data-js='customer.js'>
							<img class='img' src="../resources/img/folder_64.png">Customer
						</div>
						<div data-title='Customer Group' data-file='maintenance/client-group.php' id='clientgroup-menu'
							data-js='client-group.js'>
							<img class='img' src="../resources/img/folder_64.png">Customer Group
						</div>
						<div data-title='Dispostion' data-file='maintenance/disposition.php' id='disposition-menu'
							data-js='disposition.js'>
							<img class='img' src="../resources/img/folder_64.png">Disposition
						</div>
						<div data-title='Handling Instruction' data-file='maintenance/handling-instruction.php'
							id='handlinginstruction-menu' data-js='handling-instruction.js'>
							<img class='img' src="../resources/img/folder_64.png">Handling Instruction
						</div>
						<div data-title='Item' data-file='maintenance/item.php' id='item-menu' data-js='item.js'>
							<img class='img' src="../resources/img/folder_64.png">Item
						</div>
						<div data-title='Mode of Transport' data-file='maintenance/mode-of-transport.php'
							id='modeoftransport-menu' data-js='mode-of-transport.js'>
							<img class='img' src="../resources/img/folder_64.png">Mode of Transport
						</div>
						<div data-title='Origin' data-file='maintenance/origin.php' id='origin-menu'
							data-js='origin.js'>
							<img class='img' src="../resources/img/folder_64.png">Origin
						</div>
						<div data-title='Packaging' data-file='maintenance/packaging.php' id='packaging-menu'
							data-js='packaging.js'>
							<img class='img' src="../resources/img/folder_64.png">Packaging
						</div>
						<div data-title='Pallet' data-file='maintenance/pallet.php' id='pallet-menu'
							data-js='pallet.js'>
							<img class='img' src="../resources/img/folder_64.png">Pallet
						</div>
						<div data-title='Payment Terms' data-file='maintenance/terms.php' id='terms-menu'
							data-js='terms.js'>
							<img class='img' src="../resources/img/folder_64.png">Payment Terms
						</div>
						<div data-title='Picking Group' data-file='maintenance/picking-group.php' id='pickinggroup-menu'
							data-js='picking-group.js'>
							<img class='img' src="../resources/img/folder_64.png">Picking Group
						</div>
						<div data-title='Reason' data-file='maintenance/reason.php' id='reason-menu'
							data-js='reason.js'>
							<img class='img' src="../resources/img/folder_64.png">Reason
						</div>
						<div data-title='Route' data-file='maintenance/route.php' id='route-menu' data-js='route.js'>
							<img class='img' src="../resources/img/folder_64.png">Route
						</div>
						<div data-title='Sales Rep' data-file='maintenance/sales-representative.php'
							id='salesrepresentative-menu' data-js='sales-representative.js'>
							<img class='img' src="../resources/img/folder_64.png">Sales Rep
						</div>
						<div data-title='Shipment Terms' data-file='maintenance/shipment-terms.php'
							id='shipmentterms-menu' data-js='shipment-terms.js'>
							<img class='img' src="../resources/img/folder_64.png">Shipment Terms
						</div>
						<div data-title='Shipping Group' data-file='maintenance/shipping-group.php'
							id='shippinggroup-menu' data-js='shipping-group.js'>
							<img class='img' src="../resources/img/folder_64.png">Shipping Group
						</div>
						<div data-title='SKU Type' data-file='maintenance/sku-type.php' id='skutype-menu'
							data-js='sku-type.js'>
							<img class='img' src="../resources/img/folder_64.png">SKU Type
						</div>
						<div data-title='Subcategory 1' data-file='maintenance/subcategory1.php' id='subcategory1-menu'
							data-js='subcategory1.js'>
							<img class='img' src="../resources/img/folder_64.png">Subcategory 1
						</div>
						<div data-title='Subcategory 2' data-file='maintenance/subcategory2.php' id='subcategory2-menu'
							data-js='subcategory2.js'>
							<img class='img' src="../resources/img/folder_64.png">Subcategory 2
						</div>
						<div data-title='Supplier' data-file='maintenance/supplier.php' id='supplier-menu'
							data-js='supplier.js'>
							<img class='img' src="../resources/img/folder_64.png">Supplier
						</div>
						<div data-title='Supplier Group' data-file='maintenance/supplier-group.php'
							id='suppliergroup-menu' data-js='supplier-group.js'>
							<img class='img' src="../resources/img/folder_64.png">Supplier Group
						</div>

						<div data-title='Unit of Measure' data-file='maintenance/unit-of-measure.php'
							id='unitofmeasure-menu' data-js='unit-of-measure.js'>
							<img class='img' src="../resources/img/folder_64.png">Unit of Measure
						</div>
						<div data-title='Vehicle Type' data-file='maintenance/vehicle-type.php' id='vehicletype-menu'
							data-js='vehicle-type.js'>
							<img class='img' src="../resources/img/folder_64.png">Vehicle Type
						</div>
						<div data-title='Warehouse' data-file='maintenance/location.php' id='location-menu'
							data-js='location.js'>
							<img class='img' src="../resources/img/folder_64.png">Warehouse
						</div>
						<div data-title='Zone' data-file='maintenance/zone.php' id='zone-menu' data-js='zone.js'>
							<img class='img' src="../resources/img/folder_64.png">Zone
						</div>


					</div>
					<div class='withsubmenu' id='transactions-section'><img class='img'
							src="../resources/icons/main-purchases.png">Transactions</div>
					<div class="submenu">

						<div data-title='Purchase Order' data-file='transactions/purchase-order.php'
							id='purchaseorder-menu' data-js='purchase-order.js'>
							<img class='img' src="../resources/img/folder_64.png">Purchase Order
						</div>
						<div data-title='Stock Receipt' data-file='transactions/stock-receipt.php'
							id='stockreceipt-menu' data-js='stock-receipt.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Receipt
						</div>
						<div data-title='Putaway' data-file='transactions/putaway.php' id='putaway-menu'
							data-js='putaway.js'>
							<img class='img' src="../resources/img/folder_64.png">Putaway
						</div>
						<div data-title='Sales Order' data-file='transactions/sales-order.php' id='salesorder-menu'
							data-js='sales-order.js'>
							<img class='img' src="../resources/img/folder_64.png">Sales Order
						</div>
						<div data-title='Transfer Order' data-file='transactions/transfer-order.php'
							id='transferorder-menu' data-js='transfer-order.js'>
							<img class='img' src="../resources/img/folder_64.png">Transfer Order
						</div>
						<div data-title='Return to Vendor' data-file='transactions/purchase-return.php'
							id='purchasereturn-menu' data-js='purchase-return.js'>
							<img class='img' src="../resources/img/folder_64.png">Return to Vendor
						</div>
						<div data-title='Stock Withdrawal' data-file='transactions/stock-withdrawal.php'
							id='stockwithdrawal-menu' data-js='stock-withdrawal.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Withdrawal
						</div>
						<div data-title='Picklist' data-file='transactions/picklist.php' id='picklist-menu'
							data-js='picklist.js'>
							<img class='img' src="../resources/img/folder_64.png">Picklist
						</div>
						<div data-title='Picking' data-file='transactions/picking.php' id='picking-menu'
							data-js='picking.js'>
							<img class='img' src="../resources/img/folder_64.png">Picking
						</div>
						<div data-title='Stock Issuance' data-file='transactions/stock-issuance.php'
							id='stockissuance-menu' data-js='stock-issuance.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Issuance
						</div>
						<div data-title='Bin Transfer' data-file='transactions/bin-transfer.php' id='bintransfer-menu'
							data-js='bin-transfer.js'>
							<img class='img' src="../resources/img/folder_64.png">Bin Transfer
						</div>
						<div data-title='Cycle Count' data-file='transactions/cycle-count.php' id='cyclecount-menu'
							data-js='cycle-count.js'>
							<img class='img' src="../resources/img/folder_64.png">Cycle Count
						</div>
						<!--<div  data-title='Inventory Management' data-file='transactions/inventory-management.php' id='inventorymanagement-menu' data-js='inventory-management.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Inventory Management
				   				</div>-->
						<div data-title='Stock Adjustment' data-file='transactions/stock-adjustment.php'
							id='stockadjustment-menu' data-js='stock-adjustment.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Adjustment
						</div>
						<!--<div  data-title='Cycle Count' data-file='transactions/cycle-count.php' id='cyclecount-menu' data-js='cycle-count.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Cycle Count
				   				</div>-->
						<!-- <div data-title='Purchase Order Monitoring'
							data-file='transactions/purchase-order-monitoring.php' id='purchaseordermonitoring-menu'
							data-js='purchase-order-monitoring.js'>
							<img class='img' src="../resources/img/folder_64.png">Purchase Order Monitoring
						</div> -->
						<!-- <div data-title='Costing' data-file='transactions/costing.php' id='costing-menu'
							data-js='costing.js'>
							<img class='img' src="../resources/img/folder_64.png">Costing
						</div> -->
						<!-- <div data-title='Reclass' data-file='transactions/reclass.php' id='reclass-menu'
							data-js='reclass.js'>
							<img class='img' src="../resources/img/folder_64.png">Reclass
						</div> -->
						<div data-title='Inventory Management' data-file='transactions/inventory-management.php'
							id='inventorymanagement-menu' data-js='inventory-management.js'>
							<img class='img' src="../resources/img/folder_64.png">Inventory Management
						</div>

						<!--

									<div  data-title='Load Planning' data-file='transactions/load-planning.php' id='loadplanning-menu' data-js='load-planning.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Load Planning
									</div>
									<div  data-title='Dispatch' data-file='transactions/dispatch.php' id='dispatch-menu' data-js='dispatch.js'>
										<img class='img' src="../resources/img/folder_64.png">Dispatch
									</div>
									<div data-title='Store Sales Uploading' data-file='transactions/store-sales-uploading.php' id='storesalesuploading-menu' data-js='store-sales-uploading.js'>
										<img class='img' src="../resources/img/folder_64.png">Store Sales Uploading
									</div>
									
								-->



					</div>


					<!-- <div class='withsubmenu' id='crossdock-section'><img class='img' src="../resources/icons/main-purchases.png">Crossdock</div>
				   			<div class="submenu">
				   				<div  data-title='CD Purchase Order' data-file='crossdock/cd-purchase-order.php' id='cdpurchaseorder-menu' data-js='cd-purchase-order.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Purchase Order
				   				</div>
				   				<div  data-title='CD TRF' data-file='crossdock/cd-trf.php' id='cdtrf-menu' data-js='cd-trf.js'>
				   					<img class='img' src="../resources/img/folder_64.png">TRF
				   				</div>
				   				<div  data-title='CD Receiving' data-file='crossdock/cd-receiving.php' id='cdreceiving-menu' data-js='cd-receiving.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Receiving
				   				</div>
				   				<div  data-title='CD Inventory' data-file='crossdock/cd-inventory.php' id='cdinventory-menu' data-js='cd-inventory.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Inventory
				   				</div>
				   				<div  data-title='CD Picklist' data-file='crossdock/cd-picklist.php' id='cdpicklist-menu' data-js='cd-picklist.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Picklist
				   				</div>
				   				<div  data-title='CD Load Plan' data-file='crossdock/cd-load-plan.php' id='cdloadplan-menu' data-js='cd-load-plan.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Load Plan
				   				</div>
				   				<div  data-title='CD Shipment' data-file='crossdock/cd-shipment.php' id='cdshipment-menu' data-js='cd-shipment.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Shipment
				   				</div>
				   				<div  data-title='CD Bin Assignment' data-file='crossdock/cd-bin-location.php' id='cdbinlocation-menu' data-js='cd-bin-location.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Bin Assignment
				   				</div>
				   				<div  data-title='CD PO Summary Report' data-file='crossdock/cd-posummary-report.php' id='cdposummaryreport-menu' data-js='cd-posummary-report.js'>
				   					<img class='img' src="../resources/img/folder_64.png">PO Summary Report
				   				</div>
				   			</div> -->

					<div class='withsubmenu' id='reports-inv-section'><img class='img'
							src="../resources/icons/main-report.png">Inventory Reports



					</div>
					<div class="submenu">
						<div data-title='Item Balance' data-file='reports/item-balance.php' id='itembalance-menu'
							data-js='item-balance.js'>
							<img class='img' src="../resources/img/folder_64.png">Item Balance
						</div>
						<div data-title='Stock Card' data-file='reports/stock-card.php' id='stockcard-menu'
							data-js='stock-card.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Card
						</div>
						<div data-title='Empty Bins Report' data-file='reports/empty-bins-report.php'
							id='emptybinreport-menu' data-js='stock-movement-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Empty Bins Report
						</div>
						<!-- <div data-title='Stock Movement Report' data-file='reports/stock-movement-report.php'
							id='stockmovementreport-menu' data-js='stock-movement-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Movement Report
						</div> -->
						<!-- <div data-title='Inventory Detailed Report' data-file='reports/inventory-detailed-report.php'
							id='inventorydetailedreport-menu' data-js='inventory-detailed-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Inventory Detailed Report
						</div> -->

						<div data-title='Inventory Ageing Report' data-file='reports/inventory-ageing-report.php'
							id='inventoryageingreport-menu' data-js='inventory-ageing-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Inventory Ageing Report
						</div>
						<div data-title='Transaction Report' data-file='reports/transaction-report.php'
							id='transactionreport-menu' data-js='transaction-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Transaction Report
						</div>
						<div data-title='Inventory Summary Report' data-file='reports/inventory-summary-report.php'
							id='inventorysummaryreport-menu' data-js='inventory-summary-report.js'>
							<img class='img' src="../resources/img/folder_64.png">Inventory Summary Report
						</div>

						<!-- <div data-title='Pallet Utilization Summary' data-file='reports/pallet-utilization-summary.php'
							id='palletutilizationsummary-menu' data-js='pallet-utilization-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Pallet Utilization Summary
						</div> -->
						<div data-title='Item Masterlist' data-file='reports/item-masterlist.php'
							id='itemmasterlist-menu' data-js='item-masterlist.js'>
							<img class='img' src="../resources/img/folder_64.png">Item Masterlist
						</div>

						<!--<div  data-title='Load Planning Report' data-file='reports/load-planning-report.php' id='loadplanningreport-menu' data-js='load-planning-report.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Load Planning Report
				   				</div>-->
						<div data-title='Purchase Order Summary' data-file='reports/purchase-order-summary.php'
							id='purchaseordersummaryreport-menu' data-js='purchase-order-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Purchase Order Summary
						</div>
						<div data-title='Stock Receipt Summary' data-file='reports/stock-receipt-summary.php'
							id='stockreceiptsummaryreport-menu' data-js='stock-receipt-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Stock Receipt Summary
						</div>
						<div data-title='Transfer Order Summary' data-file='reports/transfer-order-summary.php'
							id='transferordersummaryreport-menu' data-js='transfer-order-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Transfer Order Summary
						</div>


						<!--<div  data-title='Putaway Summary' data-file='reports/putaway-summary.php' id='putawaysummaryreport-menu' data-js='putaway-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Putaway Summary 
				   				</div>
				   				<div  data-title='Picklist Summary' data-file='reports/picklist-summary.php' id='picklistsummaryreport-menu' data-js='picklist-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Picklist Summary 
				   				</div>
				   				<div  data-title='Picking Summary' data-file='reports/picking-summary.php' id='pickingsummaryreport-menu' data-js='picklist-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Picking Summary 
				   				</div>-->
						<!-- <div data-title='Purchase Return Summary' data-file='reports/purchase-return-summary.php'
							id='purchasereturnsummaryreport-menu' data-js='purchase-return-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Purchase Return Summary
						</div>
						<div data-title='Sales Order Summary' data-file='reports/sales-order-summary.php'
							id='salesordersummaryreport-menu' data-js='sales-order-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Sales Order Summary
						</div>
						<div data-title='Issuance Summary' data-file='reports/issuance-summary.php'
							id='issuancesummaryreport-menu' data-js='issuance-summary.js'>
							<img class='img' src="../resources/img/folder_64.png">Withdrawal Summary
						</div> -->
						<!--<div  data-title='Purchase Order Summary' data-file='reports/purchase-order-summary.php' id='purchaseordersummary-menu' data-js='purchase-order-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Purchase Order Summary
				   				</div>
				   				<div  data-title='Transfer Order Summary' data-file='reports/transfer-order-summary.php' id='transferordersummary-menu' data-js='transfer-order-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Transfer Order Summary
				   				</div>
				   				<div  data-title='Sales Order Summary' data-file='reports/sales-order-summary.php' id='salesordersummary-menu' data-js='sales-order-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Sales Order Summary
				   				</div>
				   				<div  data-title='Purchase Return Summary' data-file='reports/purchase-return-summary.php' id='purchasereturnsummary-menu' data-js='purchase-return-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Purchase Return Summary
				   				</div>
				   				<div  data-title='Stock Receipt Summary' data-file='reports/stock-receipt-summary.php' id='stockreceiptsummary-menu' data-js='stock-receipt-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Stock Receipt Summary
				   				</div>
				   				<div  data-title='Putaway Summary' data-file='reports/putaway-summary.php' id='putawaysummary-menu' data-js='putaway-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Putaway Summary
				   				</div>
				   				<div  data-title='Picklist Summary' data-file='reports/picklist-summary.php' id='picklistsummary-menu' data-js='picklist-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Picklist Summary
				   				</div>
				   				<div  data-title='Picking Summary' data-file='reports/picking-summary.php' id='pickingsummary-menu' data-js='picking-summary.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Picking Summary
				   				</div>-->




					</div>

				</div>
				<div class='text-center' id='poweredby'><span class='systembrand'
						style="font-size: 9px; font-weight: 600;">FILIKOS WAREHOUSE MANAGEMENT v3.0</span><br>Designed
					and Developed by<br><a href="https://www.tpincorporated.com" target="_blank">Turningpoint Inc.</a>
				</div>
			</div>
		</div>




		<!-- ************************************END SIDEBAR NAV ****************************************************************** -->





		<!-- ************************************************ HEADER ******************************************** -->
		<div class="topheader">
			<div class='user-header hidden-xs hidden-sm'>
				<div class="user-header-inner">
					<i class="fa fa-user fa-2x" style='padding-right:5px; font-size:1.3em'></i>
					<span>
						Welcome,
						<span class='account-settings-link pointer' data-title='User Settings'
							data-js='user-settings.js' data-file='user-settings.php' id='usersettings'
							title='User Settings'><?php echo ucwords(strtolower(@$_SESSION['fnameWMS'])); ?>
						</span>!&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<?php echo date('l, F d, Y') ?>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<span class='pointer kainos-wms-about-link' data-toggle='modal'
							href='#systemaboutmodal'>About</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a class='signout' href="logout.php">
							<i class="fa fa-sign-out fa-2x" style='padding-right:5px; font-size:1.2em'></i>Logout
						</a>
					</span>
				</div>
			</div>
		</div>



		<!-- ************************************************ HEADER ******************************************** -->





		<!-- ******************************************* CONTENT ****************************************************************-->

		<div class='content' id='content' style='overflow:auto;'>
			<div class="content-tab-pane">
				<div class="content-tabs-wrapper">
					<ul class='content-tabs'>

					</ul>
				</div>
				<div class='content-pane-wrapper'>
					<iframe name="appdownloadframe" class='hidden' height="0px" width="0px"></iframe>
				</div>
			</div>

		</div>

		<!-- ************************************ END OF CONTENT ********************************************************************-->

		<div class="modal fade" id="systemaboutmodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class='page-title'>
							About
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
					</div>
					<div class="modal-body">
						<div class="col-sm-4">
							<img src="../resources/logo.png" class='img-responsive'><br>
						</div>
						<div class="col-sm-8">
							<span style='font-size:18px'>FILIKOS WAREHOUSE MANAGEMENT SYSTEM</span><br>
							Version 3.0.0 (For Windows) <br>
							Developed by <a href="http://tpincorporated.com">Turningpoint Incorporated</a><br>
							Copyright &copy; <?php echo date('Y'); ?>. All Rights Reserved.


							<br></br>
							This software is protected by copyright law. Unauthorized reproduction or
							distribution of this application, or any portion of it, may result in severe
							civil and criminal penalties, and will be prosecuted to the maximum extent possible
							under law.

						</div>
					</div>
					<div class="modal-footer">
						<br>
					</div>
				</div>
			</div>
		</div>





		<div class="modal fade" id="fieldeditmodal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<div class='page-title'>
							<span class='fieldeditmodal-title'></span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
					</div>
					<div class="modal-body">
						<div class='form-horizontal'>
							<input type='hidden' class='fieldeditmodal-module'>
							<input type='hidden' class='fieldeditmodal-table'>
							<input type='hidden' class='fieldeditmodal-column'>
							<input type='hidden' class='fieldeditmodal-txncolumn'>
							<input type='hidden' class='fieldeditmodal-txnnumber'>
							<input type='hidden' class='fieldeditmodal-type'>
							<input type='hidden' class='fieldeditmodal-id'>
							<input type='hidden' class='fieldeditmodal-code'>

							<div class='modal-errordiv'></div>
							<div class="form-group">
								<div class='col-md-12'>
									<label class='control-label'>Old Value</label>
									<input type='text' class='form-input form-control fieldeditmodal-oldvalue'
										disabled="">
								</div>
							</div>
							<div class="form-group">
								<div class='col-md-12'>
									<label class='control-label'>New Value</label>
									<input type='text' class='form-input form-control fieldeditmodal-newvalue'>
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="text-center">
							<button class='btn btn-blue2 mybtn' id='fieldeditmodal-savebtn'>Save</button>
							<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>







		<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->

		<script src="../js/jquery-1.11.3.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/jsfunctions.js"></script>

		<script src="../resources/BootstrapNotification/bootstrap-notify.min.js"></script>

		<script type="text/javascript" src="../resources/dialog/jquery-confirm.js"></script>

		<script type="text/javascript" src="../resources/datepicker/jquery-ui.js"></script>

		<script type="text/javascript" src="../resources/jquery-interactions/jquery-ui2.js"></script>

		<!--<script src="../resources/tags/dist/bootstrap-tagsinput.min.js"></script>
		<script src="../resources/tags/examples/assets/app.js"></script>-->

		<!-- DATATABLES -->
		<script type="text/javascript" src="../resources/datatables/media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="../resources/datatables/media/js/dataTables.bootstrap.js"></script>

		<!-- MY CUSTOM SCRIPTS -->
		<script type="text/javascript" src='../js/custom.js'></script>
		<script type="text/javascript" src='../js/main.js'></script>

		<!-- FOR DROPDOWN -->
		<script src="../resources/select/dist/js/select2.js"></script>

		<!-- PRICE FIELD FORMAT -->
		<script type="text/javascript" src="../resources/priceformat2/jquery.number.js"></script>


		<!-- FLEXIGRID -->
		<script type="text/javascript" src="../resources/flexigrid/js/flexigrid.js"></script>

		<!-- COLOR PICKER -->
		<script type="text/javascript" src="../resources/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.js">
		</script>


		<script type="text/javascript" src="../resources/resizecolumn/dist/jquery.resizableColumns.js"></script>

		<script type="text/javascript" src="../resources/timepicker-addon/src/jquery-ui-timepicker-addon.js"></script>


		<!-- TOGGLE -->
		<script src="../js/bootstrap-toggle.js"></script>

		<!-- TAGS -->
		<script type="text/javascript" src="../resources/tags/bootstrap-tagsinput.js"></script>

		<!-- BOOTSTRAP TABLE -->
		<script src="../resources/bootstrap-table/dist/bootstrap-table.js"></script>

		<!-- TREE -->
		<script src="../resources/jstree/dist/jstree.js"></script>

		<script type="text/javascript" src="../resources/jquery-monthpicker/monthpicker.js"></script>

		<script type="text/javascript" src="../resources/jquery.hotkeys.js"></script>




		<!-- GRAPHS -->
		<!--<script type="text/javascript" src="../resources/chartist/chartist.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>-->






		<script type="text/javascript">
		$(document).ready(function() {
			setTimeout(function() {
				$('#loading-img').addClass('hidden');
			}, 500);


			var windowHeight = $(window).height() - 51;
			$('.content').css("height", windowHeight);
			$('.sidebar-panel').css("height", $(window).height() - 20);
			$(window).resize(function() {
				$('.content').css({
					height: $(window).height() - 51
				});
				$('.sidebar-panel').css({
					height: $(window).height() - 20
				});

			});

			userAccess();
			userAccessMobile();

			var viewtobeloaded = <?php echo json_encode($viewtobeloaded) ?>;
			viewtobeloaded = viewtobeloaded.trim();


			if (viewtobeloaded == '') {
				$.post("../scripts/main.php", {
					checkDashboardAccess: 'sd$oihBO$h#OiB@s09#j!@IO#09aujj$Oi03n'
				}, function(data) {

					if (data.trim() == 'true') {
						$('.content>.content-tab-pane .content-tabs').append(
							"<li data-pane='#dashtabpane' class='active'>Dashboard<i class='fa fa-remove'></i></li>"
						);
						$('.content>.content-tab-pane .content-pane-wrapper').append(
							"<div class='content-pane active' id='dashtabpane'></div>");
						$('.content>.content-tab-pane .content-pane-wrapper>.content-pane:last-child').load(
							'dashboard.php');
						$.getScript(pagescripts + 'dashboard.js');
					} else if (data.trim() != '') {
						alert(data);
					}
				});
			}



			/** BUTTON CLICK SOUND ***/
			var obj = document.createElement("audio");
			obj.src = "../resources/click.mp3";
			obj.volume = 1;
			obj.autoPlay = false;
			obj.preLoad = true;
			$(document).on("click",
				".soundclick, button:not('.disabled'), .button-group-btn:not('.disabled'),.nav-tabs>li,#sidebar-nav>.nosubmenu,#sidebar-nav>.withsubmenu,#sidebar-nav>.submenu>div, table.dataTable>thead>tr>th:not('.column-nosort'), #usersettings",
				function() {
					obj.play();
				});
			/***************************/

			$(".withsubmenu").click(function() {
				var ht = .46 * $(window).height();
				$(this).next('.submenu').css({
					maxHeight: ht
				});
			});



			/*var scale = 'scale(1)';
				document.body.style.webkitTransform =  scale;    // Chrome, Opera, Safari
 				document.body.style.msTransform =   scale;       // IE 9
 				document.body.style.transform = scale;  */
			document.body.style.zoom = screen.logicalXDPI / screen.deviceXDPI;


		});
		</script>









	</body>

</html>