$(document).ready(function() {
	$(".edit-product").click(function() {
		$("#fr-id").val($(this).parents("tr").find(".product-id").html());
		$("#fr-name").val($(this).parents("tr").find(".product-name").html());
		$("#fr-img").val($(this).parents("tr").find(".product-img").html());
		$("#fr-price").val($(this).parents("tr").find(".product-price").html());
		$("#fr-category").val($(this).parents("tr").find(".product-category").html());
	})
})