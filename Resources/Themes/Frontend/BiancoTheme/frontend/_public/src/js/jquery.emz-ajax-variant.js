;(function(jQuery) {
    'use strict';

    $.subscribe('plugin/swAjaxVariant/onRequestData', function(event, me, response) {
        var descriptionImage = $($.parseHTML(response, document, true)).find('.emz-product--details-description-box-right').html();

        $('.emz-product--details-description-box-right').html(descriptionImage);
    });

})(jQuery);
