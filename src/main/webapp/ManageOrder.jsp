<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:template isApproved="${isApproved}" log="${log}" page="${page}">
    <jsp:attribute name="scripts">
        <script>
            $(function() {
                console.log("here");
                $.each( ${responseJson}, function(index, order) {
                    for( i = 0; i<order.primaryItems.length;i++){
                        order.primaryItems[i];
                        order.altItems[i];
                        order.primaryMax[i];
                        order.altMax[i];
                        order.primaryComments[i];
                        order.altComments[i];
                        var pPrice = "$" + primaryMax[i].toString();
                        var primaryRow = $('<div class = "row" id = "primaryRow">');
                        var primaryFood = $('<div>').html("Food Item #" + "(" + pPrice + ")" + i + ": "+order.primaryItems[i]);
                        primaryRow.append(primaryFood);
                        if (!(order.primaryComments[i].equals("")) {
                            var comments = $('<div>').html("Your comments for the above item are:");
                            primaryRow.append(comments);
                        }
                        var altRow = $('<div class = "row">');
                        if (!(order.primaryItems[i].equals(order.altItems[i])) {
                            var altPrice = "$" + altMax[i].toString();
                            var altFood = $('<div style = "color : #525253">').html("Alternate Food Item #" + "(" + pPrice + ")" + i + ": "+order.altItems[i]);
                            altRow.append(altFood);
                            if (!(order.altComments[i].equals("")) {
                                var comments = $('<div style = "color : #525253">').html("Your comments for the above item are:");
                                altRow.append(comments);
                            }
                        }
                        $('<div id = "toClick">').appendTo("#orders")
                                .append(primaryRow)
                                .append(altRow));
                    }
                });
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