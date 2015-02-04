<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:template isApproved="${isApproved}" log="${log}" page="${page}">
    <jsp:attribute name="scripts">
        <script>
            var i = 0;
            var header = $('<h2 style = "color : #FF0000 >').html("My Orders");
            header.appendTo('#orders');
            $(function() {
                $.each(${items}, function (index, item) {
                    i++;
                    var orderWrapper = $('<div class = "well well-lg">');
                    var orderHeader = $('<div style = "font-weight:bold">').html("Order number: " + i);
                    orderWrapper.append(orderHeader);
                    var heading = $('<div> class = "row"'>);
                    var headingName = $('<div> class = "col-sm-6" style = "color: #CC0000"').html("Item name");
                    var headingMaxPrice = $('<div> class = "col-sm-6" style = "color: #CC0000"').html("Max Price");
                    orderWrapper.append(heading);
                    
                    var numItems = item.length;
                    var loopCounter;
                    for (loopCounter = 0; loopCounter < numItems; loopCounter++) {
                        var k = loopCounter + 1;
                        var itemWrapper = $('<div class = "well">');
                        var itemNumberRow = $('<div class = "row" style = "font-weight:bold">').html("Item number: " + k);
                        
                        var theItem = item[loopCounter];

                        var itemInfoRow = $('<div class = "row">');
                        var theFood = $('<div class = "col-sm-6">').html(theItem.foodItem);
                        var theMax = $('<div class = "col-sm-6">').html(theItem.priceMax);
                        
                        itemInfoRow.append(theFood);
                        itemInfoRow.append(theMax);
                        itemWrapper.append(itemInfoRow);
                        
                        var comments = theItem.comments;
                        if (!(comments === "")) {
                            var commentRow = $('<div>').html(comments);
                            itemWrapper.append(commentRow);
                        }

                        if (theItem.hasAlt == true) {
                            var itemNumberRow = $('<div class = "row" style = "font-weight:bold">').html("Alternate Item number: " + k);
                            var alt = theItem.alt;
                            var altItemInfoRow = $('<div class = "row">');
                            var altFoodItem = $('<div class = "col-sm-6">').html(alt.foodItem);
                            var altPriceMax = $('<div class = "col-sm-6">').html(alt.priceMax);
                            altItemInfoRow.append(altFoodItem);
                            altItemInfoRow.append(altPriceMac);

                            itemWrapper.append(altItemInfoRow);
        
                            var altComment = alt.comments;
        
                            if (!(altComment === "")) {
                                var altCommentRow = $('<div>').html(comments);
                                itemWrapper.append(altCommentRow);
                            }
                        }
                        orderWrapper.append(itemWrapper);
                    }
                    orderWrapper.appendTo('#orders');
                }
                
            });
        </script>
    </jsp:attribute>

    <jsp:attribute name="content">
        <div class="site-wrapper-inner">
            <div class="cover-container">
                <!--
                thanks to : http://bootsnipp.com/snippets/featured/bootstrap-3x-contact-form-layout
                -->
                <div id="content" class="inner cover" style="text-align: left">
                    <div class="row">
                        <div class="col-md-12" >
                            <div id="orders"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:attribute>
</t:template>