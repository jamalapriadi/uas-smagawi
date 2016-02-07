
$(document).ready(function(){

		$("a.hapus").on("click",function(){
			var kode=$(this).attr("kode");

			$("#idhapus").val(kode);
			$("#myModal").modal("show");
		});

		var sekarang=new Date();
			
			$('#tanggal').datetimepicker({
				timepicker:false,
				minDate:sekarang,
				format:'d-m-Y'
			});

			$('#jam').datetimepicker({
				datepicker:false,
				format:'H:i:s'
			});

			$('#selesai').datetimepicker({
				datepicker:false,
				format:'H:i:s'
			});

	$("#data").dataTable();
})